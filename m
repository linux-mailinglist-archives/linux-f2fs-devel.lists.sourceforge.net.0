Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7161C5AFA00
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Sep 2022 04:39:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oVkyl-0000rc-Ix;
	Wed, 07 Sep 2022 02:39:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guoweichao@oppo.com>) id 1oVkyk-0000rV-3d
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Sep 2022 02:39:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qjQTPSyCiBYotI0T2YBjbk+qznmq/Y1mQ2WMDnGVLbs=; b=D1180sFxZNObO24aw6ek7pubM2
 9ju+9SSa5l8m34oEw33WKwCGU+1V9IPbocsTLhtAe202jX81FiyF6saelQ2gbwBlZhADLWvChDK1P
 Ucnpvjw5h1zwt6lECTjGwRAceqmLphoJ2FSTRtaIK6qtsgMUzneFKheWLuunQnyHHdPs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qjQTPSyCiBYotI0T2YBjbk+qznmq/Y1mQ2WMDnGVLbs=; b=d
 9rkCf2oaUJaQuy3+kp7UlVKHiA34CsKtSYh3CREujikbvnLJ3YB5pHjsR7Wko6GrwluGO/TahrKeV
 nmB5TZyD10GWXDYHMn7Fq3mCwkuWWI+qht56n/OIf7Pl0IlHhwkB0c+ZKu0t3Pbac+PBx3AzpQTZa
 CZ7BIcR9x7JDBVQ8=;
