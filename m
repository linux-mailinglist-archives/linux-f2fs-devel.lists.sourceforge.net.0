Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 073917152F4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 May 2023 03:21:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q3o3b-00066m-TJ;
	Tue, 30 May 2023 01:21:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1q3o3Z-00066f-Vq
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 01:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8/2WV/8330ze6pmrDXmMdp50FsuVn+MYjbmYvlegJUU=; b=f/8D64tmdvNrTy35OLjucYBrwd
 8iHl4Sipa8PmG0/RY318unCURSqqrvI7qbx4LeoWbDCy/t7LY0Mw4dQPhfs0sZG4kUIFQIVi7toTF
 wB2RyGJuzjMn5TMDdFcxkVnZEyshEVA6ITNAV7WRkhsXPCpcI88NPi5yTUwJeFsSCIX8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8/2WV/8330ze6pmrDXmMdp50FsuVn+MYjbmYvlegJUU=; b=V
 PpuE5EL9/vzvUbXXTHOddibUlw+3Gau9WSoNizr4tyotvMT6+8X0eiOEmcGN5DRhRl+6NZ2YMk4gi
 mRWCKHCHUsqekwtobGA1JKBatDNQTwFWqhg7Y1ZgCVHOd8zdLOrq7aO2ivOH/9y8VY6UpIgfoOXXw
 wUk2PTFU7HlqY4f4=;
