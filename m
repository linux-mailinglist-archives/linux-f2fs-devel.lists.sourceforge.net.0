Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEE86C0015
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Mar 2023 09:42:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pdoc7-0004N3-Vd;
	Sun, 19 Mar 2023 08:42:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pdoc6-0004Ms-8R
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 19 Mar 2023 08:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I6Q21IYBQjn5QhcxshRu0Kue11o9uiBgYrm7Mp0AiXE=; b=N4hKgISg0cS4dKEUPJP9+uWjyo
 tdFilEMYi1Erg7oF/eereu7gb/F0v6vHW+WAmebmYSyVK5W++huetL95AjmYvbpbKSNYQrPB1281X
 s06EHqlXrHvtLPpm/aIPJ2kqE4bwGfkjNwuVz8vyMirsQlcWOHn3xLSSIdXDPpkwqgoM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I6Q21IYBQjn5QhcxshRu0Kue11o9uiBgYrm7Mp0AiXE=; b=cq6iypPRDvNjG564HsJmdGZEp8
 +ObA068Pipj+S9ZEvIJInTlAi7G+DLh5x4/hFILi1QPKFFjHE9vDA+Vwnuj2VBqSi6m90YfHQwOUq
 4OZFp3D6VfOyprTL0TrLMyyorG7xVJ0sPeHOCac8j6r4IGkSWuchaKQ04kaAWbqww9U4=;
