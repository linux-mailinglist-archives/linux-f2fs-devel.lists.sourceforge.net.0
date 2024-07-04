Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23280926DB4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2024 04:58:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPCg2-00061P-GH;
	Thu, 04 Jul 2024 02:58:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sPCg1-000618-3x
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 02:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QCtAYjmzpWHd5wSlUx2o0NPuLZIfetrskU+CGIKzbm8=; b=aFUIa055HQ9O0V4PahMxqr9eFW
 xHGNH+xJDb/VE+TlGUCmpiydAzXye/1rbTy9YEq+6702CNrRhkGuIvaeqAM2eeguiWxnP0RQxuQcG
 yHZ9RO6/9CWnnrlBUHITjGPayzFxE8pjUr2OcCGJJgbucT7EthL5YWACDYCoz7qQ5ncY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QCtAYjmzpWHd5wSlUx2o0NPuLZIfetrskU+CGIKzbm8=; b=i63e/WFLXZMlWPD4cxu+0WAmB9
 eywjxxRiWIT+iMHsTsFEAjur+jf53WihSWKtXdPSdHALpFRcLloXWSe14ss5dQH/R6bfYHMZmmPJY
 HyeOQcMef7ooqwTpnCSvMjofyOyrVAHmHL3EniMQrVfSiSMRK94GBP7fDnJ5Tj7GDKQk=;
