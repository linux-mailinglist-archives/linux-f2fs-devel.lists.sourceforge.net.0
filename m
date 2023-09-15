Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D477A19C5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Sep 2023 10:57:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qh4dT-00069R-NH;
	Fri, 15 Sep 2023 08:57:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1qh4dR-00069J-U7
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Sep 2023 08:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8UUWe5urIBbJ2HGc1ajKJGq804H0It2/jj4Q7YbkDr8=; b=gLEbSyxsIPjTo8czlOFgawvYqG
 tXWI04rneQRyySrFwbi2xgyadKYJES178XpCHZcNiap11AKJDnjDVla2ZZhupSEcP0XHzyVxrQLWp
 JjF5XC8COKuM+Fp2HX9575iTVm+K5bh6KbIk972Ury9R4GYBm0bNP4g6hWYbhw/RfAl4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8UUWe5urIBbJ2HGc1ajKJGq804H0It2/jj4Q7YbkDr8=; b=VkXTvlWjyNbnZhO4whq1LxrD9V
 UPpRUmmew/R4/Ix58pUo+0CA+uomp/kxbMtUprkuQAquPiL/klXz7s3oaOqBqw6ONO5b8PTyzMh2w
 Xqttg4BsfO5nCe3ERIvrDLj7eZfo3rlJ6+C7ubP9VGf4szbulmt5Qu8fGKax4btq6UfY=;
Received: from mail-tyzapc01on2109.outbound.protection.outlook.com
 ([40.107.117.109] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qh4dR-0076BY-T4 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Sep 2023 08:57:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsYyvqW6QzV1pV6fsdoqsWJtnJkLoKN1Ja2xbKho2hdcrigKHOzCM7YnoIaCMI+ZL0na6wrUsFiBCajvOqDtYZ4Cm844lAKMK6IrWjMyCeckQkcUIv9Tehpp/0D0G8dZljKNBZ/WzVZGbq16SOSZ3TENpD1Y1eQIc/Y0jdNYQ8flxk9cZTZBUjJIuZsCoaS84OTMJk4CMjPn+XpT6RDSeVHHWe4WSBybcGmBhxKXAw+Vcn9xg3ZxKYMtYyQo3alQpAPJK3GvVNLQslUMxMSl15+jszUXSVHg7yIcqaX9hO7tBUhjqaM4t2WOmt7TUwc6kbvtAlBc8AwRAaOFsGkyuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UUWe5urIBbJ2HGc1ajKJGq804H0It2/jj4Q7YbkDr8=;
 b=nLjP4MmdppRauD24Md+j9Y3VpeBiXtPLV3bNoQznm+4g1kPXw6GiG4E52ASz07YuS/PnEN/51naCXBy89fH3jqkfaVfCLlRO20STqPcFrP4yyTzsecvGV2jUagZ0b8sUWPu7UrA7jTLBElNikagS5M3LKgXTQq+0TmWTWEhNKzVG5wfPOP8znlRJDc2jtpo6lST2HWMBw3ljnSNRgq9jKnjaOANERFQMkMu1DVNJtdYsJYT9Ju3WK+W5WAiaRvCX5A4AW1/7WEY0AjPkIWtOJ6h6SXMLNObuYfuFrrIBF1lcSxqjj32E6OUZ0Fs+dUdT/oyCMWCU8EF0Qf5MmeYy5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UUWe5urIBbJ2HGc1ajKJGq804H0It2/jj4Q7YbkDr8=;
 b=ayUFBINYB+L8eu3g9L83C+TLB/M06jGuFtPJbznVuNxaXIoRMjkosWl6Px2NGOjYggzI4ySgoSkjcEkarrJzg1L7dnkoOtFxvbEjKdsrY2RsyjmPLjqbU4oulgBzYuZ2m71cv2QGE63AW+bdMHIDXTJTJVvvQTLWgujJjHKxzHGnhVGtAtVrFSkjiJeuFSoW4GhvGH6hS9mqUqE0u9o2cA1CpRPL8sD3JLvMfk2bfC6df+DRynchVGK8Pnu32AD2L9iutFVUH2ZANVlagFF4eec2e7f3HlYEVRX/c+qtT2mulmO04KLDmY+BKe2Z/0i7MTp5ASr2cvYNO3JNijmHuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com (2603:1096:100:3a::16)
 by TYSPR06MB6693.apcprd06.prod.outlook.com (2603:1096:400:478::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Fri, 15 Sep
 2023 08:57:02 +0000
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::deb4:b884:ed42:e52e]) by SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::deb4:b884:ed42:e52e%4]) with mapi id 15.20.6792.020; Fri, 15 Sep 2023
 08:57:02 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri, 15 Sep 2023 03:04:44 -0600
