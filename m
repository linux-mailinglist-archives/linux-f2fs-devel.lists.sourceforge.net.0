Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD4462DF54
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Nov 2022 16:11:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ovgYK-0003Md-KN;
	Thu, 17 Nov 2022 15:11:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1ovgY9-0003MR-W5
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Nov 2022 15:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wjoDJ5jcjc030Rw2+5AV0rnmiqmEAgLgJYpbTT+k7HU=; b=WtK0rxCpXMQhVk7o5SM59Rsq7F
 KBvfR139ftUOBYciH6tvQUByuPv1XBeYpbbX9hWW7sSH0xan7XvxE/FewS5z9nEjY/gU2hHsu9v0y
 gO5PqZPQf8FjU5IjbN6svQ1O0D0WjRhvgY0QZ0Dj4OT48IM3y4HkjQlhudeBeNPs/wWM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wjoDJ5jcjc030Rw2+5AV0rnmiqmEAgLgJYpbTT+k7HU=; b=c
 4vp2uJ+z1IOKJmf4Vwu6L03FP7YMj/Im/FXSMJ4spkdvNMS9L6jMI7kM1wNN++R/ZEJghnjBP0c3M
 FG0JmjhnM39pRLPafMGbGbyAFrSvEh+E616puNmSPB3aEOZcqzchFXmW7bF1Ks024s9orSsjSH+yt
 p9v6yLpJW7mRXo84=;
Received: from mail-tyzapc01on2066.outbound.protection.outlook.com
 ([40.107.117.66] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ovgY4-0003us-9l for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Nov 2022 15:11:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5TtG4lSCk66hWAeCIOvJ6dSeVqz107qDV+0LF9Z03P368hKt9+3XIkOVs8/T5jJfxb4EtDopYJdy4JgzEEue8KwPhNKSkBM5rBGQmPVTceOiNsJJ6zNvYLECE2bH1+hzgrQCBH1AADmoMraxB++ZOAKpeuY6vsqJZLZ2pQIM3+yaNzPM6YqBWd+nPlkeMFgRiwZA52evhmTaEnoQhaoycdnGDo+ZJn1VHizutPqaPpe68ma0/8US5JVp2c3/UdkMcLDAH6RgYHVc6GwNFidoUR67+3db7qCf9n3YxvAytWB3qKc6CxRKLc+E+awGZA++z7CqiatBMGstr4RHWMIfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjoDJ5jcjc030Rw2+5AV0rnmiqmEAgLgJYpbTT+k7HU=;
 b=TVg6VNpBAfkoyDtEFgDiqPkxCopBZ/KTOYdTdbZA7aSQypfVpqhjWo9BJn2rSwNeZZteH6c7WXLg4Qolkn50k03DTTGpFsOqVSiVclNtopI50xVw6UAGc+wEhg+6De3QMGkCFuCDt/VO7bgUwJ7NsdLCNGy2ymaRIKpUk3lOtlaDlz0EMj2KpKkJ3uUj9UFMsjRdyMrQksvfltipISzD0LHSaFvW2u8SAfluo81QC5y2wkaTMOAU9e54zLyO2YeuoccqrG7V9E+/EfsskuSEWysX8hppecU82IV+aGMHzcAXlXZpPMgD57ljq3nLKWaai5LLTiHH5CFV1Yxc3bP0rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjoDJ5jcjc030Rw2+5AV0rnmiqmEAgLgJYpbTT+k7HU=;
 b=J8kygpCTLwk3p6N4LaUlnzn+lCihUQxBAu5ymJYJDHwaF/2UE/W00AmaCcWBS2KyrDbr0D+lHicGUBSSaD6zhwzy+mVvS87MLwJOgqJIFxr+cPHzVb3678kuNx279w0ZMLu6oJj6nmMlaO0dGy+CZnf7AWMhtm6KjkJnOjTunhg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 PUZPR02MB6305.apcprd02.prod.outlook.com (2603:1096:301:fb::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.16; Thu, 17 Nov 2022 15:11:18 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::2954:8e56:dcd1:452c]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::2954:8e56:dcd1:452c%3]) with mapi id 15.20.5813.019; Thu, 17 Nov 2022
 15:11:18 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 17 Nov 2022 23:10:54 +0800