Received: from mail-sgaapc01on2042.outbound.protection.outlook.com
 ([40.107.215.42] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPCg1-00010i-8A for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 02:58:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcjpnN2xsws+HGA0mdZMCKjlQYcgml2QP56sT0ElikoCmIaUO3+K2pUqxzfyiO3cjyoIYWic8GXAq+rpSN0rWLyOT6fcFoDh6eSXPVqN2i7ycVgg1i3+xB/6iz4yiN0QhQMezZ1iBmjHZQFPrNJGzIa+dr/cR5lER8phVHlvXm78j0waQgmKsNnbb0Ewvl6jy0GfjP9rgUuSDsUl47PVk2NAv4TlEdu0rd3q/rwrBBiZQqdjT3AbOUb8Ie2X6vAozoo0hNpdzKqJ3Azyc5LOeCC948Ougt6yu/v45X0QUR460SNj0VD9JyJtZ/Ww2t9EBT4/siFpCd69ocV2Dwk2aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCtAYjmzpWHd5wSlUx2o0NPuLZIfetrskU+CGIKzbm8=;
 b=SoMpLURA++t0fbAB1bNZnEU6sIvpQrJYCt0qP4zSJnHNZXsilhk09zqyBTJLITjLZMUTcGUqSS3moV3weKIegJnGU2/ZiRe0ain3pL92xIQUv9ZoWhzRbUQ7IxivL95GAYPbduWTL0hm50yPU4bbj0cRxJNylKqMkznowXsLFRqhObXyTBQDo45eOSkVpcmqI10r4BgV3I1xoWVnW0dRo6f2fGaAhbVmbQdBDPYGO6rVgrl1N0aiqNRFycOEsVTCgaApR6uw1YEYn7r4YYoBjwCviId/DIh5Wqdn0fRf28wOQ/iBC715g2qooYyGCJcaE9qkMg6BzXvGYj7xxyizog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCtAYjmzpWHd5wSlUx2o0NPuLZIfetrskU+CGIKzbm8=;
 b=uRwoDPziVul/sz+ejkJ6cTla19ACKEmssQdpw2QgnZk4HXXAza8NS3jgSc0yoDkreJpWRnXamDQXhN0qixokA8CNxnFC2CbvdUDUTc0x806nXI0d15KslwiXs/nk0EywADOnxFN4fvS+L/fTWZu2ivYRYYE3Ia+02nVu9nk1fH4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEYPR02MB7733.apcprd02.prod.outlook.com (2603:1096:101:20c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 02:58:16 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7719.029; Thu, 4 Jul 2024
 02:58:16 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Thu,  4 Jul 2024 10:57:38 +0800
Message-Id: <20240704025740.527171-9-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240704025740.527171-1-shengyong@oppo.com>
References: <20240704025740.527171-1-shengyong@oppo.com>
X-ClientProxiedBy: TYAPR01CA0220.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::16) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEYPR02MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: fc7656b8-1d0d-4dd9-eef7-08dc9bd526ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H9kgEC+36xzp7y146ddLPnRiWTXS03a/ntWU019SdEys2Ix3h5OiYSo0GKbd?=
 =?us-ascii?Q?+D3HesunaXorqdxfOmQahGRByyeVYqh0yaTuQX68N5FiC/KACU+tUPaJdHrn?=
 =?us-ascii?Q?swR6yTFPR0AnllaK7LCAbgXLA3txHvoKPyfqEi5zv7xdDDNj+xG9aU/NCyxv?=
 =?us-ascii?Q?0c4ciK9LWGM02Ch9Jcvj3D09c6Jn/iCJUlk98YfFO8aLb6jmfBXYY9GMLdfO?=
 =?us-ascii?Q?ajfm6strJdL04vBYzCr78D5gdvzhW52PkzwSAvaI7ilztrP1NfR6Etim98Vo?=
 =?us-ascii?Q?r7xzWLQ94uOl+gYvublJBFzHCldVD3CSuxeRm6gUyGa9tpftOjrmdQzmklak?=
 =?us-ascii?Q?AzKnW8KmLW70h1/X3U5FkSNpcNoSuQvXEMJ3yFEJiyE4OvnfhrL2fRuWYBDD?=
 =?us-ascii?Q?XdNy7l1MFk0NDmSAKwa8uxi2bQ51CwDGfI/4h5S0LOe6HqmO4tRRmCZ1s7n6?=
 =?us-ascii?Q?knyQICBsGM9gtPan7frG0NeHDW2ExQDcRs7YbhbNRn6+DyS+Kb2bfZQmz8rT?=
 =?us-ascii?Q?keYHKR2pWIScI02wbpOSzLC7WldEa0CSN7fEWN15To+4k2BqJ7mnNRNVY0Vb?=
 =?us-ascii?Q?Rsep7jgfRJ67vVGgBDffs5CEQFb7yCIRdTrBHr7V3WAjzh0/9chz1nKBzdT2?=
 =?us-ascii?Q?gTgt7lY8VIlLAuCWIA3x7b8jU5Y0h0hGsub86j94t9R74UcD4gPSDsNi37h3?=
 =?us-ascii?Q?EyP1aVPaRdT98VhqgZB4pR4jtw51GAuezMeYul4TjBk8Wf+N/zI3cGcw7ReT?=
 =?us-ascii?Q?EMmf8srA7IpM1zLyceISxYBOdiL9TelliOyQosvrDdglYta+iFOXJttjaewL?=
 =?us-ascii?Q?ISbeWom9P8JRbLc2jRs+lh/ppq38IFWY87CKLNrqzdq2DJ+jC/pPZBimjOyH?=
 =?us-ascii?Q?mrLcrxBA8vullaw052aOFSxLnG+maxagLLmIWpLai+2/t2UqnpkwuIEIAUxq?=
 =?us-ascii?Q?HQRK8g2ODxrBy6USPiQagB6aMm1THmx3loL+0TvEkwIxVrHo4yzURP+hSjFp?=
 =?us-ascii?Q?AgLwqm26ZXj7GSAoe3WpKkMazZHlJGFxLNFYqKsytzPsE7ugwIXIcUPMq0zE?=
 =?us-ascii?Q?DkteKFsuTayEIgq6ZyoYcdXTuInTEQpitGyjuuECS4esBiV9+70WhQiDCHzM?=
 =?us-ascii?Q?ptAGAjiuCHkg5lqquDcNZc6Bmgmj9LOXfIpbpnzzGTpv3LpCM0/qeiniGYx7?=
 =?us-ascii?Q?qOZFzulhbFgAx9AfrzDo7+N0DMv3XgALKpyTVYWcPVplQBDM+A1HQ33g6sHV?=
 =?us-ascii?Q?RfK35/eP/p8EWtSotpUuiGuIICDlMdJ/bAvZr0cEdPUctLK23sd7X9hYeF9l?=
 =?us-ascii?Q?M9iY13CHl9MFGDhlC4zJTe8IagqH5nmZuC9I5ENThlJxjl4ByPfeXP+XMgAS?=
 =?us-ascii?Q?qMOX5ii3rGT3cZ3Mgh5Fkr6LfXGfrXAyZiF278SIZlCgagtBlA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HEhOdWvGquqTLo3V9MJuE9+EtxwF5W/XX/FOwTPLiMrvMAyDIMqAbJ+PTyrb?=
 =?us-ascii?Q?BD2HeEhQJGAdw2HN6unRr+lyUZw94lc/elmWJN71Ez6j5DvTj9hoVoxKrUCT?=
 =?us-ascii?Q?2VYpb2JF0q+PH0LpgxW5fJvbto3IBO5ieGWzypHhcozL7NQeOICz9slMbxnJ?=
 =?us-ascii?Q?1YPTsnz7ZiRyVwu2h6KXy9MVv3eyfsTqmDvh3PDDkz4n0vtDYy4BEGGQEr0N?=
 =?us-ascii?Q?C79PnO/c5WCFrVwz8q9hQUqIoWdiIkaScJ6/jKnhPQKSie+enYqKQWG/yI9e?=
 =?us-ascii?Q?2bcB0uajEpjgRCk0ditmkYdykfBk1P3yhP0fqqxtqnrr4GhgFVa5GEUnz61I?=
 =?us-ascii?Q?imxnTRcMHVOQvZibgyVjEqLeozhL4rAs0itrAtEdS3DmGboru5F6HA08rSIm?=
 =?us-ascii?Q?MBy2vab2Px19mro2eS/aqDUcJsvVuaLQ0XCCt6vj/bPvmHmp+yhypax1R4YT?=
 =?us-ascii?Q?/UkyJqoge8xOV8U6kzlP+mZSQQ9w/2vXICJwR46KfJ6Xkltej/AKPQ17UoKj?=
 =?us-ascii?Q?2h00SufSpCCI9olYwD/Ti/rR0sjo7SpKrTd6k4XPsH8mEDsJ/zCo/fosc1lM?=
 =?us-ascii?Q?io74s/GbkcFHvwPAm5tG32Vg7A9r58YqJ80lf7fLiRKt21gQ8UyyhHg7gTwO?=
 =?us-ascii?Q?9UYamt/dXIgcbqORllRCtLeZn6zreo9XUPf8pcL6JG6xQ3qqt9+j3eS02soC?=
 =?us-ascii?Q?QY3rAxDzK6YnrdgfxbezxWIXp7DZQ0z4+zh86Sv0kuYbIFY2TV2XqBmDWeve?=
 =?us-ascii?Q?6Ldm/3u6fbxW95tYQSWTmGiPIXERqe3K2itf4g6ivAz/dREWvp82fabfv26/?=
 =?us-ascii?Q?8CxvkgCTyfRHo9Ow6ZmtJglfNTvGL2giSGGm98L8F07GIl7xhejrD75QxLTn?=
 =?us-ascii?Q?18Y8yTSLGXMYOKzFVDXvYMfCRmPKlBG0UcFqVKdPMnviHdrcOOGGupGKodD+?=
 =?us-ascii?Q?cNsjxNsTEbKWZqQghh6mR0DT9XPHdzxv/dq9W0PYuVgcqY6un9am3btnqq7S?=
 =?us-ascii?Q?eW+nAookzFiN8YcLH2pySb694sLWjkC0fvtjWksqgheTmCWyeamT/keoKyVb?=
 =?us-ascii?Q?Laa2LUwpoRuJpd9/woSicUl2PiJ1YyJ8xuwjVx38X1sydGW9voGxpn09LUIE?=
 =?us-ascii?Q?LZoNZ/XctIl0pTFZAdqS0wMnqmvdhJM5rSuaLFR7pXvH+x2HBtpijw/C9GwZ?=
 =?us-ascii?Q?7NxOvRLt5j6W/lIQO/GJ0oCShEGG6Y/RzPy9pYYAVrbbOkWaTueo0KFfuuZx?=
 =?us-ascii?Q?u1LNrBjTbx7+J4/4aeSLbknAz870i6lIbjxYA425aMAKBjljVqYbAAQi38Xx?=
 =?us-ascii?Q?Tsn3UYgwYHSJqBvUCqafkVT/mnMXsH+I/QWbf19t9WVhkREsFK9F88IKuM6A?=
 =?us-ascii?Q?LQC3tJhIM42l56EbUh3Fpt1p0AjNNfGqeW9vwznz9VBUgWXU/J5XZPPAv8OC?=
 =?us-ascii?Q?y81c7M/nCYcUvsoBPFfBkI0vLfJSZKknvSi+Qhff4lF+9wzFDoTTr8fSSfnS?=
 =?us-ascii?Q?GtHfhJNKwRNwTRu/GAHVe5EFeYTHrgmOlm6Db3J0RCBPCObw/9mG/qTPCWDF?=
 =?us-ascii?Q?ceOR/ZAueeK3Jx4ocRSh5gf8AiLOWaE8qNyrNhLU?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7656b8-1d0d-4dd9-eef7-08dc9bd526ce
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 02:58:16.3693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: awOqCmSbvpF2l3b8fjNT0ZK1KReBF5yOpWhBeH7MbGe+nnNCjdQMEupwZARzuYP60ICHlTyI79g6mfy6UeeHQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB7733
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch enables injecting node block.
 print_node_footer_info()
 is added to show values of node footer. The meanings of options are: * node:
 means node is injected. The members could be injected in cp contains: * nid:
 node footer nid * ino: node footer ino * flag: node footer flag * cp_ver:
 node footer cp_ver * next_blkaddr: node footer next_blkaddr * i_mode: ino
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.42 listed in sa-trusted.bondedsender.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.42 listed in wl.mailspike.net]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.42 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.215.42 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1sPCg1-00010i-8A
Subject: [f2fs-dev] [RCF PATCH v3 08/10] inject.f2fs: add node injection
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch enables injecting node block. print_node_footer_info() is
added to show values of node footer.

