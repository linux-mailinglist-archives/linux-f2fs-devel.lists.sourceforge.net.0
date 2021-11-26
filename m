Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2903045EB34
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Nov 2021 11:19:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mqYKa-0001Mb-4m; Fri, 26 Nov 2021 10:19:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mqYKV-0001MU-04
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Nov 2021 10:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ml5Xin613UfEjE2NDYI0wYkq/5nag40NaaNtbedI9Jc=; b=b2wvB8ic2TzGAR7weNMNjnajqU
 bty9d3Kv2X1a0mB93JvTiLjA3kp/2JHDocv3SuLQVFDEWhO2CbxpsIlLi91EjjTtjY5QP3qGBanFv
 J0VrNsgCrnpbFLckqn2iqbGk/Z/UdUzZKuBBRHBucx4EEhHotNqS20+eqNVqClP+RVRA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Ml5Xin613UfEjE2NDYI0wYkq/5nag40NaaNtbedI9Jc=; b=g
 WXqIxyDafFtIFty5IUllmntAfT4eM+j+e2tBrcffC38RJ6H3Ta+f/PGLiQdSw4c1VNc/5Zhz0U+4T
 W5uuxdiZnC4DWGrrA06Fu08lA4IHIFYOOjD3WQQ+WGAkDLUzMJEE7EAWvrx5fjawGDC0UJhPPi/0p
 yA0TsntYvppi6LIY=;