Message-Id: <20221117151054.2232946-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SG2PR04CA0198.apcprd04.prod.outlook.com
 (2603:1096:4:14::36) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|PUZPR02MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: 04579d50-2210-40fc-d8ce-08dac8adf92b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iKU4o39gZNSpRoDAcRxvKpIS/XC+kR9XRn/1anA+yQ9vNQzVYzRFKF7weB7wMQX96dabHS8pG6oF23y9C4R0c/9vuq5xwXuVLr6A3mCIlu1km0x3mGLYDlqm3GlBpKA4I6tFUOyQpZpBXItbA4ZMTRu/9zlfeXeWwCu0X1ttuTttNy7UfxdumA9iv6ivLvXvyuL8o+aGKp6TwXhqLl5zMLxdBrYT+CeqXN6SUvglck1DEPfC2PzEkV0L4QAO944NIcyVyOcXjnwJ82iFLIffXYJSEIk0jsaPTE1WcgLRKsvJnBzbWrhz3Kf5UsKWuTd9dxfXcv2OOMSxgNaYRZRK5BQsr7qD4Ki05W5MuNe+6wuiCBby81mFxxCqQc2cKV53n5w9XLEUDwSdf2Hyd0seXZD6RdmFvE8jB81gtjJBB7agh+QVWb2Pr/yE/YjEnrCLLq5hAI+7RLpj7E7YzWLZfdfwbzDwHg6PVPqaSBwrqAFn6TbX1d0JGFCy4xVlkTTbr1Py4vzHPkuS7+uTXBDX3bxKZW0MV/j5uMuWuMajWOYj71adQAy9WQ7eV+l9FXy9fz2peVX0hVw58nn4hgIY2MmYHdk58B7pjtUZPh1t2+tc9Idl31BJVfuejx6g7xLuFFF+0RGJXDZj6HB0jpMfKdOaWzR73WdmnRVJYJLvqB3v4vCRrbqqIsdYlvCCOTCF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199015)(2906002)(6506007)(66476007)(66556008)(38350700002)(2616005)(38100700002)(41300700001)(316002)(86362001)(8676002)(1076003)(8936002)(186003)(4326008)(36756003)(4744005)(5660300002)(52116002)(6666004)(6512007)(26005)(66946007)(478600001)(6486002)(83380400001)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cpHix3ssTUTYbbZrtRRW9n+1IVApBxp+ltqWB7ezVRvnoXA01fMwvgiwlX/u?=
 =?us-ascii?Q?s66HwA3XY4czUNDfQIcAGGYuisKuDbNAPvxPf2Z46jH18M7zA4ngL78nYWa2?=
 =?us-ascii?Q?zArkYrj6UiDW18BW7Z5oyqcOkUT9u7S0vrfxoPN3kTidTEsWlAYAd7Dt8LpZ?=
 =?us-ascii?Q?bF1f3y2oyAke/vHQARi2fZgEmZHZTpImXS2Ijik2dW0SpN8Mgjwsay51S9Xe?=
 =?us-ascii?Q?fQ03h7BgUHNYQAHH5M42a3J+2qEbkyoZhvvxi+Ef0DQZllAFrnXuNltjg7Sg?=
 =?us-ascii?Q?gKMELJii1ZqmQCvhJQsRdFQJROJb8JZD2o3eNHAxKXn7FWvfnbAYwIVj9x92?=
 =?us-ascii?Q?cZ4t1etyXOKChMgLL9YCQNr2EfRq74IKiZc4m1s0gyhxb33UTL/rCPHeijuh?=
 =?us-ascii?Q?ryKXwA2sHOqR/oxoqy5MGDs15x5KQO6seZSHWAkbCs/MhjblWEgDs7fh8opi?=
 =?us-ascii?Q?cY76qlv77miB+DrqUKu2RZw1Trj1YSB6kug3iiEPrP3MriD/8hnumepLqNrY?=
 =?us-ascii?Q?hVNhWgxdXvcpN2w9+rGh+XYlgj2ZP94S8pSRbeuZCf+5YuomzKRzo1I3RrbG?=
 =?us-ascii?Q?zWEl1UHjFOgkx2bl8VftKv9AUh9LFgS+UHiIye1SxCT3A0LAlc+RHgWt3Ubx?=
 =?us-ascii?Q?6SGB1iueXzTB3SViAFP7DRXVes8Pl+oM2IJJAmaSJXgBmCMFViv0p35GZS8n?=
 =?us-ascii?Q?HEGu1e6gySw/B8tlS8t3I7EqxOBbkg0pEpZExOu+B55ypp6sIJvjPdNkul0D?=
 =?us-ascii?Q?eXD8genN1yzPDzJ0LN+7rf3ikWmHQQUN0zD1cR2Ghpj5NL3u65Wfa6CmFesV?=
 =?us-ascii?Q?lkhQmrHlq7MmeMB105bTJ8d1t7uJ74ryH6WMcHhkj1BZlMzaMfURE0ZvCjGX?=
 =?us-ascii?Q?IcirXlFRMcMT7rA4QMMEO8nLRaWEj7NKL4yvcdNOQIW8G6U1z0laO0NBVM4c?=
 =?us-ascii?Q?3zHhNyYkgHkeieWFM/dJIuNMfHp2vNk1HhtxQN6qzcL4yz9hKaw+pXo3fJ/Y?=
 =?us-ascii?Q?C/wqYPd8ZOQaAcTYlbf7wO6kH3mqVY9Agk2N7dGHOah+BYE3xcMB5ccYlnfT?=
 =?us-ascii?Q?pAPRdbD1IY1uc7m9TZRH3LqTJBdcDsG1f9/n6yeTIRjsyMF936TX+TpXtv3I?=
 =?us-ascii?Q?fgauND6LbaTztz0r1hSCjJU3vn3/zQMcHm5dFbmQ7lzaaKIqK4xQt316hd1l?=
 =?us-ascii?Q?GZ6Rjtd17Y0cYuhfts6vS/XEBig9MPuKu9o0LcTEvd17KHtPEHrpVYpfh9E3?=
 =?us-ascii?Q?Qfdf/XPif+lp8Hw561w4akWn65nlIizcVcF9Q5YbVPwYolTYyVBAn8P66jiH?=
 =?us-ascii?Q?YKD0FCnpxaESYUc70prtvSebSzoijJTFvh/GzMb8Dq/j9GdSKrKOFj61aHuU?=
 =?us-ascii?Q?uMYkzc5YgYnAIhwNe2OSIq+DO5W7p1Yh30CHU61HjX6NiyFKRM1H60eNJ4yN?=
 =?us-ascii?Q?2GHuR/U/612nfak2A5hK7ila/FAXTNQ/QawoKxryQWDwnFOFEmq61ld4Yjcp?=
 =?us-ascii?Q?Uo1raxVtcXMgJyAon9yw9h7EDVlDv+J/AreiL5clp99oEaV3VVXcUag1Y8TY?=
 =?us-ascii?Q?XVtju7zs4HcP2+7LKDcoaQbLQmtCRVCcCy12gJF6?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04579d50-2210-40fc-d8ce-08dac8adf92b
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 15:11:18.6015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ai+9fSNOmiPCdYt+39jZb36ZQjSiMhDEURwJ38ebe90PlfO2fHfj8sMJSKi8EfjdJ9fN9CIfrUoPcZ9+yMtVfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR02MB6305
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Fixes: cf30f6a5f0c6 ("lib: zstd: Add kernel-specific API")
 Signed-off-by: Sheng Yong <shengyong@oppo.com> --- fs/f2fs/compress.c | 2
 +- 1 file changed, 1 insertion(+),
 1 deletion(-) diff --git a/fs/f2fs/compress.c
 b/fs/f2fs/compress.c index d315c2de136f2..74d3f2d2271f3 100644 ---
 a/fs/f2fs/compress.c +++ b/fs/f2fs/compress.c @@ -346, 7 +346,
 7 @@ static int zstd_init_compress_ctx(s [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ovgY4-0003us-9l
Subject: [f2fs-dev] [PATCH] f2fs: set zstd compress level correctly
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: terrelln@fb.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fixes: cf30f6a5f0c6 ("lib: zstd: Add kernel-specific API")
Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fs/f2fs/compress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index d315c2de136f2..74d3f2d2271f3 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -346,7 +346,7 @@ static int zstd_init_compress_ctx(struct compress_ctx *cc)
 	if (!level)
 		level = F2FS_ZSTD_DEFAULT_CLEVEL;
 
-	params = zstd_get_params(F2FS_ZSTD_DEFAULT_CLEVEL, cc->rlen);
+	params = zstd_get_params(level, cc->rlen);
 	workspace_size = zstd_cstream_workspace_bound(&params.cParams);
 
 	workspace = f2fs_kvmalloc(F2FS_I_SB(cc->inode),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