Received: from mail-psaapc01on2071.outbound.protection.outlook.com
 ([40.107.255.71] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oVkyb-000O9s-JZ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Sep 2022 02:39:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WobrUNG4lHBKWq4l3Xuu2NqpRq7pGvD6cH2DfHNapTuJYvL3k49b+Ic6AwGTk0g28OzwsaXX3TVgcYuiTD+puc0spwegNUGb2FXJ006351/AHyavcHszARDSxB3PASOwNYNp+0VBXjZeJIRm/5Gb76iyLkDCZtEixgTmxRjHHkuh3LOYIfwBzXnHqxL0XYXK9Pqga3k2ne6pAsy42GuDGqkkdgTAGJ+/j0AsBaNeJw9Y+LIZT1ny/wSFOVRUz9VB95VnioqWF9iiNl6SAiU5Asd58Zt+vDiV7wkcaR2hTGRGGPDhAES9R8R7AK/WS8Iq5GsGkg4X93lRlCLgx1+fhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjQTPSyCiBYotI0T2YBjbk+qznmq/Y1mQ2WMDnGVLbs=;
 b=Ez07Qt0WmUhmKuYoO9itCNTfHWHZD08WKAHYlyYrD3UPEhBTOxDIKLbXt1FsjNL+0tFvEQcTbYE70oDUFLPvc0UMlfog5EsJmCDUfHd/HXFOrqQJ3z7f/3pq+xl7CUP4WhGuY6jD1XZcaO8rJHyaHGfyPtd+WXLtSB/CHiVKgcH0frPcXezQa8ebphy/sdlRHiahokEzuR6fC8MTqg8m6cVMMKfAshb1OxJrh+FzjcN4X7WvWq599Sxv9hK4TuTS3AmZXhJXDoKnx0Sa6DgbCaHVw9cidyC5qG4Y8rZ6tYSxcjawJgUq3tmiBjjUXfqsBn5H3QW+j+G/2R04PUdSlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjQTPSyCiBYotI0T2YBjbk+qznmq/Y1mQ2WMDnGVLbs=;
 b=ZghSzsG857h528DWi81d1ACgoBLFvzxaI+eAlIPOUPoRBWp9Y5d5A+woAa1fX89H1Fm74UQGPfJTde+q++tKuEA/dmRcEE8naCvU+FFY7N3sY+ovcEsctNcjclmZw3vGtZap2yufOJXYahND9vE+wQW8oW5i7Nmp5DZK+2/KjMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB6118.apcprd02.prod.outlook.com (2603:1096:4:1f8::10)
 by KL1PR02MB4771.apcprd02.prod.outlook.com (2603:1096:820:56::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 7 Sep
 2022 02:39:33 +0000
Received: from SI2PR02MB6118.apcprd02.prod.outlook.com
 ([fe80::89:8e41:a5f5:2877]) by SI2PR02MB6118.apcprd02.prod.outlook.com
 ([fe80::89:8e41:a5f5:2877%6]) with mapi id 15.20.5588.017; Wed, 7 Sep 2022
 02:39:33 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed,  7 Sep 2022 10:38:48 +0800
Message-Id: <1662518328-4925-1-git-send-email-guoweichao@oppo.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: SI2PR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:4:197::9) To SI2PR02MB6118.apcprd02.prod.outlook.com
 (2603:1096:4:1f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbc01d65-3780-4ad9-8f7c-08da907a328d
X-MS-TrafficTypeDiagnostic: KL1PR02MB4771:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vCUdYMxdnip+DF882c/TVUVbntA80oTGMSV42FVdGwY7VNKwn7214aX/g21kDVmHZpTNHjpmqL09DMH5kJvcliD0Z+aqECZFmlMrJuuWOanD5DWdC88Ug27dbg1zSNTK2TqrEyerq+7wvX3gXjHpcz5sH/tQ01Lmru8a3IQYpnOoylYm+rQA8eFw7bvIFpOrLpnO0nEiktmDAN6QYsUXDfloZKPAF5MYZDUKjfKg2t5tPIaLVw1XEf/a1yRFDpOEnXwMyKgFVQSJUwn81g9MthcplB+QokSfKH958X1S2w4E8NvNGfszK3wJfrst9cKgyjVL7SVvIKopkjDbv1KOZ5SHM61LvvFdNejSYM9gt0g7yEvZsm4+L7oUDp+hdWJygb9E9zA0Xdns1pAMM7XHrOya/DqCknqeaDFmSs6XMkHqDWrEHDe2JL1cgwjGW2ULLBg8ZCrFTEY0bM/r4TrVbPXGWZmqImwph5zQdyeY2QwAJW5Gvzrh4N4LY0HGKNLivPgF/B9V+/btIFOhO/bfR3s0uyv6oBmMG/+QLdAcm372H1zXBhM63E9ciP7Nn1WSDh5lG5yAsHy4DhljEXliqeWugzIrJX9vlodhRv+zTiXD+SKWpcciTAdvKhDadT8dnWMoy37uw7f9DCzAiwGJDTJyIiHaqf0jYRrR+XB2A367G/BFo63ZM+UCbEqZl0GrpMXR95+gsMHTv+Ys7j0Cxe2Bu8DJyG1e2FkGd+7nJheWzJvuBYeuWZeFUEfuuHE5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB6118.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(2616005)(86362001)(316002)(41300700001)(4744005)(66946007)(6512007)(4326008)(6666004)(8676002)(6506007)(52116002)(5660300002)(66556008)(107886003)(2906002)(26005)(66476007)(83380400001)(478600001)(38350700002)(186003)(8936002)(38100700002)(36756003)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XNfi/+nnxf0A6h+dehU32XDMtQVVST3V+J+/FWjtIU71p7pUcjILRzW3k1Kh?=
 =?us-ascii?Q?GYUFtMalAq34hlSJ4MnNFIgKodfvS87YrzuSj+IsobxqMSip69qqWekPJZE7?=
 =?us-ascii?Q?jhUmrXgPtX2nIOHaJcADzdA1TnwQ0nI+I9mgOOzqfO+vGgyCjetTlu6MEwC6?=
 =?us-ascii?Q?W/Z7Iy7fSFs7RmzHjcLNxvUH29xefqQVTjjw5W9XAqBpvF/IB7KUu781NChA?=
 =?us-ascii?Q?dl1KegHMY8HLfkmkTPC8V+6fDD3KtPzOpNptOQAm7cMpT1MFK6IXnKai70sh?=
 =?us-ascii?Q?UmOXPGXamKBUatFbW8mSvN9I6Oc+tYTglmXgB5zDrW0ni3et5YdeYKyQAlNR?=
 =?us-ascii?Q?5pfkwfjuO0q/WS0TqA0Uy7oOvRwJUpp8+UQkOX5pJeiAIhd+b0ZyHdCSvQsC?=
 =?us-ascii?Q?wC2siFv806c/UxILz54lGwsYs/kGv66fd8pZbXcyJcH7wW0Q40ffqa3hR4hh?=
 =?us-ascii?Q?PRKVmK6NRIzCRm87t2wWoQxEBFsh32jjOrsmC1je7+k6IA07AqQxTau8CQwM?=
 =?us-ascii?Q?JmfJPyJ+SgG3ARn4jYGDt6KuXE/OuiVvkf98EgKrWU/CgtFajnSX8pL3CmKI?=
 =?us-ascii?Q?/MYUTU0LHi2JJdMpB/w7G9db/Q4fNSXci7mjmfq/Ny4zP5sboxILwMt0K+9u?=
 =?us-ascii?Q?yUhUw9QLFWlZUEV3oj2blxu+saNxvn2J6tB4+jilEz3SVw+tjzV4mAd7fRzn?=
 =?us-ascii?Q?rJn54NY88y05WYY8juiV2zUnjld5PCFl6UbZ6sqB1dgCMUugFCDzoh9UBQoE?=
 =?us-ascii?Q?loq9Hj9zSlIn3606+pdLW3TiKq3PdQdd/BV6lPIEEarA0EuyXaDPYFbzf3Nq?=
 =?us-ascii?Q?uHJQU8zkCcb6C7cISV8t9icZk5jc2PyUMwD/RHm/J+w3NnSTo8R4QDyhoMQ4?=
 =?us-ascii?Q?xwqRt/Yh/r/Uroj7qVqPWK0WO3qCmaREsVvR3JWjHtByqeU3YOyEz+Ejb1s8?=
 =?us-ascii?Q?18zx18O+E5HK0NhhK19SNeneKSX00o0MDozjUeVWtTEE/f9HsoF9LvZgEw2C?=
 =?us-ascii?Q?DffFb/rUfLPTnBXkv271U91vlw9stI5we3If8bA/CZmpeETMDfe9Sidoa2aS?=
 =?us-ascii?Q?Dp2pAe+QgLYOambh7v4Q3EooopcNA3DiBKoM8ZEmy4B91+BmkG8NbJBJeYz8?=
 =?us-ascii?Q?dX9RtojzdJiryW4KG4wle6ZcHfMIEZLU3jqL3PKFrru8to9EUJmDRRQcM5mU?=
 =?us-ascii?Q?txNwXaCpFjo5xl/6Nro1bfVGiQbTSH7WVKwtWNGtqBJFnDJmiktP53ISnigG?=
 =?us-ascii?Q?uzfk2CP8IDOIRMZ0zTj/hxuHLQWCL0mHsOZwkMP+0FadJGQuMHknfrIBNaLZ?=
 =?us-ascii?Q?Sb+xuZ5AEZZEsfbGy0iJpfzM9ue9ZbBm+qGAX+rPdSREamA0tJIaDBxKW2F6?=
 =?us-ascii?Q?kxyxfnLWGNIs1bCZt5l29rKSs2oNVLsw6j21utbS5/2yiSNz6JzUVNwhrKKh?=
 =?us-ascii?Q?l1xnZdxJAEpEgVbokiPXCrR36+gCspL4VS0qZ+kU5fJ2Js60gNYwxxN3EJDw?=
 =?us-ascii?Q?rOMJP8PTx9QqfkzLu39qt3HydDleTz7TQxzadxFEzQmyQW2SZkabjmirufZO?=
 =?us-ascii?Q?+h2qDiwRJSZht3+eiOtXeQHmC2SFyRexXm/MBJKts0Ndp6+fnCAp+y2LDIPj?=
 =?us-ascii?Q?Tg=3D=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc01d65-3780-4ad9-8f7c-08da907a328d
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB6118.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 02:39:33.6769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7A/SXq20guqld+uOBkgwrYpK6l8gMTDBqr9Xxj83npK9lwlnWNw65HWbV9JhLqtUCiG6it1/6zws8UufKrtv6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB4771
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Cold files may be fragmented due to SSR, defragment is needed
 as sequential reads are dominant scenarios of these files. FI_OPU_WRITE should
 override FADVISE_COLD_BIT to avoid defragment fails. Signed-off-by: Weichao
 Guo <guoweichao@oppo.com> Signed-off-by: Chao Yu <chao@kernel.org> ---
 fs/f2fs/data.c
 | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.71 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.71 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1oVkyb-000O9s-JZ
Subject: [f2fs-dev] [PATCH] f2fs: let FI_OPU_WRITE override FADVISE_COLD_BIT
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: Weichao Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Weichao Guo <guoweichao@oppo.com>
Cc: zhangshiming@oppo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Cold files may be fragmented due to SSR, defragment is needed as
sequential reads are dominant scenarios of these files. FI_OPU_WRITE
should override FADVISE_COLD_BIT to avoid defragment fails.

Signed-off-by: Weichao Guo <guoweichao@oppo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index aa3ccdd..97b75f0 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2543,7 +2543,7 @@ bool f2fs_should_update_inplace(struct inode *inode, struct f2fs_io_info *fio)
 		return true;
 
 	/* if this is cold file, we should overwrite to avoid fragmentation */
-	if (file_is_cold(inode))
+	if (file_is_cold(inode) && !is_inode_flag_set(FI_OPU_WRITE))
 		return true;
 
 	return check_inplace_update_policy(inode, fio);
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
