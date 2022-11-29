Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA7163C144
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Nov 2022 14:40:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p00qo-00048E-Fv;
	Tue, 29 Nov 2022 13:40:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p00qm-00047w-Gh
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Nov 2022 13:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lN8sywuQV9rrPuV6+BPQUTe9Pz1aShp5pShrkBzzCGg=; b=enlpfHzK9zmp9zsXX6vICEdAjk
 9YMh/c4Qyt98BEScXEMXK+w8kgfEjNFpdV26FNkUL4ap3RuNw1mP5ejclRG+P7CE+DhV6U5m8n1k/
 M+2oPAUIHfSOwnU3vDSVFrcrl4EoKcbSb3g6COYu3yOLqsJI1L9IV9G/SRKST8IRHkcY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lN8sywuQV9rrPuV6+BPQUTe9Pz1aShp5pShrkBzzCGg=; b=D
 sg2W88pXFJzAyiF3u8U3zbyTFQ0LWsFFNSsiMm1jOjdxiHNkMRb2p8OSwoT2PqkLkubIL9f4goGoQ
 19AzuJrTMl5TS1Le+wUPvnKZJxNt0pJOH5JLkN4hsUWwZ8xdO+s1oEy/EMgt8c0gujd0RYtsJkQSt
 lDPam+KRWeukVacg=;