Received: from mail-eopbgr1300093.outbound.protection.outlook.com
 ([40.107.130.93] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mqYKO-0007IQ-Rz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Nov 2021 10:19:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4npZR5oDzUlhkYfvSeDY7k/tJGyscHMxmmM3K2VRwDN+HhKRRQj5FsmG3yxhb2FN2Ow50o8Z755K5B2ryam7Tjziji795l548iYoEatsaW+2rc3uyAhM+DUFbRLaXl4hN+5LuaugaIQ0Up3eKIpL0B74vxkbb7IQ8EgBkXCvTLD76Ab0Ugbah9WJvD8Z6QG0Sp5WJAN9mkvsSTJl4aYUbN4gt6BaQzFC4WkRkQUaNxfvwuKkq5F8rGPGclJ80XF204XAYC+Q87l522F2+QRccqBoDoaEmc2O6KswhC7hX/E/45C4MpZOYb4D+iCSUc71Vpk9AFXZikRelz1IT+qzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ml5Xin613UfEjE2NDYI0wYkq/5nag40NaaNtbedI9Jc=;
 b=FeK0ichadXmPW60HNGMa1epDljuW6EEtP3UZ/0eq+4lIzzOLnNtyb6iXQAsVNKtQTjIUevNp49UBvkqad2ydzSyl7dYynU4Osx0SACIXlJx9CftPQFqevQiqcWlSnyTzhpQEUSuZJByXKzQzUEctAifNnbYW7JZkXVW1my+dwX5GrQEPQ1ICP0WOpuSRQ63Ea90Em8SHR+9Bx9H6Z29PozB3xHw8ylqWlIgQKcfc5gzc5obpsXLce0wOF8sQjVHv5qvj5aFg5ENrB9Apf5Q0+sWtGo+nFVIBW5tnyVVcwh6l/g3BCjmpm1tPLs00OAnqcRYwFTAvl7F0OxY1IGvrBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ml5Xin613UfEjE2NDYI0wYkq/5nag40NaaNtbedI9Jc=;
 b=KbQztPIamovyV37rQExK5MklnkJSXs6yPC2+VEogbbJpJTEoWw42WWvei1MVj+KSTj/C29M+lBinJ7IaY1+/VDgygEqJ8uwxZx4WSBXA/Z+9dFM9wF60fnQEbzmXrWTVBa/fCn6a/ltFgks+brU6OJSbIRsJMpfCnGcrL8EH6kM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB3861.apcprd06.prod.outlook.com (2603:1096:820:1a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 26 Nov
 2021 10:19:29 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%5]) with mapi id 15.20.4734.022; Fri, 26 Nov 2021
 10:19:29 +0000
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 26 Nov 2021 18:19:19 +0800
Message-Id: <20211126101921.305013-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: HK0PR03CA0119.apcprd03.prod.outlook.com
 (2603:1096:203:b0::35) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 HK0PR03CA0119.apcprd03.prod.outlook.com (2603:1096:203:b0::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4734.20 via Frontend Transport; Fri, 26 Nov 2021 10:19:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41ae19af-9c8b-4245-c498-08d9b0c63ad8
X-MS-TrafficTypeDiagnostic: KL1PR0601MB3861:
X-Microsoft-Antispam-PRVS: <KL1PR0601MB3861D1442914BC94C5CB6D7ABB639@KL1PR0601MB3861.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uX1NcDeE6l6HTDpwhycTJTIOdEIzmO23wVyQNN3VA/sZlSeeqJncSj1m2Y2z1HYW8dU/LUfYue8MtPYAJ9LLUoiS9etAUwJdyUXh73kkQRF9F91SFHSJvenTdjJ3cDTinjf3fslEiras4RlvgrGj2MGSrsYT8OTMXLHFFzRptl0B9s4swOL5vP/GFOk9cs1LS0Dd+BvV0THCTEti215LHragTFd1Tw+fSBmC+idlHNUgwuBkWsdWKd+CGJaCVv5QWGPN6VwCQRkOV1ouNQd5KlmGV3XMm3UDUCm5q7vn0a/Fzgahoo0VwtM8dU7G0r59U6Mom2u8tgLHwX77yX0GuqlaHFR7Mxgu6QyA/NFoVEhQrokrDs57X2KogZM6pA+sVzevIjV1a8SI2gvM3iQDqWQWLVMxT+EJNgoSlfgl5p8xLmfmMSfBmOs38V9M+79d6SiJ0J4A6vDEvchyC3OBMWf1RO0kxD+3yipQ0+a5KTfZCfgBeeGKgZmHfvhgho90k+EMvnDbx6pHG+NgVdWTwZiQr/JuzdDwfiojeYlaxGFiQeqwKcmKFi4CKTJtNotI5T40q0oO0jM9JjoraUfEMY++EWwvO9tiVQ2D4ig1UIXmGhgeHwtm2V76GrrML+nD3IPDPgmCxQ4S8XHy+reLBOyKPlVSXMa68YQ0NPFEUyMgt3MyeheZm3M3GsrsbudYLzyynL2VtZC/f7e2IG05NDt8SQXbrTAwF/gcS0w8FfM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(26005)(956004)(86362001)(36756003)(107886003)(52116002)(316002)(6512007)(66476007)(38100700002)(2616005)(6486002)(38350700002)(5660300002)(8936002)(186003)(8676002)(1076003)(83380400001)(6666004)(4326008)(2906002)(4744005)(6506007)(66556008)(66946007)(182500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E7KgUbiPFbiUXaxaBnUFvDmO9eX6Cuvq8sg9FCjZJ3RHf0wOCPR4gWMNt+Ii?=
 =?us-ascii?Q?AfAaaAdShfauwce6zaGlzf6KmDuoMv/ePdXDCnHZlxq62PS/lpHh9vB4V9Rd?=
 =?us-ascii?Q?fVB6izZsLTbzqMGl14vOSFLlXeWIr8qQlPti7ZHPGrAi52VktqP6R90eJZUB?=
 =?us-ascii?Q?b0sV/QY4wQwWpOTvYfd1yDQmjpTZBWP2v/wHWs8VyTDCBo5hu8j/PXBkZNsZ?=
 =?us-ascii?Q?atF7EPUcCV+kcCQx+aK+2V7CjYl1JyMWsH5XtoWozGKuXNnRduEcHU7jktrl?=
 =?us-ascii?Q?hm8HsIrNW7P2s06sLR6E+IGtt5wxu+trr479Vgd901nMqG7VAvBu+mK81gzx?=
 =?us-ascii?Q?IS86M4TYq8INyquH865K5vJ399I6cgC4V3mxVpGyocbToxFNRrT4fKEPt1VC?=
 =?us-ascii?Q?mYq+yXa6hQkchWlrZuTE6JLThgpAjAHfFWvPvpWupHHM1mw0+y9gVZU5Iqy7?=
 =?us-ascii?Q?WY+M9WBJSTkgGnxNsYEt3/Fj+zBhmLy7KZFDUItBKXivJEYu6AqPrqBrSy3+?=
 =?us-ascii?Q?b2gZkH2lM5rUc9+8Tqpr2RvLY5HVYjOxwH2IN0XlJ6IvQrgPZfdCuiHUEcA0?=
 =?us-ascii?Q?IYhMrB4rGqyEuVrUHVdXlKN+dAtvhnPnKSBqamAFnvImI2cg5i4NknTnCgdq?=
 =?us-ascii?Q?risQSlHeaYjMMB0NiO/lRIa8DtWTXzcy6GqM8g3f/1w9LFOzrKpToVKkGwzR?=
 =?us-ascii?Q?oaIk5QVNXELg+ECe6MLKs0LZXRtQKAVxDpxVdOKjHbJa6mHZvhpj0UHlKin5?=
 =?us-ascii?Q?3S+l9igzatYerOK/EJy8O/ssdTqtZYxhRYu9a04vALV6tydfBQW7dSXin+54?=
 =?us-ascii?Q?m+c7txDwf7eIo+CWWFbzRI7DOQocWlXN2fbwcmP3Cdaq24jyL3cKvY3kTxrM?=
 =?us-ascii?Q?tH8Bp8EwXHS+m6FIxSr4/8tiMZi7GOGMN6nM7/hn2YlLTBhVP79pCxC61HQt?=
 =?us-ascii?Q?yfUj5KBx1xKHoC9qonZVbFCwF+i/0twiHYr0Uw2yiNjwQaxSyAXKLq+QJ1ID?=
 =?us-ascii?Q?1mqFWdOIXwDTHSY4PjztU5egJrtVfx7sgkSWUQJ+68+hAXlVI4lfmmQW7XRX?=
 =?us-ascii?Q?zQMTtXfdDrVfnZ18PZUzCX/It5kTW30fI3g8dawwXh3ESvjXiMQxnxUcFBOB?=
 =?us-ascii?Q?JVb1GdYmwb5EHZqxYoUvkB4k8KYOoHuuHlpL9Ar+mdxKNHd7JO9kZEYy24Ux?=
 =?us-ascii?Q?8UIZ27g1bn9JGpzH1Nokcmj4umbTBVXjwDkIH2YUo9+UHQVzWzB2ZcsLforB?=
 =?us-ascii?Q?ax7/VWAyxgeaX7jM3hR48ALMbjO3eN/mEJq4mpPBZEgJ2bMRf6CPNQf4MX2l?=
 =?us-ascii?Q?46P8a/pe5RxWsiSqqhRwXU3V+2VR+DNTEJHKibPKYnZTVPz4M6kq4IKxTpcX?=
 =?us-ascii?Q?9EfjprYaXX+XAy7aqjNfDvN4s14k5UKKO4i4w2QPJHk5aVB142kmT90khDXY?=
 =?us-ascii?Q?3LjMiKthF+hQafMgTrUd6FSt6/qgI19GU9chIAC062+VDuC+HD/pbt0Ozunm?=
 =?us-ascii?Q?d9zK+27p7mk6gLs8NpUTiV394a19KnXhT4pQwNolgx4skd7mDFHwlPKoaOF/?=
 =?us-ascii?Q?DC6/KxEuZE3GRsCYlCAyzYGUXcGnDKCy9F5lCX72odstIy2En4DToGnlIzks?=
 =?us-ascii?Q?UGweJAl+gWV4O0uVG5wfXec=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ae19af-9c8b-4245-c498-08d9b0c63ad8
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 10:19:28.9004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vFjYixPe5A2lGUywx8XluuwRdj8Jw5ciKNz6z9RCdgK9W0fOqkPV4zyQes4pFStK0kndcl81QQhJXJzneAjqbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3861
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Since compress inode not a regular file,
 generic_error_remove_page
 in f2fs_invalidate_compress_pages will always be failed, set compress inode
 as a regular file to fix it. Fixes: 6ce19aff0b8c ("f2fs: compress: add
 compress_inode
 to cache compressed blocks") Signed-off-by: Fengnan Chang
 <changfengnan@vivo.com>
 --- fs/f2fs/inode.c | 5 +++++ 1 file changed, 5 insertions(+) 
 Content analysis details:   (1.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.93 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
 1.0 FORGED_SPF_HELO        No description available.
X-Headers-End: 1mqYKO-0007IQ-Rz
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: fix remove page failed in
 invalidate compress pages
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
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since compress inode not a regular file, generic_error_remove_page in
f2fs_invalidate_compress_pages will always be failed, set compress
inode as a regular file to fix it.

Fixes: 6ce19aff0b8c ("f2fs: compress: add compress_inode to cache compressed
blocks")
Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/inode.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 0f8b2df3e1e0..1db7823d5a13 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -516,6 +516,11 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
 	} else if (ino == F2FS_COMPRESS_INO(sbi)) {
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 		inode->i_mapping->a_ops = &f2fs_compress_aops;
+		/*
+		 * generic_error_remove_page only truncates pages of regular
+		 * inode
+		 */
+		inode->i_mode |= S_IFREG;
 #endif
 		mapping_set_gfp_mask(inode->i_mapping,
 			GFP_NOFS | __GFP_HIGHMEM | __GFP_MOVABLE);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
