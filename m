Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DF363B909
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Nov 2022 05:16:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozs2H-0004Od-2y;
	Tue, 29 Nov 2022 04:15:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1ozs2D-0004OV-3h
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Nov 2022 04:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YamOh4SEsO4oRecUplCdHJK0jSGNqylVeVtmwLy33xg=; b=GC0dGnJe85Z1gCJhkPaLpqmXsb
 QJ8qoX2+ufBqgW8+CuwC3CoRSja9R2boUfjBCDFsa5cqpdQB5iLEYtIlgW1SkeKsD586iYcV45juj
 qGRU1bKxMTnq86Hh7ygNQmtCWLlbEi6LbefIjvF8yjGrNNfdpCf+7/rqeMEpUBFnMFeI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YamOh4SEsO4oRecUplCdHJK0jSGNqylVeVtmwLy33xg=; b=Kv5zdqkeBmVhjDK2Xl/59eYcjw
 nje+5n1VcLyF65AkJFl2f0JRgx15tdGiClbGEk54bRvILtuOF8EycH9H/ZiS9iFgperHPBh1rWsJz
 16kC8wtxshwXdt7Zqz3QW0gubVxOiF/bq5z8J41Qgimle1kzE+SgdWlOCvQYvmtMy3AM=;
Received: from mail-tyzapc01on2102.outbound.protection.outlook.com
 ([40.107.117.102] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozs2C-0006ge-CT for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Nov 2022 04:15:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVY57Hzp5LnCrjtk9uxqyVBOEOiZWoN8iPs2dbzmHHbNRA3Ko88E+LwlnQhAAFX9JviNYKBAQ6qpfAxKXZvGebh+K5z/IpVQf4DoD3kZxPz7akScGK2BM4MTyIP1ZjZ3KI2J9/Zqk9kqBAbqXSRP/uWF3wx56sQWcYbf5m8rsEPKkMzGAYUOWCrjL+Q34E/57PH5u4g8H5TYImOMcrRkxM+7pTS8qASH2x2JNJFgJdq9RwrScbdcYIMBFu8vk2xMZ1JMPhBIJBlFtP0Ba57SFynBY4eWrMdkwqnpOghO8Jo5d6+jxFRmKm5DcxufTUDeFup3120UWTgbGlll3pk/AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YamOh4SEsO4oRecUplCdHJK0jSGNqylVeVtmwLy33xg=;
 b=Xr0i8dTI5aYoz4oBvs1yocPncXCh1zrcbEqmtg/3tkcQ+EyAa4sjQnkkN1CJGkBJCyPfpu0OBnM2TUkKCcK98UFFJBqvrE89Ibn2j0GU7tn0MFg+hB/Rt+E4zOxuF99CDMsIZ+BIPOP3nu9K8M/AZR/dSmdX0BFNFxZWAVtoBrfpzCDKxexoChl/pbHSFE93N6zCUTpEQGkeoGVjTufxwNa8qVXAxWoLh89/DfNIvA0329batHD5e6opwlT+H6f1t8sh/GHym1DlzAa12AkWTJFl9Lve8+1Mg/x64wfCKXxamYrnARb6c0v76FRgacjT34sXgc3R/KQjmaH3Wj/cnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YamOh4SEsO4oRecUplCdHJK0jSGNqylVeVtmwLy33xg=;
 b=l8gTuznXNWP68hICKpKTeSlczYIt/7oBc13UfYfOU6aDX8I1qmcPbPQP8UPz0bPWU4StnzXayC3txd7VFdNRA7Z14JPL3u4Dxk1pBKmFtmXFiJeGXW9Pu1gbuV7Y+L1EfLgq4pvqnWAgboULaC6yeRRupMpZVZkF00I1Y95LbRFtPbH45Ismg4iX6WCZBS67edSZFJ45UxS7WHPFOhnIFV33ljhxs1Y6BJCGGtiRBCh0gYaZFBoKyLSmKHzUyG5eVFucwSVwp9DCzh5Q0tHhOfcotWn/D3505YQJRu8oHNrC1hcKmizqHhZytRG6GHAeTzUEOJlpbHJiuZIqwa04lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5657.apcprd06.prod.outlook.com (2603:1096:400:277::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 04:15:39 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 04:15:39 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Nov 2022 12:15:24 +0800
Message-Id: <20221129041524.81235-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221129041524.81235-1-frank.li@vivo.com>
References: <20221129041524.81235-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR01CA0045.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::19) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5657:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c2bfb4e-1bc7-4c11-ba0a-08dad1c05f96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hv19nD6dd1HNvgRH8odvBoZIn/gVB6cov8WYsBSndZ23xNu3biW+2nqKu9PVNRUZMHS5Z0kewX96w6dRijIdLiem0mswD93P0CbAWTF3nFvAQ/vthLGmX9IGYBMA0j2BImDAy9yV4E0CQuS1ghSxkIAu8jAWBP0M0OnGKxsEFV8EFb/EsZfRzNo6drh3fxxHyzf+0bqaun1zG7TI4il0MRGIeYBscBeh9LY46UmVWlN7u/jnTraRVFbqpXqNNKtHS1LKLSYyolVe+XCPbJ+zznEf3iOHcH4QhLNQMREFiJjGjMAJLUd9/qo5yTcGjd3dpDgMWI1zIfWUnhkJlGpjjNJogGATeqX+kx+xALUvKknkt5t7nDHyClGswWbzqt/A8kkfJURdfkP3D1BTZb3EyhfZObVELPsxbZ0wbvAJsIijRK2WJtYoEMn35OaKgbHMLQw1m82ZXeD207h++6FQjtA+LuhT1dGpknhBoFq7AqOiziN5BSA2dxPOCkC3AwRiJuZbia1o+sCkKELG3FKQ5IvDHCPaOTyttOj/FuzKtbPaw/YcNdXTyA5RK/FMtpuSEzhX/KvfURBJhpd1+wP1JyghXn+/GLAs6EGU1iwY1DZpNBN1Wir2izaVjYp3moiB+UZaAXYNjVdf9Fpz3fUEsvm/3AvsiMPbH1Q0ebsaYQqMLEq9EawI/DGPingWe1Cf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199015)(2906002)(41300700001)(66556008)(66946007)(66476007)(8676002)(36756003)(4326008)(316002)(186003)(8936002)(5660300002)(6512007)(26005)(86362001)(478600001)(107886003)(6666004)(6486002)(6506007)(52116002)(2616005)(1076003)(38350700002)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EWGhgx80c5pCH7zxTggscB79d6tIX7vkNzBIV/JbKyfc3miFFbEI7F7o0A+P?=
 =?us-ascii?Q?KfgWEzMovnr0hhTqGavwLvea5pMY3WqR4eiyApwMR+krDQKjIiTMqDLH/zFf?=
 =?us-ascii?Q?UMdMBOrdNAj3JswWOAVkoQbzcVxIZZUQ25qvh5GI8J6lXsPMLefX0xTSm+Wa?=
 =?us-ascii?Q?WgdS32aFeqsiP9iY8nd5B9T/k/BxTfNkoYUaqx9Uq7CvKWLEPaeySC8JIgPA?=
 =?us-ascii?Q?VCH3A0VGSwMkGuQBfK4Ahih2ZenJ0hGF1KpWVcKSATV8vPth5Uc9A03lMnVu?=
 =?us-ascii?Q?dn0S4NhMfV3jdO44tBDa8fcgEMgjCUORyaKgrLkcU5X4y2DLTTnkp6CNg9gg?=
 =?us-ascii?Q?vGFm24VOFN0JGvPuWSJwnlWLUtIjNEf/8T47qDP5lnH2qAPO5kGYkOsc7jxG?=
 =?us-ascii?Q?S47DughKrsNkNAvV7h79vxpkWlmhtFEH6sYQFGF8vOPqRUE/20mq8rgdW1Gd?=
 =?us-ascii?Q?Juegzs45LMmr5i0SKwZwKud0kADRKw00aJ/V2keZKzemWkJAapf2o7mc5pct?=
 =?us-ascii?Q?HpcRYt0adcUiuP2udXsb1twDzk5onetPfzMSBcGAcInfSLLP9SmLPj+q7KDL?=
 =?us-ascii?Q?95iKztgP3hD8xR+BEKkbN2JFFrlF8Wi9znKYFLC/ObrrtcVNNNzmc3RfsTlA?=
 =?us-ascii?Q?e5cdS9bOITHblsApk/STqwydn6snIFrps8twTiE9kAUChsxtpmHnMxFVjIpY?=
 =?us-ascii?Q?RhEJVuTklpMJpcWXMkUYL9P3AYcXfhMhE5hYm3/2m1NkrJGOYed44PaP0GhU?=
 =?us-ascii?Q?VTQfJ8Nrf18WdaPaHGkDZbXqoNEZWVHKnCj0fnyTHZbtQMS5jVkD/p0+cgJj?=
 =?us-ascii?Q?qPampw8o7LttrhqzvC2LWX8+RKbCBZonpYswY589AVRa3BPVy/v5S4eLDvqT?=
 =?us-ascii?Q?kjQM2RIF5zzQA1hfd1JiOZA19t2Jvmfzxrs3n1jwEWOJwHRfhPgfZIod8nK8?=
 =?us-ascii?Q?girHY/JcekyiYVFR9JPINHCJF5H2p6qMTByI6QxupbFNlT4f70xNybXSaxlh?=
 =?us-ascii?Q?Tqg84GkbWoYLtLE0Sw5q/xet38soZfs5AIotZNsYxGmJnzoz08mGzZivCUkH?=
 =?us-ascii?Q?m1asLA+UC7EH+73bspx9d3rydOgHDieuTtaxcVMMakG7ArO5s9yJpAr32neJ?=
 =?us-ascii?Q?cCD9crtd/Dc4XmHMai7rPnbSfZTtUlKnP/9tG+1i3Cr17gR5OUT4puKXsoDK?=
 =?us-ascii?Q?zAe90EBYywBf2+SZvME0afI3D19dnsknriQ514+G7Hbl1dkXZfUruiNncPbV?=
 =?us-ascii?Q?mxI5VYnEdtiwj1AO/6QCX/EkWWTESWpLLDUvg55REsH3N07dLN6xfTlMqSsF?=
 =?us-ascii?Q?Ecdx6dCTNZD2PzHA40TzmTwlXagYNV+vJ0pG4RuFACjulc873mgDZEio3z3S?=
 =?us-ascii?Q?57nZvyVz1n5ttVuQ/vLe+1SQ9gdiGiH3bRmtVmLF5kcv5s2QlayDLmS7Jap/?=
 =?us-ascii?Q?FEb7ibzcfFNk+1hOOFCFAso8ktrAXVsszfszDsNpbjPx0f1StILm2bm5zIwL?=
 =?us-ascii?Q?nzzMdnD9nhOg0hxrSsjtKs2GPlrZHvoJOqdkIqkGGf2OCxE/r2CSVLsSWiVD?=
 =?us-ascii?Q?cTa29WaNVKA4zYLA5XK0JmPTVnNZVHanWvhv5/2A?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2bfb4e-1bc7-4c11-ba0a-08dad1c05f96
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 04:15:39.5079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FCirnqLUOFjPlsscw1iVbEI+DitCbU1Vkk424w5uXOXERBr3NwsdmrafhPU5miSnODJ+PwmafTEzof6Gb3NPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5657
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds support for counting the average time of
 submit
 discard command, and we can see its value in debugfs. Signed-off-by: Yangtao
 Li <frank.li@vivo.com> --- fs/f2fs/debug.c | 7 +++++-- fs/f2fs/f2fs.h | 5
 +++++ fs/f2fs/segment.c | 18 ++++++++++++++++-- 3 files changed,
 26 insertions(+), 4 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.102 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.102 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ozs2C-0006ge-CT