Received: from mail-tyzapc01on2131.outbound.protection.outlook.com
 ([40.107.117.131] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p00qi-000KGV-A6 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Nov 2022 13:40:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SlDTP/bkqmVCO9iI6RdHrfehmsykfpkjVJ1Kv4Q8ILpMNy6juzOLbKHgGkxqsF1VCW7GguaI9i4LvYrgdMp/EhffWfFVmOM+kixoaMe2JWzpkjZF+r6Ex8Cz0Om0NzCT4yCQy/7ApHOGdLbbPlGZmkdIhi104urKsb9nu/FqLJUnKaT8qfgVfGDsAEyUeSvI4J3KZBFYS0x236Xd0s456/3Fp+B0qlLwbDl9Q5VUMv0DgKNulqJVK3Fg61hZWeam03G/g7r/i2tq1eydGO4hhDki6nlPJh44xIVCpNNVRLdlaimUsAUOTi5pxwpWgi6GcO6Enu4O8W/yu4T5r1khEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lN8sywuQV9rrPuV6+BPQUTe9Pz1aShp5pShrkBzzCGg=;
 b=Y5/H3BtDjuwPyrjkB1KoT91T+TJQZNzce45VTrQfa50Zp45pOR6Y0C6BBWB3jrrcWnW0B7+s8HRLl2oCFqO/cbNZfvNO7y+w+S8R76Mk5Z8jO8cBOGzrNO9Tx37pRZV2GboMU5bvRGNkyHStTwNe3VOy8Ojnjho0hY1P1EfOMhm071qSZ3CmV115wxJT6MWw3KpqcnFvtdHRt+yTjdvaHIDXPY8ZfVranMquKjjI1v1s8Wxfsa8uOx6/cLHwzuebdBorSsCh/zQqgny52lRY397XI7+e4Z38lQMNFsTp/VbjcnQCNJyZNwjKLWqN3B3PcWEkV37zhvhihxLrabmyOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lN8sywuQV9rrPuV6+BPQUTe9Pz1aShp5pShrkBzzCGg=;
 b=nL6tjQo4UijjV536MV+WJZVw2aKRgQ/YYJlkbQbNV6/VJ2QHnECelYpS5ru88+eDrvg7IC9JdPF3oT2frbOuMrTLO14mjiQ30clVoGar+vs22dr1mZG+kkeAL9pIHxlBft44hYDuyfy0HsKG1bdi06qy394JFLcIfkvyzWiZyAbYFfAxs4pKRGUdRSUylVwLHlzyVD5vFcDscCH1totM3+RUEaejMCQdzzYRp1YxHy7px3RBasKX5oTEDyqV4CYiyqeC5r2Ej/jT2pkh5n3DFX/Sa5D5mSldShOP/yeIEYr8EjmfrPG1LQeutz0DUNZ4x5KBpXShzctqEY+U2qQQSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB4984.apcprd06.prod.outlook.com (2603:1096:400:1ac::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 13:40:27 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 13:40:27 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Nov 2022 21:40:18 +0800
Message-Id: <20221129134018.34120-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR01CA0171.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::27) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB4984:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d7987d-c662-4e02-ac43-08dad20f4627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KSuJfLH0rwD8LbEPHrZQGumKEAB6gfqMW3SJ9ysLcZ1Dueo6cjbJ9NaycOPQv9Jl0TIIshdFG3Llz6WoiFNkgZ85yg32PXw22cLESvAiXhP7UteZPfVB8HzENejJ8rRhsYQU28+K5VmcjpfhrKIMuMOiMvVv6reDIh1arHTwzIslQG/L7IsBXLa+266OOO8y+CqzhHLZ3MeErp1MLo7Uf5DFEbjFFz64fzhj+Mgkx0fLCIrKwmB9yeAFtIr2AdYnLhNXSZq/5llaPElJuCIUatWgBFYOeI7iJBpgVHzrB6wNpMEKCoq+7NiYPhezuLGhUS3ZWoFq/1wHjWAXLJk0zfyZ8tHPz3mBIhO9KlW+JwOPD7UtFOMhMUylcZq7vQx7nwP25ECXLKYJ+JrRlMAFVDI36fXwAWnX+FTbdhOfGa8jaQLLu1vm9Qta85ph1IJwdVx459Epefn/aw7NtSRbl9BYoR9ORdpV2dDzIh6xaEa07FMrmupGN9l2QFYmZ17dSJjlpsHLHU5pW9+kiiUJMGBxCzCEAZr2dcM9UB9x4+wFtUcYlh131aZFShkvkpk0keSwK7RnOO86NhE+NIVJ+omeHlsoQZg4LtUkLcuRcD581X0axk219sdplDoVh1I8xwV8UBv5loeNvziwp2S+Gs7j0+o+BR3YYcRfAIWohLdYx/xw/De/89somYSx7flV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199015)(2616005)(2906002)(83380400001)(107886003)(26005)(38100700002)(38350700002)(6486002)(66476007)(8676002)(66946007)(41300700001)(66556008)(36756003)(52116002)(6666004)(478600001)(6506007)(6512007)(186003)(5660300002)(8936002)(1076003)(4326008)(86362001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HTC+w/Vy2qRyWtzbg9A5QDc7vRzLTDK/cnQtuC6RKEgUSzDlw/LJ8dHMO+VW?=
 =?us-ascii?Q?JPk6Bz+g7YGHbGMTLYfGlyY5gDN4QBwif59iYth4WHP2Xn73Ni0gLe2dy9n8?=
 =?us-ascii?Q?a0/gLWJNF+qoqriHj6X727P0PEdtT/ydjAdlwNOuuj4yyFa/JGWjlr153KgF?=
 =?us-ascii?Q?WR5rSs6IwWzMikB5P2JzKUZelgQDFRxxLJMup6HC6+SrXO0qy+xzfuJqYib8?=
 =?us-ascii?Q?k+xMmMYvqfo76HWowBZTt0X+Y7tAxWZHqza/2j5LWNNZNVqw3ra70Mg+Qtww?=
 =?us-ascii?Q?EgUTw+3n7aF01D9ep3FJdzHbA0t5sKtkFzD1hONf0931TBwtMBwQ7kxCoLDC?=
 =?us-ascii?Q?yISfBBgBgCP9Smakuv4/qY+Y6fFiN52798VCwes2B0RotfLAkeObQiWh5wLb?=
 =?us-ascii?Q?YIK2F6+QjCZs0AeNmQquhUTrqI9bH49laWVaROyNvdi9op5t4bSdmjcaShsv?=
 =?us-ascii?Q?KrdpcD22SGZlSQv6kP2rg8sLgRfMsGsARlsvU5HF0RLnwHRUuoy1dgGgB8MJ?=
 =?us-ascii?Q?LquNzYSxw9c3UEMhOOqjYv/+gKYC7nJhK1Kv3Md4/CCmtEjgDQDcJBHnk/+H?=
 =?us-ascii?Q?GurGz0IvozLtQCetN+fjiM2VRtMDb2futaRcNQwqn9Q00fEdDV8ZNlqz0d9l?=
 =?us-ascii?Q?flQUyWxlcnE3tfPMb7IoOlejxD94uQBBM2Ht8WrTlipNpuXGUEqdTrKialxP?=
 =?us-ascii?Q?WBRwOmXwfHBhRjiRxIgLQfe7JUkZd1QHDv5U7Ni21yxmTp/JUJrPqeSSIxqv?=
 =?us-ascii?Q?ZNbp9hr+RzPfAbNipv5NzXyRTley8KM4WyJQhWabfwiakjxUTEmpV2+S6H1D?=
 =?us-ascii?Q?CxKNwcdkSI8ilXM1/PYA53YyIAbcdR1CcKO7/u25PpYk50BW7mmp3DGJQclf?=
 =?us-ascii?Q?ZKNuB8cKRJUYQ76V0JaP+nqnZ+mPVrWHazHR1c1opQdLSgw8QHCGuYQzk7YE?=
 =?us-ascii?Q?3S8f5/FYfpHdSKCj1Tgz5J9N6oqaEXHiOwOYkd04HXrxcQCc+X5lBF9aQrzv?=
 =?us-ascii?Q?EleCWUfKcqXXe9uQ6vl+d6yJEfMf3I1xajAfGw5fXWeVxqRs3v3GzoUSWpna?=
 =?us-ascii?Q?KbaRI73jAfPtkegmjxS3V9ph3B7auzEJejBka6wTu5dFSG6eNRqRPX5ZAnX1?=
 =?us-ascii?Q?giEzLf3jMTWqz89eLOJIpgEcuYp5fjbeg8lDvNZNmUSWHHIXTwgkjimVYOFG?=
 =?us-ascii?Q?vNz3QKntDIhD0j0Ci5p8kFg0fHVgvITUFMSbReC71sRyCYV9MwhFrWOx7mh6?=
 =?us-ascii?Q?zgEMWI7F7aVnYi1oJLRJiAuI2RAWMMo7oK+x2PCoddn/Evi0mGYJI0WBtVmX?=
 =?us-ascii?Q?5+e37m+GQcoIhNyPsVkJYGX1btEmNXNg/YVMEEXmJEjNc1UHixkdvzsnNBuk?=
 =?us-ascii?Q?6Ag/0OX7SWMMRoSGmXNHfCpIUnV+T5Njv2KB7eGokIcTAPklNpf2oqbwiFjR?=
 =?us-ascii?Q?mpjimjzUSw9kDD52HxlyfZnJ0fL0zyLMBgCwEoftxmWtYvjp3nDqSPwJ7Avi?=
 =?us-ascii?Q?2PD6jvhB5MVz3XE5H771M/vTF0Hj7/sbNpi76qibHnLVW3IbONsZ2fcnhSch?=
 =?us-ascii?Q?ZpkrqN1wD7JIp/LyRL4KmkRb9zq4vglXif+JHZaj?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d7987d-c662-4e02-ac43-08dad20f4627
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 13:40:27.0943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eplMELSvHTGx3SlLRFv2DNEuBUDpSZn5WxwDcHG9x9JfOHSUar2ncIEK8eBMVDrdTVy6ZVNc8XDxORh8zDkV3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB4984
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: No need to call f2fs_issue_discard_timeout() in
 f2fs_put_super, 
 when no discard command requires issue. Since the caller of
 f2fs_issue_discard_timeout()
 usually judges the number of discard commands b [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.131 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.131 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1p00qi-000KGV-A6
Subject: [f2fs-dev] [PATCH] f2fs: issue discard when discard_cmd_cnt is not
 0 in f2fs_put_super()
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

No need to call f2fs_issue_discard_timeout() in f2fs_put_super,
when no discard command requires issue. Since the caller of
f2fs_issue_discard_timeout() usually judges the number of discard
commands before using it. Let's move this logic to
f2fs_issue_discard_timeout().

By the way, use f2fs_realtime_discard_enable to simplify the code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/segment.c | 6 ++++--
 fs/f2fs/super.c   | 6 ++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 9486ca49ecb1..d5f150a08285 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1655,6 +1655,9 @@ bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi)
 	struct discard_policy dpolicy;
 	bool dropped;
 
+	if (!atomic_read(&dcc->discard_cmd_cnt))
+		return false;
+
 	__init_discard_policy(sbi, &dpolicy, DPOLICY_UMOUNT,
 					dcc->discard_granularity);
 	__issue_discard_cmd(sbi, &dpolicy);
@@ -2110,8 +2113,7 @@ static void destroy_discard_cmd_control(struct f2fs_sb_info *sbi)
 	 * Recovery can cache discard commands, so in error path of
 	 * fill_super(), it needs to give a chance to handle them.
 	 */
-	if (unlikely(atomic_read(&dcc->discard_cmd_cnt)))
-		f2fs_issue_discard_timeout(sbi);
+	f2fs_issue_discard_timeout(sbi);
 
 	kfree(dcc);
 	SM_I(sbi)->dcc_info = NULL;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 79bf1faf4161..71e6b2bea1f4 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1576,8 +1576,7 @@ static void f2fs_put_super(struct super_block *sb)
 	/* be sure to wait for any on-going discard commands */
 	dropped = f2fs_issue_discard_timeout(sbi);
 
-	if ((f2fs_hw_support_discard(sbi) || f2fs_hw_should_discard(sbi)) &&
-					!sbi->discard_blks && !dropped) {
+	if (f2fs_realtime_discard_enable(sbi) && !sbi->discard_blks && !dropped) {
 		struct cp_control cpc = {
 			.reason = CP_UMOUNT | CP_TRIMMED,
 		};
@@ -2408,8 +2407,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		} else {
 			dcc = SM_I(sbi)->dcc_info;
 			f2fs_stop_discard_thread(sbi);
-			if (atomic_read(&dcc->discard_cmd_cnt))
-				f2fs_issue_discard_timeout(sbi);
+			f2fs_issue_discard_timeout(sbi);
 			need_restart_discard = true;
 		}
 	}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