The meanings of options are:
 * node: means node is injected.

The members could be injected in cp contains:
 * nid: node footer nid
 * ino: node footer ino
 * flag: node footer flag
 * cp_ver: node footer cp_ver
 * next_blkaddr: node footer next_blkaddr
 * i_mode: inode i_mode
 * i_advise: inode i_advise
 * i_inline: inode i_inline
 * i_links: inode i_links
 * i_size: inode i_size
 * i_blocks: inode i_blocks
 * i_extra_isize: inode i_extra_isize
 * i_inode_checksum: inode i_inode_checksum
 * i_addr: inode i_addr array
 * i_nid: inode i_nid array
 * addr: {in}direct node nid/addr array

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/inject.c | 213 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h |   1 +
 2 files changed, 214 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index d6f8774..2a21dae 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -62,6 +62,18 @@ static void print_sum_footer_info(struct summary_footer *footer)
 	DISP_u32(footer, check_sum);
 }
 
+static void print_node_footer_info(struct node_footer *footer)
+{
+	if (!c.dbg_lv)
+		return;
+
+	DISP_u32(footer, nid);
+	DISP_u32(footer, ino);
+	DISP_u32(footer, flag);
+	DISP_u64(footer, cp_ver);
+	DISP_u32(footer, next_blkaddr);
+}
+
 void inject_usage(void)
 {
 	MSG(0, "\nUsage: inject.f2fs [options] device\n");
@@ -79,6 +91,7 @@ void inject_usage(void)
 	MSG(0, "  --nat <0|1|2> --mb <name> --nid <nid> --val <value> inject nat entry\n");
 	MSG(0, "  --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
 	MSG(0, "  --ssa --mb <name> --blk <blk> [--idx <index>] --val <value> inject summary entry\n");
+	MSG(0, "  --node --mb <name> --nid <nid> [--idx <index>] --val <value> inject node\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
@@ -151,6 +164,28 @@ static void inject_ssa_usage(void)
 	MSG(0, "  ofs_in_node: inject summary entry ofs_in_node selected by --idx <index\n");
 }
 
+static void inject_node_usage(void)
+{
+	MSG(0, "inject.f2fs --node --mb <name> --nid <nid> [--idx <index>] --val <value> inject node\n");
+	MSG(0, "[mb]:\n");
+	MSG(0, "  nid: inject node footer nid\n");
+	MSG(0, "  ino: inject node footer ino\n");
+	MSG(0, "  flag: inject node footer flag\n");
+	MSG(0, "  cp_ver: inject node footer cp_ver\n");
+	MSG(0, "  next_blkaddr: inject node footer next_blkaddr\n");
+	MSG(0, "  i_mode: inject inode i_mode\n");
+	MSG(0, "  i_advise: inject inode i_advise\n");
+	MSG(0, "  i_inline: inject inode i_inline\n");
+	MSG(0, "  i_links: inject inode i_links\n");
+	MSG(0, "  i_size: inject inode i_size\n");
+	MSG(0, "  i_blocks: inject inode i_blocks\n");
+	MSG(0, "  i_extra_isize: inject inode i_extra_isize\n");
+	MSG(0, "  i_inode_checksum: inject inode i_inode_checksum\n");
+	MSG(0, "  i_addr: inject inode i_addr array selected by --idx <index>\n");
+	MSG(0, "  i_nid: inject inode i_nid array selected by --idx <index>\n");
+	MSG(0, "  addr: inject {in}direct node nid/addr array selected by --idx <index>\n");
+}
+
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 {
 	int o = 0;
@@ -170,6 +205,7 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		{"sit", required_argument, 0, 10},
 		{"blk", required_argument, 0, 11},
 		{"ssa", no_argument, 0, 12},
+		{"node", no_argument, 0, 13},
 		{0, 0, 0, 0}
 	};
 
@@ -254,6 +290,10 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			opt->ssa = true;
 			MSG(0, "Info: inject ssa\n");
 			break;
+		case 13:
+			opt->node = true;
+			MSG(0, "Info: inject node\n");
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -280,6 +320,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			} else if (opt->ssa) {
 				inject_ssa_usage();
 				exit(0);
+			} else if (opt->node) {
+				inject_node_usage();
+				exit(0);
 			}
 			return EUNKNOWN_OPT;
 		}