Subject: [f2fs-dev] [PATCH 2/2] f2fs: add support for counting the average
 time of submit discard cmd
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch adds support for counting the average time of submit discard
command, and we can see its value in debugfs.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/debug.c   |  7 +++++--
 fs/f2fs/f2fs.h    |  5 +++++
 fs/f2fs/segment.c | 18 ++++++++++++++++--
 3 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 733b1bd37404..eed3edfc5faf 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -109,6 +109,9 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 			llist_empty(&SM_I(sbi)->fcc_info->issue_list);
 	}
 	if (SM_I(sbi)->dcc_info) {
+		struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+
+		si->discard_avg = dcc->discard_time_avg;
 		si->nr_discarded =
 			atomic_read(&SM_I(sbi)->dcc_info->issued_discard);
 		si->nr_discarding =
@@ -510,8 +513,8 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->nr_wb_cp_data, si->nr_wb_data,
 			   si->nr_flushing, si->nr_flushed,
 			   si->flush_list_empty);
-		seq_printf(s, "Discard: (%4d %4d)) cmd: %4d undiscard:%4u\n",
-			   si->nr_discarding, si->nr_discarded,
+		seq_printf(s, "Discard: (%4d %4d, avg:%4lldns)) cmd: %4d undiscard:%4u\n",
+			   si->nr_discarding, si->nr_discarded, ktime_to_us(si->discard_avg),
 			   si->nr_discard_cmd, si->undiscard_blks);
 		seq_printf(s, "  - atomic IO: %4d (Max. %4d)\n",
 			   si->aw_cnt, si->max_aw_cnt);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index eb8c27c4e5fc..5a99759d10ac 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -370,6 +370,8 @@ struct discard_cmd {
 	int error;			/* bio error */
 	spinlock_t lock;		/* for state/bio_ref updating */
 	unsigned short bio_ref;		/* bio reference count */
+	struct discard_cmd_control *dcc; /* global discard cmd control */
+	ktime_t submit_start;		/* submit start time */
 };
 
 enum {
@@ -414,6 +416,8 @@ struct discard_cmd_control {
 	unsigned int max_ordered_discard;	/* maximum discard granularity issued by lba order */
 	unsigned int undiscard_blks;		/* # of undiscard blocks */
 	unsigned int next_pos;			/* next discard position */
+	spinlock_t discard_time_lock;	/* for discard time statistics */
+	ktime_t discard_time_avg;		/* issued discard cmd avg time */
 	atomic_t issued_discard;		/* # of issued discard */
 	atomic_t queued_discard;		/* # of queued discard */
 	atomic_t discard_cmd_cnt;		/* # of cached cmd count */
@@ -3882,6 +3886,7 @@ struct f2fs_stat_info {
 	int nr_dio_read, nr_dio_write;
 	unsigned int io_skip_bggc, other_skip_bggc;
 	int nr_flushing, nr_flushed, flush_list_empty;
+	ktime_t	discard_avg;
 	int nr_discarding, nr_discarded;
 	int nr_discard_cmd;
 	unsigned int undiscard_blks;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 9486ca49ecb1..bc96b1afb308 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -931,6 +931,7 @@ static struct discard_cmd *__create_discard_cmd(struct f2fs_sb_info *sbi,
 	list_add_tail(&dc->list, pend_list);
 	spin_lock_init(&dc->lock);
 	dc->bio_ref = 0;
+	dc->dcc = dcc;
 	atomic_inc(&dcc->discard_cmd_cnt);
 	dcc->undiscard_blks += len;
 
@@ -1000,9 +1001,13 @@ static void __remove_discard_cmd(struct f2fs_sb_info *sbi,
 static void f2fs_submit_discard_endio(struct bio *bio)
 {
 	struct discard_cmd *dc = (struct discard_cmd *)bio->bi_private;
+	struct discard_cmd_control *dcc = dc->dcc;
 	unsigned long flags;
+	ktime_t submit_time;
+	int nr_discarded;
 
 	spin_lock_irqsave(&dc->lock, flags);
+	submit_time = ktime_sub(ktime_get(), dc->submit_start);
 	if (!dc->error)
 		dc->error = blk_status_to_errno(bio->bi_status);
 	dc->bio_ref--;
@@ -1012,6 +1017,14 @@ static void f2fs_submit_discard_endio(struct bio *bio)
 	}
 	spin_unlock_irqrestore(&dc->lock, flags);
 	bio_put(bio);
+
+	spin_lock_irqsave(&dcc->discard_time_lock, flags);
+	nr_discarded = atomic_read(&dcc->issued_discard);
+	dcc->discard_time_avg = div_u64(ktime_add(nr_discarded * dcc->discard_time_avg,
+										submit_time),
+									nr_discarded + 1);
+	atomic_inc(&dcc->issued_discard);
+	spin_unlock_irqrestore(&dcc->discard_time_lock, flags);
 }
 
 static void __check_sit_bitmap(struct f2fs_sb_info *sbi,
@@ -1160,6 +1173,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 		 * right away
 		 */
 		spin_lock_irqsave(&dc->lock, flags);
+		dc->submit_start = ktime_get();
 		if (last)
 			dc->state = D_SUBMIT;
 		else
@@ -1179,8 +1193,6 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 		bio->bi_opf |= flag;
 		submit_bio(bio);
 
-		atomic_inc(&dcc->issued_discard);
-
 		f2fs_update_iostat(sbi, NULL, FS_DISCARD, 1);
 
 		lstart += len;
@@ -2070,9 +2082,11 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 	INIT_LIST_HEAD(&dcc->wait_list);
 	INIT_LIST_HEAD(&dcc->fstrim_list);
 	mutex_init(&dcc->cmd_lock);
+	spin_lock_init(&dcc->discard_time_lock);
 	atomic_set(&dcc->issued_discard, 0);
 	atomic_set(&dcc->queued_discard, 0);
 	atomic_set(&dcc->discard_cmd_cnt, 0);
+	dcc->discard_time_avg = 0;
 	dcc->nr_discards = 0;
 	dcc->max_discards = MAIN_SEGS(sbi) << sbi->log_blocks_per_seg;
 	dcc->max_discard_request = DEF_MAX_DISCARD_REQUEST;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