Received: from mail-sgaapc01on2119.outbound.protection.outlook.com
 ([40.107.215.119] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q3o3R-006BM0-GE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 01:21:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JR0pIfZXS1I2r/CfOho+Ub32XM/O0GXDVwexcjjf7BFZIqCtEGhj17DVCOAkINvjJ8F6TZkVWP8niaNZox55TPqR3bK9/xiEbqotmyksQU02vSPC4A6taj6p1tBwY7U0jxLfYYCrsTGUwWzOUlSD2QKZ8NnO/XV1dbGLZC7vGNzM49wmaaWrkTy79qmZ+t5cxNBzRsue+EqdU5dCi6fFUJLKdXFgSejz5bAd9ik8TD3uWTetmw6SAevotLkQVw3z3Hg+DV2BhYRnThXKiGmviBl+60/KVD+Qm+hyR2QlnYUGXMMiPZ4QhTPjqEf1aJ6BYqCp2KigEfuPZFdLpPG6yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/2WV/8330ze6pmrDXmMdp50FsuVn+MYjbmYvlegJUU=;
 b=U7Cx9ArQPHpj8NR8OhTARs6vPDLaBN6WII6qlSXRUVjYv5c4ZZ765wRJw/nXDXYxYoDSbQ79ePHkOcD1dzjkzfdJG7/nTdOePQAyESlLSFaopVAG/fOz94SQbKtQP8F2XvSEmEmS4IpvX4yyDxEFB6XgRIijI3we4Lv0FXi4+sq/qQ1Ua3NNV2TOG/Cy6Vb80vqO47HIap8dEuzTKYomIQapP3L9cDpOQtEDFGQijoDOS+DITQpkIG6t/vXbX43yq5Lzy//yVTVATyxMD7aEAdO2geaHA0+SWxy5Jyez48SXfKt2aDX7dD3F0j4tLLVFjTXzDNoC71pgUnsv4Qf60Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/2WV/8330ze6pmrDXmMdp50FsuVn+MYjbmYvlegJUU=;
 b=rEo/DPj6Ngy+4RZW/nEG4b6pDkDnlEVlUX4y3q6YiKk1aOabeH5EW0k+StFQ98G21APTR5lVZL4dK0x7NI6Mw4RjFf/nkgVdORqW8XWUps82rLk3JL/1BbahuwTbBaIBZfOgpX4RLkdPgY42fnv7Wqtk1OFFjYdTIuI6j7KESaEjbuoWlPnx0lu5gIrAXpJjRaauXcrGJJaB0LjMYyDLlspuhSqIsj3v2vxm3bqXAxv5IVHutZMOky2q9wbW9MFCx93vIlJ0rq8i5HGmuUKP+jFKenri8OHj1UJGhTvC4e1OgDxnJScMOniWXuvHqkzb/By3wi7+qgP3WXNmQVdV1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3023.apcprd06.prod.outlook.com (2603:1096:404:99::11)
 by KL1PR06MB6273.apcprd06.prod.outlook.com (2603:1096:820:ec::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.19; Tue, 30 May
 2023 01:21:30 +0000
Received: from TY2PR06MB3023.apcprd06.prod.outlook.com
 ([fe80::feb9:184e:907a:1359]) by TY2PR06MB3023.apcprd06.prod.outlook.com
 ([fe80::feb9:184e:907a:1359%7]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 01:21:30 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 30 May 2023 09:21:18 +0800
Message-Id: <20230530012118.74228-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.35.3
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To TY2PR06MB3023.apcprd06.prod.outlook.com (2603:1096:404:99::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3023:EE_|KL1PR06MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: b5081685-f5fc-4c83-0f70-08db60ac326a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: It1kANXYE0VdctnT4BZPJ4jBiV156UZ4HyY5oVMYwbc61nAPDa3uZTzqdQUNM28m9LGxt8qAHMc313u+0zcvOsg/ozZbISm0XWMOBQlQZ+wWgUzr2Ha6zdotKvh6ZCdxxLX25hCtO9P3xCbmpIqtvlEcCJGefAM0glCOgZRQAUxqQBqWn38zSqd5JXOmadMoLFLjSIPY5eZz3cO9j34BJhSo97JmMZLOH55jaVdPkn1jDJJkaLggyat9f3EgAmvS/Im04vmNuA4EUMdGNCaaJP3xwgb2v0Zcbn2+w0V1f0G9usVpxDx47FLc+l8/w9meIVQwgdeE79XgAtSIJ8KVcRyn16UMciNZGwrAw2OE81cMkTge44aHL58A4y6edE3sLB4BK6ASNQ8svUR+/jkPpyYl1BxCTJGKk3yuw0QPZxvAVOJ5irhggdLVClrk+0ZYWvyTFEpBJgdo//T3sAj6DEHHkOiWNc14Lq8GEfPr3Q+hOO2+awvjWnUaWDhZJ1UWNikU9Pi5H8Q96y3sNxv6H5lm3zizepenF7FibrQj01JEmTXvChBaEYsnENLhPclg++66trsgO9ktD2g4F3Pz+Wb5CjU8TBHNwHMh+3cHKDXbxYj4qrrbm24zo/lfDYde
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3023.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199021)(38350700002)(107886003)(38100700002)(8936002)(8676002)(478600001)(110136005)(6486002)(41300700001)(316002)(6666004)(52116002)(5660300002)(4326008)(66946007)(66556008)(36756003)(66476007)(4744005)(2906002)(186003)(83380400001)(86362001)(2616005)(1076003)(6512007)(6506007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sa8bMBW1bw8mDpiA4IF8VlqfMbBxuM/KA4yj8b7/vYoVldJV8jp3WZKbeYk2?=
 =?us-ascii?Q?RfpWnA7s1Hw/xEEN6ATaaALVVtgejNOVBPFTZu0jsppUfMVneNf+Fhdh7sP0?=
 =?us-ascii?Q?POoE5Af44tqllKMw7pacvVr79/XkbpU2iEWVOKySxFW3xYF4do8ZqocyamGZ?=
 =?us-ascii?Q?3dQM2Rn3czCA8X0OXxyw+1GPIYrhP9ou3o3sqChmvhqQf+FI4r2hDWPr1KP3?=
 =?us-ascii?Q?fsojt2qUThBMyw0t84EbwHo9suVCHo483znp+ZKRYqU4ImEYno2MiHCD/m3X?=
 =?us-ascii?Q?JFsDJTMDoselmAPe2Kg9S3ixtraUvbHgZBOGDazbFJI9bYD88z+5553ikoxY?=
 =?us-ascii?Q?Fa2kPpI2ZLgGJ2T276Lq0mUGBBzl2/EiF2QxPIi/RUmx1xwWm1lg8X9pCoXg?=
 =?us-ascii?Q?8kGHDMMDNm3s1Gr1jr1tKlerquvnYDvGpufUjCAMQhbRuHaEF+tB2EXZRsMz?=
 =?us-ascii?Q?TAG5+cfhzIU+LTLsDE2cTWUY3La3RCINWh6omIPYqEJvO6ZUiG5aC1WChOzy?=
 =?us-ascii?Q?R5sVgyy+0D3cB4EuJ+ZZOEvvAVAx64QlggmDMce+nxOwpBPWdvpAxJ29f46X?=
 =?us-ascii?Q?8Dq/LLXsBfSfnHLR3HoohDHoBC1W1zptJx4KmWlZqgkV72Ty3U3uOAP1s/oP?=
 =?us-ascii?Q?1al+cwmcGDqgRvbM7qY4kourTrNFf1KjpQe6dgy5Nv9hzTNia1pWQ6JdwvN5?=
 =?us-ascii?Q?nniW+TFwdzlyRhmY64xok7Y09GbpJFYfjGmFoEC7CjLkDcqqrhBh3kiq+ytu?=
 =?us-ascii?Q?bRVO9sYwTqG3l93ahK1Mq8TLV0bvO+YCsrkjDXjkcy8u+6/U2ZaCcU8wv9sa?=
 =?us-ascii?Q?8tJqrmQjSKCT5sJu0nAUc+qTrV85IHkd/17QMkBe487HuqNcoyo1GhxVbILK?=
 =?us-ascii?Q?NUFP2vU7+R7X4suDPVB1OYSZBYAwWGceqXriq/qQipVhkum2KNi/GwibHZR6?=
 =?us-ascii?Q?m+GA6eVaCHxKO1AaD7HxHYIVqzTk6BXtFRWp6mQtbw5q5izm9mWYgy+U+0/+?=
 =?us-ascii?Q?t5rjTmTcDTA4lGTe4IzbFL6oKBcMWMqp3wClI+ueLBR0iIAD4E55dLWrMirw?=
 =?us-ascii?Q?NmnPCZ8h3t3s94kpK10C3RgARmG5qUzSEt0iuPsEkhoPKiR2FWG3v4Gag/eP?=
 =?us-ascii?Q?n/0Jk8u+he4/JvkgXbiz4t4CBiXuIiCASLbcCx0UlWzttm38fQcOFUVBwQ2F?=
 =?us-ascii?Q?Wv7ByCAAsRvm+ruFOi7ccP07paqGUGBJ1WUs6410WEnHqfojdT+jDsD20qi9?=
 =?us-ascii?Q?nw4+QpwBz6FF4SEXw+fISCs5QboYTt518xrhOf5oK0EC6EXtLtomy4TTRAh+?=
 =?us-ascii?Q?PsNbE4hIjbJ2Jm1qWQW3BPte10opOjpt14w9X4k1uvHunm3/veeIMncDbDkT?=
 =?us-ascii?Q?dD2KK9qCGCJ7WdmHRpJWiDvbZVX/jITRaXC4O0vGrqRF9FAbLg3KrVOn0cuA?=
 =?us-ascii?Q?rvhpnRBtAwSj1EmsaWKCPwDsUymDXtcBHpsiiedGSpn/xbX43bVBTOE3sjd9?=
 =?us-ascii?Q?Rdr1/0Imt+v1tC/jI6TeposMoZrwe7u9vO5NUYXuu4WyufFdI2C0FgA3kVIa?=
 =?us-ascii?Q?6+wKbo8E0pjmU/RsPywCGKf1XHP6GhSc/k06ZqMF?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5081685-f5fc-4c83-0f70-08db60ac326a
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3023.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 01:21:30.4933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8d/mf9Teis7iadEAdP6vtxM6okTeK9wN8kvCItx7en2ikj+F16EOGnPfh3a5NJZA430Dac8VlXhBteC0SBtQeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6273
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The NULL return of 'd_splice_alias' dosen't mean error. Thus
 the successful case will also return NULL, which makes the tracepoint always
 print 'err=-ENOENT'. Signed-off-by: Wu Bo <bo.wu@vivo.com> --- fs/f2fs/namei.c
 | 5 +++-- 1 file changed, 3 insertions(+), 2 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.119 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.119 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q3o3R-006BM0-GE
Subject: [f2fs-dev] [PATCH v2 1/1] f2fs: fix args passed to
 trace_f2fs_lookup_end
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
Cc: wubo.oduw@gmail.com, linux-kernel@vger.kernel.org, Wu Bo <bo.wu@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The NULL return of 'd_splice_alias' dosen't mean error. Thus the
successful case will also return NULL, which makes the tracepoint always
print 'err=-ENOENT'.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/namei.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 77a71276ecb1..0c5e4c424eab 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -576,8 +576,9 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 	}
 #endif
 	new = d_splice_alias(inode, dentry);
-	err = PTR_ERR_OR_ZERO(new);
-	trace_f2fs_lookup_end(dir, dentry, ino, !new ? -ENOENT : err);
+	if (IS_ERR(new))
+		err = PTR_ERR(new);
+	trace_f2fs_lookup_end(dir, new ? new : dentry, ino, err);
 	return new;
 out_iput:
 	iput(inode);
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