@@ -687,6 +730,174 @@ out:
 	return ret;
 }
 
+static int inject_inode(struct f2fs_sb_info *sbi, struct f2fs_node *node,
+			struct inject_option *opt)
+{
+	struct f2fs_inode *inode = &node->i;
+
+	if (!strcmp(opt->mb, "i_mode")) {
+		MSG(0, "Info: inject inode i_mode of nid %u: 0x%x -> 0x%x\n",
+		    opt->nid, le16_to_cpu(inode->i_mode), (u16)opt->val);
+		inode->i_mode = cpu_to_le16((u16)opt->val);
+	} else if (!strcmp(opt->mb, "i_advise")) {
+		MSG(0, "Info: inject inode i_advise of nid %u: 0x%x -> 0x%x\n",
+		    opt->nid, inode->i_advise, (u8)opt->val);
+		inode->i_advise = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "i_inline")) {
+		MSG(0, "Info: inject inode i_inline of nid %u: 0x%x -> 0x%x\n",
+		    opt->nid, inode->i_inline, (u8)opt->val);
+		inode->i_inline = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "i_links")) {
+		MSG(0, "Info: inject inode i_links of nid %u: %u -> %u\n",
+		    opt->nid, le32_to_cpu(inode->i_links), (u32)opt->val);
+		inode->i_links = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "i_size")) {
+		MSG(0, "Info: inject inode i_size of nid %u: %lu -> %lu\n",
+		    opt->nid, le64_to_cpu(inode->i_size), (u64)opt->val);
+		inode->i_size = cpu_to_le64((u64)opt->val);
+	} else if (!strcmp(opt->mb, "i_blocks")) {
+		MSG(0, "Info: inject inode i_blocks of nid %u: %lu -> %lu\n",
+		    opt->nid, le64_to_cpu(inode->i_blocks), (u64)opt->val);
+		inode->i_blocks = cpu_to_le64((u64)opt->val);
+	} else if (!strcmp(opt->mb, "i_extra_isize")) {
+		/* do not care if F2FS_EXTRA_ATTR is enabled */
+		MSG(0, "Info: inject inode i_extra_isize of nid %u: %d -> %d\n",
+		    opt->nid, le16_to_cpu(inode->i_extra_isize), (u16)opt->val);
+		inode->i_extra_isize = cpu_to_le16((u16)opt->val);
+	} else if (!strcmp(opt->mb, "i_inode_checksum")) {
+		MSG(0, "Info: inject inode i_inode_checksum of nid %u: "
+		    "0x%x -> 0x%x\n", opt->nid,
+		    le32_to_cpu(inode->i_inode_checksum), (u32)opt->val);
+		inode->i_inode_checksum = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "i_addr")) {
+		/* do not care if it is inline data */
+		if (opt->idx >= DEF_ADDRS_PER_INODE) {
+			ERR_MSG("invalid index %u of i_addr[]\n", opt->idx);
+			return -EINVAL;
+		}
+		MSG(0, "Info: inject inode i_addr[%d] of nid %u: "
+		    "0x%x -> 0x%x\n", opt->idx, opt->nid,
+		    le32_to_cpu(inode->i_addr[opt->idx]), (u32)opt->val);
+		inode->i_addr[opt->idx] = cpu_to_le32((block_t)opt->val);
+	} else if (!strcmp(opt->mb, "i_nid")) {
+		if (opt->idx >= 5) {
+			ERR_MSG("invalid index %u of i_nid[]\n", opt->idx);
+			return -EINVAL;
+		}
+		MSG(0, "Info: inject inode i_nid[%d] of nid %u: "
+		    "0x%x -> 0x%x\n", opt->idx, opt->nid,
+		    le32_to_cpu(F2FS_INODE_I_NID(inode, opt->idx)),
+		    (u32)opt->val);
+		F2FS_INODE_I_NID(inode, opt->idx) = cpu_to_le32((nid_t)opt->val);
+	} else {
+		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+		return -EINVAL;
+	}
+
+	if (c.dbg_lv > 0)
+		print_node_info(sbi, node, 1);
+
+	return 0;
+}
+
+static int inject_index_node(struct f2fs_sb_info *sbi, struct f2fs_node *node,
+			     struct inject_option *opt)
+{
+	struct direct_node *dn = &node->dn;
+
+	if (strcmp(opt->mb, "addr")) {
+		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+		return -EINVAL;
+	}
+
+	if (opt->idx >= DEF_ADDRS_PER_BLOCK) {
+		ERR_MSG("invalid index %u of nid/addr[]\n", opt->idx);
+		return -EINVAL;
+	}
+
+	MSG(0, "Info: inject node nid/addr[%d] of nid %u: 0x%x -> 0x%x\n",
+	    opt->idx, opt->nid, le32_to_cpu(dn->addr[opt->idx]),
+	    (block_t)opt->val);
+	dn->addr[opt->idx] = cpu_to_le32((block_t)opt->val);
+
+	if (c.dbg_lv > 0)
+		print_node_info(sbi, node, 1);
+
+	return 0;
+}
+
+static int inject_node(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
+	struct f2fs_super_block *sb = sbi->raw_super;
+	struct node_info ni;
+	struct f2fs_node *node_blk;
+	struct node_footer *footer;
+	int ret;
+
+	if (!IS_VALID_NID(sbi, opt->nid)) {
+		ERR_MSG("Invalid nid %u range [%u:%lu]\n", opt->nid, 0,
+			NAT_ENTRY_PER_BLOCK *
+			((get_sb(segment_count_nat) << 1) <<
+			 sbi->log_blocks_per_seg));
+		return -EINVAL;
+	}
+
+	node_blk = calloc(F2FS_BLKSIZE, 1);
+	ASSERT(node_blk);
+
+	get_node_info(sbi, opt->nid, &ni);
+	ret = dev_read_block(node_blk, ni.blk_addr);
+	ASSERT(ret >= 0);
+	footer = F2FS_NODE_FOOTER(node_blk);
+
+	if (!strcmp(opt->mb, "nid")) {
+		MSG(0, "Info: inject node footer nid of nid %u: %u -> %u\n",
+		    opt->nid, le32_to_cpu(footer->nid), (u32)opt->val);
+		footer->nid = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "ino")) {
+		MSG(0, "Info: inject node footer ino of nid %u: %u -> %u\n",
+		    opt->nid, le32_to_cpu(footer->ino), (u32)opt->val);
+		footer->ino = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "flag")) {
+		MSG(0, "Info: inject node footer flag of nid %u: "
+		    "0x%x -> 0x%x\n", opt->nid, le32_to_cpu(footer->flag),
+		    (u32)opt->val);
+		footer->flag = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "cp_ver")) {
+		MSG(0, "Info: inject node footer cp_ver of nid %u: "
+		    "0x%lx -> 0x%lx\n", opt->nid, le64_to_cpu(footer->cp_ver),
+		    (u64)opt->val);
+		footer->cp_ver = cpu_to_le64((u64)opt->val);
+	} else if (!strcmp(opt->mb, "next_blkaddr")) {
+		MSG(0, "Info: inject node footer next_blkaddr of nid %u: "
+		    "0x%x -> 0x%x\n", opt->nid,
+		    le32_to_cpu(footer->next_blkaddr), (u32)opt->val);
+		footer->next_blkaddr = cpu_to_le32((u32)opt->val);
+	} else if (ni.nid == ni.ino) {
+		ret = inject_inode(sbi, node_blk, opt);
+	} else {
+		ret = inject_index_node(sbi, node_blk, opt);
+	}
+	if (ret)
+		goto out;
+
+	print_node_footer_info(footer);
+
+	/*
+	 * if i_inode_checksum is injected, should call update_block() to
+	 * avoid recalculate inode checksum
+	 */
+	if (ni.nid == ni.ino && strcmp(opt->mb, "i_inode_checksum"))
+		ret = update_inode(sbi, node_blk, &ni.blk_addr);
+	else
+		ret = update_block(sbi, node_blk, &ni.blk_addr, NULL);
+	ASSERT(ret >= 0);
+
+out:
+	free(node_blk);
+	return ret;
+}
+
 int do_inject(struct f2fs_sb_info *sbi)
 {
 	struct inject_option *opt = (struct inject_option *)c.private;
@@ -702,6 +913,8 @@ int do_inject(struct f2fs_sb_info *sbi)
 		ret = inject_sit(sbi, opt);
 	else if (opt->ssa)
 		ret = inject_ssa(sbi, opt);
+	else if (opt->node)
+		ret = inject_node(sbi, opt);
 
 	return ret;
 }
diff --git a/fsck/inject.h b/fsck/inject.h
index c828f3f..9b14c31 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -31,6 +31,7 @@ struct inject_option {
 	int nat;		/* which nat pack */
 	int sit;		/* which sit pack */
 	bool ssa;
+	bool node;
 };
 
 void inject_usage(void);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