Message-Id: <4ae9a0c9657efa47399953c6d8a5cd28135bc3df.1694768423.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1694768423.git.bo.wu@vivo.com>
References: <cover.1694768423.git.bo.wu@vivo.com>
X-ClientProxiedBy: SG2P153CA0037.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::6)
 To SL2PR06MB3017.apcprd06.prod.outlook.com
 (2603:1096:100:3a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR06MB3017:EE_|TYSPR06MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: 92a259d1-dcd8-4eec-9e8b-08dbb5c9ba1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pNA7iFdelLDwp7iKnVxo5jxrfEcCIPjNcSPBfxhi7YjWj4JdmRGLOme22zHE06BbXtDH9147XHgGef1REWdNuVXAOKByin8RKbib1+Ido3RYpKtv0+H/ZgDCmhGvAh8KMRcI3TC6WfANnyuIdv0PybrCOsr+x/1/pE3Z3uQb0yA+59QKRJdLSnSv6DZyM6WpNBuuD4xMXTTNt4JMHAWyOiOtd+OcFWQfA1ROeWunUoR7hEe4K2fU+QaiLogtor55ayOSzQoX7A4x554vaEgmWK1mev0I3iJbBnjcEhw7owzm8ALGjAt+pIClCAoDtOGh0drIvIWSUS84H8k3nnxMs61+0Wta4cFzHmcCndAcnnMNJ4FtoWAnrzjv8ajDfwRJ3DyhqRaRrGEE35MIoNEAAVIA32NprYnd5ki1BEWYgCRaZhBaxVKrQ9hCoV4Ca9lR6OjZMR8NRhUipK/SWgFaNFAwegYqhSR8TwZlr2sCzUGTMTc7fSLyge1WJzLXlxmrk87CP3JXuegOAbN+HJVRF4gheNeNrtS+0TYzrLV5q0wlg/uc98fsvlH395zmKU0+AcHckB9e1CviONKLN3m2BGYQxfQFd7iuV81dhKn0hDvgv0feZw1RFNQDXobzX8Zr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3017.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199024)(1800799009)(186009)(86362001)(6512007)(2906002)(2616005)(26005)(107886003)(6666004)(6506007)(6486002)(52116002)(478600001)(38350700002)(54906003)(66556008)(66476007)(66946007)(316002)(36756003)(38100700002)(5660300002)(41300700001)(110136005)(4744005)(8936002)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o7zLgelP0wD+8m7+V/WlmTB2ivgd/URhli6UvBRnY9HdzWSSjwiGefu0Hgxb?=
 =?us-ascii?Q?NQYDEAFhxpZIAOKCpPdYNPq8WJn1SYuhyTcLIharG9lIPI0lcLkJCUSalXJW?=
 =?us-ascii?Q?Z3CyZzStd2Xf7KovPuwIa1kYNxp+Ly0Udc86Bv/ALnzVIN0x0ln8P3UtipLN?=
 =?us-ascii?Q?RhFttlIbACGNzrRwnEbeQPM7Sa095uCzPJM3ATqEWnz60VW56OJhulS+3Bg/?=
 =?us-ascii?Q?4hNNpmJ/nwQBoE8doLzcSRQoqjzLvstVBz5J2VIYntf78eSjPqEPgaimlDEc?=
 =?us-ascii?Q?00R2qBmDKz7sxfyPSGSFC/LJMzr9H2OnGFcYU3XRbK5kwvrWFZOa1obQSwnR?=
 =?us-ascii?Q?crYqLI6VxNJFhrBgQizUMSwan9GQy3mU148i0/Y0F6gKl01J7l/QDfxhc+cX?=
 =?us-ascii?Q?AjlrWCiAkagTjtjudhnghYlRpKjMlMZItpLpwwug9n6AJmu6QJp78lMPzvxW?=
 =?us-ascii?Q?UlVMUc9DoPSlL9v/KKCd4Yul2xMNkBxXqFyA+2sCMPM4XJBUuFszZUCfMeuR?=
 =?us-ascii?Q?JFUYBUChX00awRWh4SMzz6JmFkU9kQZwKGf0L5VrKGH9gRRkNzC1thFf5VqU?=
 =?us-ascii?Q?RNQrPbR+iPuxsccx0s8epf115RTYuDZkl932/KOFYaqhae/ofNpCP4UD+k82?=
 =?us-ascii?Q?fVVOf6772vBo+b49SS9zGqF0KSclT+cHd2FenkL/ij9G0/9y9mt2BrPl6MvH?=
 =?us-ascii?Q?Rxd4IG6i9kTWcyBec2g1uzULzPCPKKp5y+ByV/I+9f8bwL+8K2VolBMHPLR4?=
 =?us-ascii?Q?9NKLlB9g/zxZHrZdpB3mHkzTwjkmk5HLw7aSlzIw7kK9xmsVFYTaB7ecy7zT?=
 =?us-ascii?Q?C1sCYIuh+oFTV34piEL668M7hED2SQlK8kSRTfW7TAPsGuI67R8rViryrbx6?=
 =?us-ascii?Q?y7jFnfqyF1CbBX2ikSXBGX6pf1o6AY+E14Uc6ap6fA+5YHSpb2N23xVra0rE?=
 =?us-ascii?Q?8oEfRnnSZd0TG9/PzIiib3QTkVRBB7KVhDg5WHzdvXDM5GQs+N5r6rc2T0UB?=
 =?us-ascii?Q?ENgwjVQZcBVCMF1kmWxMN3J3LSc+TOGaNE4kTuyOWpgq/KIuJv7MLS5HZKKR?=
 =?us-ascii?Q?ExVpJjbYW6xFHiqEq7AdSg+2VQdUx5dV/uKSJd5ZpnKECs27FBSysSEL+yJa?=
 =?us-ascii?Q?VUjjNCUNUWbnw+G+aNH/MswtUTTJUJNt1j39MEvsriDzGnsfAhgtTuBpvfig?=
 =?us-ascii?Q?vFozv33ve5qZpafXEqa50v3TcqN74Mqqmx02rkuDYnAKrj7NVnF9rWxzHUmu?=
 =?us-ascii?Q?NKDI9jwdJtRG21L0GF9Vap2eih0Tt3Xc/OsfC0aW4FhaLUkgDOUbfxnBH19q?=
 =?us-ascii?Q?aMXAksqPPMdvB2nVmP2iv4hUwz9HFjpP+i0D90lGEZzlEf98+JPASmitZQ3l?=
 =?us-ascii?Q?LSS33Por0Q/EbISXJidi9oY9lIZjeB/daBi+OOv8umNtHlXOxIaUCdN8GUug?=
 =?us-ascii?Q?ERirxgjB9O5AxPIXeWNOFcUUWd50q5CtkpqfH94KEWgqjoIvZamBc1jllAAz?=
 =?us-ascii?Q?YNgYb7xchzaLMxSuVTdooGLl3Y0DA6Z9X3JNaSimgBA2l69OxuMFWC70wUU0?=
 =?us-ascii?Q?118dzQgr/5FiT1Q2U7/lzDTnnKdmQnxLiQ4LkifJ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a259d1-dcd8-4eec-9e8b-08dbb5c9ba1c
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3017.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 08:57:02.0936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kefRdS6t4Ot+6xEb652bAcbGSdu0wOcZZwATqy9ppTZ57log4ZuAqAmzrLIeGDUXcKx40wBnFp6splv2Gr7bJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6693
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If the segment type is not matched, goto next segment to save
 time. --- fsck/mount.c | 2 ++ 1 file changed, 2 insertions(+) diff --git
 a/fsck/mount.c b/fsck/mount.c index 00940b8..dccaae2 100644 --- a/fsck/mount.c
 +++ b/fsck/mount.c @@ -2854,6 +2854,8 @@ next_segment: if (type == want_type
 && !new_sec && !f2fs_test_bit(off [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.109 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.109 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qh4dR-0076BY-T4
Subject: [f2fs-dev] [PATCH 2/3] f2fs-tools: skip not matched segment when
 finding free block
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, Wu Bo <bo.wu@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If the segment type is not matched, goto next segment to save time.
---
 fsck/mount.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index 00940b8..dccaae2 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2854,6 +2854,8 @@ next_segment:
 		if (type == want_type && !new_sec &&
 			!f2fs_test_bit(offset, (const char *)bitmap))
 			return 0;
+		if (type != want_type)
+			goto next_segment;
 
 		*to = left ? *to - 1: *to + 1;
 	}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