Received: from mail-sgaapc01on2113.outbound.protection.outlook.com
 ([40.107.215.113] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pdoc5-00DMF7-5Z for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 19 Mar 2023 08:42:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DineZIK2HUHWyVPHGkkOzvrnyMsQqGr1392+YPJf/zDFVDEjDYCJWgG7OttZPjt+/qfXmFCMjp/32pPwu6jcukO+4kYYry4HF0x0HcgUrbAscHOnqNVSgw7C47lDmEykZqWqOn3AMQVRsDJJ7woTcCcNtacFinfQhnB5lEaXyUPG/KDsDsKeilBv6mbZhjWEFZIlPLkDdMBhuo6YdSl5Qtpu38Pqoh6bxQpkohOFwVZNkQCr2HqpZIhD3C4qRYgjI2OjJUAYaZbRhYM368N/LWYQUdYZFs8SG3XA9JgOywn63X0VarSqIXIoZ02mIhz2QBmrVkObIhR4NdWSf3UAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6Q21IYBQjn5QhcxshRu0Kue11o9uiBgYrm7Mp0AiXE=;
 b=jQIPhfOGIvX2ri6MvikD/NnIe2jS6sC2FZbbndYGLWzQUjalD35c7RXTFf+F9Iq9abePw3uexl0nt5dzJuton+HQqHoP2Vdiqq5/3+5Zo3yAcrmKybVMFuaHtPzSH70CwID+yEefB4t0Pj1eOrsnxSiKkHbhzFCibp1gyfgXiZb9ud4ZFh5GmmX8rolZznzp5Auq0T3wzBGnTEA/pFmFCT0ly8hcniCNyD5y4Nq+Nf5y0gnmNLeyOWnRgwfgUcqzf2iJLe+HaHoITqeoVwSeQ12tbpjvEBcnXFhM0126WcGZV8PZYDggtYt11VrVR7DsK1p7CFpcibN1IpLfdE7PPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6Q21IYBQjn5QhcxshRu0Kue11o9uiBgYrm7Mp0AiXE=;
 b=lBxME6GXPRPM6CH0cPBWt7OOZTVAJ9wHy3ZCtj4EsFF18+JhP2mBsJ7vofvBWXycD1orJSP1cB8BuEd+3oB49941u8DYNitgFORwwarwI3QyCPRe5/qqs6qdVnCRfTRpbhKz6UaVQczflgYglqSAJ7Vp/jMwSaiqUZialzI0G+/FhajF1hiJck/xW5gwUzgvH3EOHH+iM+StodZUhoweckPUaS9RY4hIceq85pMevkuE0IgF77fzE3dyFo7Swjs1Nl4gL4C8Wb7ad5M0caUtr5jA1Dj6BNk7CGxzXktq9NcNR+ViroAkuxOl+Hnl17yGNyUJktWbYRbsvMwoEFYuqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5350.apcprd06.prod.outlook.com (2603:1096:101:6a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Sun, 19 Mar
 2023 08:41:50 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.037; Sun, 19 Mar 2023
 08:41:50 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Sun, 19 Mar 2023 16:41:25 +0800
Message-Id: <20230319084134.11804-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230319084134.11804-1-frank.li@vivo.com>
References: <20230319084134.11804-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB5350:EE_
X-MS-Office365-Filtering-Correlation-Id: eaef1371-4f45-44d4-b998-08db2855c85e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JW8U3pOOGeQJtN3cmjQuRvYDop+NKVoeJZkD61iqLmLywgBKcxZwRi8x9uTjgMbGhVHagZgdZAK7CJYPhR0/w9/DYc5xPZ4iVAOcW7as4wST59O3RCmk/x+Pbxf4apSJdR9gZPKBNzDlqc5gcpI7SzYYTPkyVhLIA6aUgfMXBfXQX74TjZaTZhfUgDcbpQmILKWu1zhCwWQmJIRjoSMdVABF4AhhcL0X/FowW95oi0RBUdV/mO2c8lJJbyTwlz3bbarOO9TPUEwW3Swk+1x4ler+0MX5wE20uMVzM31Ir+mP3y/BeV/hwhH6uSucvnlqxlAW2e2VRAyBg+vQQdsdn91w2tc0guZhHxDWDycuap4bA45wPJkExcAVmHmlN7HtrYx0NJy1Y/Oyh3HzAPjqX3aiak20w95vmpDBRbAnpelojTQwpGuPmcRUs/D3OxiADjfyYkKqYQDVgc4SaSi4aTe/4pXCUfyJmskeCRFrje+tYztQPiKnwvoo1cqqU0etvHMMTk+5zGLLFZ96sJJR+PdlmyOjPQ9N7V+aHmHiSMswlPue4ua12dsWyYNNeU+kEAaj/zePLOchPgCFdA1jpQxnuJMtaCGd2fu2c/muMChRNBeih2tuypAozYW91/gWyb6W2+uW+4R8IGQ8t+mQhfxPhBQbuADmpNCW/WAvcei5jIDQzbPuA157HEaM0hjkJgJbvfsGkSZUBQ5pRqeyoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199018)(86362001)(36756003)(52116002)(83380400001)(316002)(8676002)(4326008)(66476007)(66946007)(66556008)(110136005)(478600001)(186003)(26005)(1076003)(6512007)(6506007)(2616005)(6486002)(6666004)(38100700002)(38350700002)(8936002)(4744005)(5660300002)(41300700001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qkez6sNTJJ3Zt6MpwXWhW92ABShVUgNxnaauqpsGF7rU9R9Qp873H7OGJjz3?=
 =?us-ascii?Q?8aYvJbXx3Ct6MP1eOkJVy5mrzEorpOAQd43PsLQDpSCmhAFxRnL2OWj8+uJI?=
 =?us-ascii?Q?1FYuSIEyQ+aHPE5vPsm+2OJEj0Y/ex066LYpIjHVyA+UbnXN2kjIuFIZaEuZ?=
 =?us-ascii?Q?q8wUE65cwUgNc9pfeJ6lx6GyCeSGqGMGsPEUPUiDZQTrwn/i0aiZ6mnWbON+?=
 =?us-ascii?Q?KzzqY0cPGXHOFQlVG4yr5WGG7bBWF4AB+FCRDriugJhe2pPykVs7RxM0mJK7?=
 =?us-ascii?Q?4f9B2OQ6v1/qtiJ/p0B3VDi00twSHGm6XkHmEPBT4t/9IF71JEFLuuzq6CqQ?=
 =?us-ascii?Q?ZREyOAJuWJMNoRX105OC5r57IBJOhlYBJRK751rBUWbqkkEfd5eJtCR1pU6B?=
 =?us-ascii?Q?wvrTMkBiCcAVTk/eQvYqabiS2oA43ZKWyYz2pcfE8Mjd1tG2OOiwqXxpib5S?=
 =?us-ascii?Q?tCDpieW9a6cw1jj0GUlLvFXZxToN6qMRw1svEQ2334mlcneDS5N6IrYkOFXW?=
 =?us-ascii?Q?GOwilTXwXF7JDbIcyUCtBj8mAeQ1OYVwDKZznbW/A/IZKi8kfIYFTkkkbR6B?=
 =?us-ascii?Q?WAI05eFWsqbX58ICs3n5J+n1wwP57oOGTR5OveUw0LTWcnktuxIfahAnBe0F?=
 =?us-ascii?Q?NLgfSAKKYKzLau80fj3QqZMTbm133T4ez7kDQazaMMIXI20q8emGmuZycoTD?=
 =?us-ascii?Q?C3K8z1bGoZWTVYRAM5UFUVbNR2Ov6zgqL75h82G55NfhPBy3S+BPuOiZvpxZ?=
 =?us-ascii?Q?XkEkaE4ZyH5c+B886DQGGr7j6NgdiewBgTJQBWSw23/oPnHzEsxnOhQSkCqN?=
 =?us-ascii?Q?14waoWml+BM0L58C3ZpkZH9w9OSSlos8mKPxZY8DewyZZkZUGGqs5jZvegno?=
 =?us-ascii?Q?2Kfu1ToWrfk7p6n6DKM0KClG+BYPa2ypS323POilPztHkcv8zamdeuqYETJs?=
 =?us-ascii?Q?5CbSqsSOwPeXyl98m4t+ADD0HvhurnMDtRfX3Q9fa05Kr+gs7Z94JQUeNskS?=
 =?us-ascii?Q?pXQbQ24nO5/cloqpdlhgOf32hCgGi49srYKEbA3XnpC0ZWHS1Sbcm35b5mcD?=
 =?us-ascii?Q?lO61eOYdYTscqrRCz5apLptC+vmBx3ZvZaTCHjFVkjEcq8vdyTZPXnCQb2dP?=
 =?us-ascii?Q?KWzE5gDmoB8Mju2y9mlESs3u01OYGs5Bx3KpAQsD733xyXE8QbPCT4ZbpqiD?=
 =?us-ascii?Q?7PyXnmSjICH2mQoolh1kAndXwV+eKcViIqnbF4/pd+zzNIZDFQ52dgwmmg6F?=
 =?us-ascii?Q?EppcpR89TJQtOdkcACbll7uR0nub3dr8HQrnN+/uVbI+sFchY4WjWPv0cX8R?=
 =?us-ascii?Q?Uwy7CsTmdmIlI8N0s2LzMHkeG7saJzLxQ/gHprKymq98siKx3JpKB9bCeR29?=
 =?us-ascii?Q?fl9l8lppivj0VFVDCF8Ctv3CXrNLF4gmwQoKK6bIIQSR9aE38mecA1iFTt09?=
 =?us-ascii?Q?rTknJwUbiEAIbTcMZH+sZ2kIdBo3DV7KwFgj46oRoulxzIHgJHcaep1IFRAj?=
 =?us-ascii?Q?oTz60gKN0JLuXucr0SKKI3yT1VxOx1iEKQEm4z80fMOy8c7tdxYYjyVn6XHT?=
 =?us-ascii?Q?s6xqLni0+GhD0eZyWKCreHEyomYaR5Hygwf48uuT?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaef1371-4f45-44d4-b998-08db2855c85e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2023 08:41:50.3601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vB7CjvYfHxGiZaQuiAqf4XQRUKtEfnndVYNdhTK3ucsjRnPKRFu/1qTpv0ydHUMC7Eym8b7vMpn6MmQ2v0xQpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5350
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Use kobject_del_and_put() to simplify code. Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- fs/f2fs/sysfs.c | 9 +++------ 1 file
 changed, 
 3 insertions(+), 6 deletions(-) diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
 index 9ddc6ee19433..b455afc12cfc 100644 --- a/fs/f2fs/sysfs.c +++
 b/fs/f2fs/sysfs.c
 @@ -1478,14 +1478,11 @@ void f2fs_unregister_sysfs(struct f2fs_sb_inf [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.113 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.113 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pdoc5-00DMF7-5Z
Subject: [f2fs-dev] [PATCH v2 02/10] f2fs: convert to kobject_del_and_put()
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use kobject_del_and_put() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/sysfs.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 9ddc6ee19433..b455afc12cfc 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1478,14 +1478,11 @@ void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
 		remove_proc_entry(sbi->sb->s_id, f2fs_proc_root);
 	}
 
-	kobject_del(&sbi->s_stat_kobj);
-	kobject_put(&sbi->s_stat_kobj);
+	kobject_del_and_put(&sbi->s_stat_kobj);
 	wait_for_completion(&sbi->s_stat_kobj_unregister);
-	kobject_del(&sbi->s_feature_list_kobj);
-	kobject_put(&sbi->s_feature_list_kobj);
+	kobject_del_and_put(&sbi->s_feature_list_kobj);
 	wait_for_completion(&sbi->s_feature_list_kobj_unregister);
 
-	kobject_del(&sbi->s_kobj);
-	kobject_put(&sbi->s_kobj);
+	kobject_del_and_put(&sbi->s_kobj);
 	wait_for_completion(&sbi->s_kobj_unregister);
 }
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
