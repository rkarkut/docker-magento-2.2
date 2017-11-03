<?php
namespace GetResponse\GetResponseIntegration\Controller\Adminhtml\Rules;

use Magento\Backend\App\Action;
use Magento\Framework\App\ResponseInterface;
use Magento\Backend\App\Action\Context;
use Magento\Framework\View\Result\PageFactory;
use GetResponse\GetResponseIntegration\Model\Customs as ModelCustoms;


/**
 * Class Create
 * @package GetResponse\GetResponseIntegration\Controller\Adminhtml\Rules
 */
class Create extends Action
{
    protected $resultPageFactory;
    /**
     * @param Context $context
     * @param PageFactory $resultPageFactory
     */
    public function __construct(Context $context, PageFactory $resultPageFactory)
    {
        parent::__construct($context);
        $this->resultPageFactory = $resultPageFactory;
    }

    /**
     * Dispatch request
     *
     * @return \Magento\Framework\Controller\ResultInterface|ResponseInterface
     * @throws \Magento\Framework\Exception\NotFoundException
     */
    public function execute()
    {
        $resultPage = $this->resultPageFactory->create();
        $resultPage->setActiveMenu('GetResponse_GetResponseIntegration::rules');
        $resultPage->getConfig()->getTitle()->prepend('New rule');

        $data = $this->getRequest()->getPostValue();

        if (empty($data)) {
            return $resultPage;
        }

        $resultRedirect = $this->resultRedirectFactory->create();

        $error = RuleValidator::validateForPostedParams($data);

        if (!empty($error)) {
            $this->messageManager->addErrorMessage($error);
            $resultRedirect->setPath('getresponseintegration/rules/create');
            return $resultRedirect;
        }

        $storeId = $this->_objectManager->get('Magento\Store\Model\StoreManagerInterface')->getStore()->getId();
        $automation = $this->_objectManager->get('GetResponse\GetResponseIntegration\Model\Automation');

        $cycle_day = (isset($data['gr_autoresponder']) && $data['gr_autoresponder'] == 1 && isset($data['cycle_day'])) ? $data['cycle_day'] : '';

        $automation->setIdShop($storeId)
            ->setCategoryId($data['category'])
            ->setCampaignId($data['campaign_id'])
            ->setActive(1)
            ->setCycleDay($cycle_day)
            ->setAction($data['action'])
            ->save();

        $this->messageManager->addSuccessMessage('Rule added');

        $resultRedirect->setPath('getresponseintegration/settings/automation');
        return $resultRedirect;
    }
}
