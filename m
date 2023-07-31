Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D0A768998
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Jul 2023 03:27:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qQHgZ-00056N-Ec;
	Mon, 31 Jul 2023 01:26:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1qQHgX-000567-Sl
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Jul 2023 01:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ftiKlnChgzmimxdE4psm15pqfVbdud4EXNSyw1WZaRQ=; b=PW9ibjvlIdWGdi0FFGEVhEdiVb
 plfqnK946uO5C0622mXJMYa1istVj/Hk5rI2GKslyNi6rGDqp7ajFePy6kKnyBpr7PfxXNGfuK+rD
 kDt9kQh58Z5BaxxyOQSIGAA9yt3Zb+/ypFqkZm50P1beRAG8ZU9DbZYuljuzZRthVKTE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ftiKlnChgzmimxdE4psm15pqfVbdud4EXNSyw1WZaRQ=; b=P
 XeY9dPsWxFguMMO5QmE8E17KGb5NFPQt4PaKfYiQGjVWy/405QnK2qK9hNqFyb7X3wBHLjIbW5Vdu
 cl9JgdyOnE3NG2Lq5n817wPQQLRPIRwPwhKT8E/ghmT/L2Jt6F8EKD+/Y4cgrThcluBhFXi8eiSuv
 q3CQw8VNf4hhdCdg=;
Received: from mail-tyzapc01on2132.outbound.protection.outlook.com
 ([40.107.117.132] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qQHgO-0002hn-GL for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Jul 2023 01:26:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AosDkCPij8c/W7miGvzF/befMz9hwhwyU8XdtoEPxALCPKt6ZLfk7XPmvmZCs1HAQzHfc2mD7iS87ebOK7uwTBN2kPiIQmBCQUHrNk7t288DLzob+uGoE67aEejNVUAFcSeL5RwlVrgx/vQfScJtxKcstAcYeQlcEMmW6JJYCM6COhygYAZc+SRyGOa/A6iFX7S9BzJ3b+KX5gv3Rzrs59jiXU3Tb+8suhC/Bub7ovRowpgWpiA7IaLxH5Ksd+VXdQl8TeWO34lkroCa3cvBbGhAvcvsW4+nj2I1abSbLaFtWmqvASCAuFnWpaybQ0TU17Q79PEu9Czyu7gaUNN7gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftiKlnChgzmimxdE4psm15pqfVbdud4EXNSyw1WZaRQ=;
 b=W/6jXNLhKICta371JPKj5V7YbHGL64Df5U4UwS1QMpAG7aN/U6o3RtggnXUdfVgfRoOjQb1jka5xJS6TomEhZbjK9uGnTILPRLh/Tl2ol08R+PCj8pvsUpaJjEJOR2Yoa1bVcMyCxC3F06cHwXIcOp1gMRsbtH/lgmZk+GPT6Ow2D0uSIwl5k4j78TbVYiIPZ0CucGV4TnITgEklxkzcTQQjpkwFi3vqshxIcAIDKNBTtE4jPIYKEPqIL6fwY6U32N9udaPdIY7F6zmC621irNy7Lwxyt2xvh3/1Q786kM9IZnQIHQJ2ElogUEi+jyFwccM+Q6w/gaS6V/VNS4mNxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftiKlnChgzmimxdE4psm15pqfVbdud4EXNSyw1WZaRQ=;
 b=hmKEqBxf/PjiJx7kOnt5Gyh8omMJPVhwr+lbn3hRBjGav7UniIt1xnGft4SU9baFa703sy6dQGafOMHNuPX6mXK8IM5VAINS/S7EMbdqyMPki7EoAsPdB2QcEXO6mUS3tf8M4gHuZgCOUT2gHaMVCJ8mQKtHjx26tzA7qdzSbiqjd477GcdMPCh+jnnkZA0aEl5IwA27gT3CW7fMckCSCmVoNn4HVksizFcr53mqc4uYeIFbszBLp7eYky8rOIe4BXNAftEMz/j3RpMntcp6hNUe54ggUmXFh5a2uR0m8Q7iey6n50EH5kzK4JFEXx5IARpE9N/oC93VkJltNZfhzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com (2603:1096:100:3a::16)
 by TYSPR06MB6648.apcprd06.prod.outlook.com (2603:1096:400:472::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 01:26:35 +0000
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::c78b:9b1d:f28c:4233]) by SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::c78b:9b1d:f28c:4233%4]) with mapi id 15.20.6631.039; Mon, 31 Jul 2023
 01:26:35 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Jul 2023 09:26:26 +0800
Message-Id: <20230731012626.6843-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.35.3
X-ClientProxiedBy: TYCP286CA0116.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::8) To SL2PR06MB3017.apcprd06.prod.outlook.com
 (2603:1096:100:3a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR06MB3017:EE_|TYSPR06MB6648:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b3b995-8eb2-4452-e82f-08db91652e19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vWslCMhZhIkjMpCdMucvPXhUqc6Qf+AaaesRoLaRgwXNd8humqMEnE2vE8bqdzTRsiFE5GkBI8ahRkQQgafUqilUBCYj4c8IG4THcKZwG/+lMETzvaZ7upIVw/+4+Tdn5lFgpXpchjRYxjohOOAsaPz/Sk2q0sNBGbwJUi1o13n5Hta3f0+CCQb9JoAG///DGEiOtia79NkCBSTY39warI/Ro7qF/pVcqGY1llj64xpKmtuEiYwT15MMjOsbem3ah6d5DUHVnhYMO6OMl6GBd+qGMu6dbXlzZeX7FTfPPSGRiWkoFK48CF5wdsrOQsvhHTSzL/TzOINmy6Q79SMSiBh6ZTtFDV0QtTxQnr+tk7znwZCz2+9UCavQqjcn+HWSKWZp1Nc6aVVDD08UIWxYYVffFuvJA8hycpbxvYn//d4kc1KhRKBTengKPa3jRjsdnhi8AetfuoAkDokfIISF1yzfNDDC5wNuO5rXeKo6PWlDAJRb76BIi2697K7LwW/AA/fjN5oUVnQTvnNXkYifuNffmfF/oADP2GvyUmRnD6Hb+tgP4mMAXsMeoHA2en6AgdUSDVvA7PKxx252tkC74RPh+Pndy6r6Avw80fZU+sLqEuCoeJMKztqzt4KFRKBL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3017.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39850400004)(376002)(366004)(136003)(396003)(451199021)(2616005)(5660300002)(36756003)(30864003)(38100700002)(38350700002)(2906002)(26005)(83380400001)(478600001)(8676002)(186003)(1076003)(6506007)(8936002)(316002)(6512007)(6666004)(6486002)(41300700001)(86362001)(52116002)(66946007)(110136005)(4326008)(66556008)(66476007)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/NukmiCsyo6wKUu6S2YM4bFEjqg1CWiQ4uVuyJ++4g9UJeb+7x3yNkNteWQU?=
 =?us-ascii?Q?0CNCChN15L2BTeqrBtE3KzzOnmDEIjxpja1/4rlnAzwQaQHXW6zWspfC9fng?=
 =?us-ascii?Q?AvpBNV8vguSLR9RojUYYkrvnNaO9I3h6K3Pp0MxgxDmr8XW0pbqfbfFwhG87?=
 =?us-ascii?Q?WsSZ/XqmJLolV1/NeDCZdR6yGgiKPKHy1MbNoexFYMDHrH1JkXYmUMfk873d?=
 =?us-ascii?Q?hDzxZT4DuCoYuOnT6HwuoFNykJkpNOaI13lCCD8Ao4vDKVLEks+cBapnRlRi?=
 =?us-ascii?Q?2zfZnidZGiUaVH4ze6sSfPmJ+8NWqpwzBbDEtb63dSouEZeKQ0mfQk7O4Y08?=
 =?us-ascii?Q?tk8w18JWfcq4bP8mJo4HCFTW4zUF3MbNoxPkytImJHXV7bPuteEo4PqPsKIU?=
 =?us-ascii?Q?p/EYFo/1hh/p9UbpBoK/qQ3VTXeVGAVboiMgYuVu2rFEeJ7LduMooZG/8r1p?=
 =?us-ascii?Q?lVDKX7ngWpehoY5H+BnBwoJn1vI/chbNU+Xlm873tcjUwhGYL6x0JzQUVGjf?=
 =?us-ascii?Q?bXS3HarLlleo+RX5HnaaXtfkgOEIwt4U0BDD6SPOAkLlDkoCYX0WX8FFsVGU?=
 =?us-ascii?Q?ELjVmfsy02442lYOIzZr/bSoltYG2//7YBicJxgxCwtzE9i3m5sw3aMsglza?=
 =?us-ascii?Q?d9SBJZoo1g8Rx5wnb0vJpr5bMAs/9vgA63FWWebU0HYIai3rCbo/B4Jq7hV5?=
 =?us-ascii?Q?Z2zB2VJmWX0V0ZpW5DOish/6nuHEh+Wcf+TMn2d2ll7lHpywdz7VAXjFiR6/?=
 =?us-ascii?Q?l0Cr27FybPT/kGo/M9daAjpZAFpQ5XKukC1T+1JfN37UnOq06lF7aUQq3KfR?=
 =?us-ascii?Q?Z+0h+HLZMizMlGaaf76Lo7xPQw7nXCv9cLh+TosWbbLRRYlrlL5QplZEdkN3?=
 =?us-ascii?Q?HKNWvGf9XicNG9NcTZcqQgkXc4ivOJFoGKSEJtlIE9++eKbG1BNwI2Br91Zz?=
 =?us-ascii?Q?M4tZAdWQppp0X4/wPZcnKrSxhl5HNQCvo6oaxzSZSBK/LUI3IVVpY7v8gra6?=
 =?us-ascii?Q?FfRwfb+jj4vHBMQ6UuvAX621iHcc21X9a0Lwgm+iT8r6nWquEvMzQ0yqw/uU?=
 =?us-ascii?Q?Kj39vgskTUzk/BXoUzaN/+Fkuza1fGvVJatD5an12kovA5FRR1AJQVoMZAW4?=
 =?us-ascii?Q?IV41VTtC9Ku9oHRAZRkcyyM5KgQ8XmaKjUAFQIAJEwerTLXRSNpXkfuCmDNA?=
 =?us-ascii?Q?6ioFjBIqVSYpIiaUJhOBPuaiaHap5XKl74FUCY8Xaz1+fGHn93+eQiRsZR4/?=
 =?us-ascii?Q?avzEYMO68JfJELwitbXOX4Y2/rn5bqfgYqqKkYwgDu1yK/QweSJ7erXiqEDW?=
 =?us-ascii?Q?OUVQJHmO91RUB+AQR+Y+Nt5ZrP4EiaCrMFFIe/8AnbpWcjDDKzbKPFgygFdK?=
 =?us-ascii?Q?TD/A7tPRmOkKmpwruC1xqySXS0lEmv32lXfQV6mxEL/YxanNWHB0u3beCW/j?=
 =?us-ascii?Q?iuOZXQDwWGBAQ9LDST4h4i8k0UiBI3mXEYVEA2jh4T/t5uJlHLLVidx9B3FA?=
 =?us-ascii?Q?W7O7Frp0Jq8yKrD00l3Wnnbgv9S83dmX2fK5s6GsVEMowASArKzav6+MKKU2?=
 =?us-ascii?Q?VIzzzJICo0zEBXQQ2MY6byabIxnJfPjPt/aeSZSy?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b3b995-8eb2-4452-e82f-08db91652e19
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3017.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 01:26:35.6526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: einWBue4IyzsI6+WyiBuuQOJCZD2rrnYGZgUpp+4URJCFyJduO4RoKotF8OLXK9y76m4WoteITOVg963ZyODFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6648
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch has been tested with xfstests by running
 'kvm-xfstests
 -c f2fs -g auto' with and without this patch; no regressions were seen. Some
 tests fail both before and after, and the test results are: f2fs/default:
 683 tests, 9 failures, 226 skipped,
 30297 seconds Failures: generic/050 generic/064
 generic/250 generic/252 generic/459 g [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.132 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.132 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qQHgO-0002hn-GL
Subject: [f2fs-dev] [PATCH 1/1] f2fs: move fiemap to use iomap framework
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

This patch has been tested with xfstests by running 'kvm-xfstests -c
f2fs -g auto' with and without this patch; no regressions were seen.

Some tests fail both before and after, and the test results are:
f2fs/default: 683 tests, 9 failures, 226 skipped, 30297 seconds
  Failures: generic/050 generic/064 generic/250 generic/252 generic/459
      generic/506 generic/563 generic/634 generic/635

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/data.c   | 238 ++++++++++++++++++++---------------------------
 fs/f2fs/f2fs.h   |   8 +-
 fs/f2fs/inline.c |  20 ++--
 3 files changed, 120 insertions(+), 146 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5882afe71d82..2d0be051a875 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1599,12 +1599,14 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	unsigned int maxblocks = map->m_len;
 	struct dnode_of_data dn;
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	unsigned int cluster_size = F2FS_I(inode)->i_cluster_size;
+	unsigned int cluster_mask = cluster_size - 1;
 	int mode = map->m_may_create ? ALLOC_NODE : LOOKUP_NODE;
 	pgoff_t pgofs, end_offset, end;
-	int err = 0, ofs = 1;
-	unsigned int ofs_in_node, last_ofs_in_node;
+	int err = 0, ofs = 1, append = 0;
+	unsigned int ofs_in_node, last_ofs_in_node, ofs_in_cluster;
 	blkcnt_t prealloc;
-	block_t blkaddr;
+	block_t blkaddr, start_addr;
 	unsigned int start_pgofs;
 	int bidx = 0;
 	bool is_hole;
@@ -1691,6 +1693,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 			map->m_flags |= F2FS_MAP_NEW;
 	} else if (is_hole) {
 		if (f2fs_compressed_file(inode) &&
+		    blkaddr == COMPRESS_ADDR &&
 		    f2fs_sanity_check_cluster(&dn) &&
 		    (flag != F2FS_GET_BLOCK_FIEMAP ||
 		     IS_ENABLED(CONFIG_F2FS_CHECK_FS))) {
@@ -1712,6 +1715,18 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 					*map->m_next_pgofs = pgofs + 1;
 				goto sync_out;
 			}
+			if (f2fs_compressed_file(inode) &&
+			    blkaddr == COMPRESS_ADDR) {
+				/* split consecutive cluster */
+				if (map->m_len) {
+					dn.ofs_in_node--;
+					goto sync_out;
+				}
+				pgofs++;
+				dn.ofs_in_node++;
+				append = 1;
+				goto next_block;
+			}
 			break;
 		default:
 			/* for defragment case */
@@ -1750,6 +1765,10 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 		goto sync_out;
 	}
 
+	/* 1 cluster 1 extent, split consecutive cluster */
+	if (append && !((dn.ofs_in_node + 1) & cluster_mask))
+		goto sync_out;
+
 skip:
 	dn.ofs_in_node++;
 	pgofs++;
@@ -1832,6 +1851,20 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 		if (map->m_next_extent)
 			*map->m_next_extent = pgofs + 1;
 	}
+
+	if (flag == F2FS_GET_BLOCK_FIEMAP && f2fs_compressed_file(inode)) {
+		ofs_in_node = round_down(dn.ofs_in_node, cluster_size);
+		ofs_in_cluster = dn.ofs_in_node & cluster_mask;
+		start_addr = data_blkaddr(dn.inode, dn.node_page, ofs_in_node);
+		if (start_addr == COMPRESS_ADDR) {
+			map->m_flags |= F2FS_MAP_ENCODED;
+			map->m_len += append;
+			/* End of a cluster */
+			if (blkaddr == NULL_ADDR || blkaddr == NEW_ADDR)
+				map->m_len += cluster_size - ofs_in_cluster;
+		}
+	}
+
 	f2fs_put_dnode(&dn);
 unlock_out:
 	if (map->m_may_create) {
@@ -1952,37 +1985,10 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 	return (err < 0 ? err : 0);
 }
 
-static loff_t max_inode_blocks(struct inode *inode)
-{
-	loff_t result = ADDRS_PER_INODE(inode);
-	loff_t leaf_count = ADDRS_PER_BLOCK(inode);
-
-	/* two direct node blocks */
-	result += (leaf_count * 2);
-
-	/* two indirect node blocks */
-	leaf_count *= NIDS_PER_BLOCK;
-	result += (leaf_count * 2);
-
-	/* one double indirect node block */
-	leaf_count *= NIDS_PER_BLOCK;
-	result += leaf_count;
-
-	return result;
-}
-
 int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		u64 start, u64 len)
 {
-	struct f2fs_map_blocks map;
-	sector_t start_blk, last_blk;
-	pgoff_t next_pgofs;
-	u64 logical = 0, phys = 0, size = 0;
-	u32 flags = 0;
-	int ret = 0;
-	bool compr_cluster = false, compr_appended;
-	unsigned int cluster_size = F2FS_I(inode)->i_cluster_size;
-	unsigned int count_in_cluster = 0;
+	int ret;
 	loff_t maxbytes;
 
 	if (fieinfo->fi_flags & FIEMAP_FLAG_CACHE) {
@@ -1991,10 +1997,6 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 			return ret;
 	}
 
-	ret = fiemap_prep(inode, fieinfo, start, &len, FIEMAP_FLAG_XATTR);
-	if (ret)
-		return ret;
-
 	inode_lock(inode);
 
 	maxbytes = max_file_blocks(inode) << F2FS_BLKSIZE_BITS;
@@ -2011,110 +2013,9 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		goto out;
 	}
 
-	if (f2fs_has_inline_data(inode) || f2fs_has_inline_dentry(inode)) {
-		ret = f2fs_inline_data_fiemap(inode, fieinfo, start, len);
-		if (ret != -EAGAIN)
-			goto out;
-	}
-
-	if (bytes_to_blks(inode, len) == 0)
-		len = blks_to_bytes(inode, 1);
-
-	start_blk = bytes_to_blks(inode, start);
-	last_blk = bytes_to_blks(inode, start + len - 1);
-
-next:
-	memset(&map, 0, sizeof(map));
-	map.m_lblk = start_blk;
-	map.m_len = bytes_to_blks(inode, len);
-	map.m_next_pgofs = &next_pgofs;
-	map.m_seg_type = NO_CHECK_TYPE;
-
-	if (compr_cluster) {
-		map.m_lblk += 1;
-		map.m_len = cluster_size - count_in_cluster;
-	}
-
-	ret = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_FIEMAP);
-	if (ret)
-		goto out;
-
-	/* HOLE */
-	if (!compr_cluster && !(map.m_flags & F2FS_MAP_FLAGS)) {
-		start_blk = next_pgofs;
-
-		if (blks_to_bytes(inode, start_blk) < blks_to_bytes(inode,
-						max_inode_blocks(inode)))
-			goto prep_next;
-
-		flags |= FIEMAP_EXTENT_LAST;
-	}
-
-	compr_appended = false;
-	/* In a case of compressed cluster, append this to the last extent */
-	if (compr_cluster && ((map.m_flags & F2FS_MAP_DELALLOC) ||
-			!(map.m_flags & F2FS_MAP_FLAGS))) {
-		compr_appended = true;
-		goto skip_fill;
-	}
-
-	if (size) {
-		flags |= FIEMAP_EXTENT_MERGED;
-		if (IS_ENCRYPTED(inode))
-			flags |= FIEMAP_EXTENT_DATA_ENCRYPTED;
-
-		ret = fiemap_fill_next_extent(fieinfo, logical,
-				phys, size, flags);
-		trace_f2fs_fiemap(inode, logical, phys, size, flags, ret);
-		if (ret)
-			goto out;
-		size = 0;
-	}
-
-	if (start_blk > last_blk)
-		goto out;
-
-skip_fill:
-	if (map.m_pblk == COMPRESS_ADDR) {
-		compr_cluster = true;
-		count_in_cluster = 1;
-	} else if (compr_appended) {
-		unsigned int appended_blks = cluster_size -
-						count_in_cluster + 1;
-		size += blks_to_bytes(inode, appended_blks);
-		start_blk += appended_blks;
-		compr_cluster = false;
-	} else {
-		logical = blks_to_bytes(inode, start_blk);
-		phys = __is_valid_data_blkaddr(map.m_pblk) ?
-			blks_to_bytes(inode, map.m_pblk) : 0;
-		size = blks_to_bytes(inode, map.m_len);
-		flags = 0;
-
-		if (compr_cluster) {
-			flags = FIEMAP_EXTENT_ENCODED;
-			count_in_cluster += map.m_len;
-			if (count_in_cluster == cluster_size) {
-				compr_cluster = false;
-				size += blks_to_bytes(inode, 1);
-			}
-		} else if (map.m_flags & F2FS_MAP_DELALLOC) {
-			flags = FIEMAP_EXTENT_UNWRITTEN;
-		}
-
-		start_blk += bytes_to_blks(inode, size);
-	}
+	ret = iomap_fiemap(inode, fieinfo, start, len, &f2fs_iomap_report_ops);
 
-prep_next:
-	cond_resched();
-	if (fatal_signal_pending(current))
-		ret = -EINTR;
-	else
-		goto next;
 out:
-	if (ret == 1)
-		ret = 0;
-
 	inode_unlock(inode);
 	return ret;
 }
@@ -4266,3 +4167,66 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 const struct iomap_ops f2fs_iomap_ops = {
 	.iomap_begin	= f2fs_iomap_begin,
 };
+
+static int f2fs_iomap_begin_report(struct inode *inode, loff_t offset,
+				   loff_t length, unsigned int flags,
+				   struct iomap *iomap, struct iomap *srcmap)
+{
+	struct f2fs_map_blocks map = {0};
+	pgoff_t next_pgofs = 0;
+	int err;
+
+	if (f2fs_has_inline_data(inode) || f2fs_has_inline_dentry(inode)) {
+		err = f2fs_inline_data_fiemap(inode, iomap, offset, length);
+		if (err != -EAGAIN)
+			return err;
+	}
+
+	map.m_lblk = bytes_to_blks(inode, offset);
+	map.m_len = bytes_to_blks(inode, offset + length - 1) - map.m_lblk + 1;
+	map.m_next_pgofs = &next_pgofs;
+	map.m_seg_type = NO_CHECK_TYPE;
+	err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_FIEMAP);
+	if (err)
+		return err;
+	/*
+	 * When inline encryption is enabled, sometimes I/O to an encrypted file
+	 * has to be broken up to guarantee DUN contiguity.  Handle this by
+	 * limiting the length of the mapping returned.
+	 */
+	map.m_len = fscrypt_limit_io_blocks(inode, map.m_lblk, map.m_len);
+
+	if (WARN_ON_ONCE(map.m_pblk == COMPRESS_ADDR))
+		return -EINVAL;
+
+	iomap->offset = blks_to_bytes(inode, map.m_lblk);
+	if (map.m_flags & F2FS_MAP_FLAGS)
+		iomap->length = blks_to_bytes(inode, map.m_len);
+	else
+		iomap->length = blks_to_bytes(inode, next_pgofs) -
+				iomap->offset;
+
+	if (map.m_pblk == NEW_ADDR) {
+		/* f2fs treat pre-alloc & delay-alloc blocks the same way */
+		iomap->type = IOMAP_UNWRITTEN;
+		iomap->addr = IOMAP_NULL_ADDR;
+	} else if (map.m_pblk == NULL_ADDR) {
+		iomap->type = IOMAP_HOLE;
+		iomap->addr = IOMAP_NULL_ADDR;
+	} else {
+		iomap->type = IOMAP_MAPPED;
+		iomap->flags |= IOMAP_F_MERGED;
+		iomap->bdev = map.m_bdev;
+		iomap->addr = blks_to_bytes(inode, map.m_pblk);
+	}
+
+	cond_resched();
+	if (fatal_signal_pending(current))
+		return -EINTR;
+	else
+		return 0;
+}
+
+const struct iomap_ops f2fs_iomap_report_ops = {
+	.iomap_begin	= f2fs_iomap_begin_report,
+};
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c7cb2177b252..64a2bf58bd67 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -25,6 +25,7 @@
 #include <linux/quotaops.h>
 #include <linux/part_stat.h>
 #include <crypto/hash.h>
+#include <linux/iomap.h>
 
 #include <linux/fscrypt.h>
 #include <linux/fsverity.h>
@@ -680,8 +681,9 @@ struct extent_tree_info {
 #define F2FS_MAP_NEW		(1U << 0)
 #define F2FS_MAP_MAPPED		(1U << 1)
 #define F2FS_MAP_DELALLOC	(1U << 2)
+#define F2FS_MAP_ENCODED	(1U << 3)
 #define F2FS_MAP_FLAGS		(F2FS_MAP_NEW | F2FS_MAP_MAPPED |\
-				F2FS_MAP_DELALLOC)
+				F2FS_MAP_DELALLOC | F2FS_MAP_ENCODED)
 
 struct f2fs_map_blocks {
 	struct block_device *m_bdev;	/* for multi-device dio */
@@ -4109,6 +4111,7 @@ extern const struct inode_operations f2fs_symlink_inode_operations;
 extern const struct inode_operations f2fs_encrypted_symlink_inode_operations;
 extern const struct inode_operations f2fs_special_inode_operations;
 extern struct kmem_cache *f2fs_inode_entry_slab;
+extern const struct iomap_ops f2fs_iomap_report_ops;
 
 /*
  * inline.c
@@ -4139,8 +4142,7 @@ bool f2fs_empty_inline_dir(struct inode *dir);
 int f2fs_read_inline_dir(struct file *file, struct dir_context *ctx,
 			struct fscrypt_str *fstr);
 int f2fs_inline_data_fiemap(struct inode *inode,
-			struct fiemap_extent_info *fieinfo,
-			__u64 start, __u64 len);
+		struct iomap *iomap, __u64 start, __u64 len);
 
 /*
  * shrinker.c
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 4638fee16a91..c1afc3414231 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -767,11 +767,9 @@ int f2fs_read_inline_dir(struct file *file, struct dir_context *ctx,
 }
 
 int f2fs_inline_data_fiemap(struct inode *inode,
-		struct fiemap_extent_info *fieinfo, __u64 start, __u64 len)
+		struct iomap *iomap, __u64 start, __u64 len)
 {
 	__u64 byteaddr, ilen;
-	__u32 flags = FIEMAP_EXTENT_DATA_INLINE | FIEMAP_EXTENT_NOT_ALIGNED |
-		FIEMAP_EXTENT_LAST;
 	struct node_info ni;
 	struct page *ipage;
 	int err = 0;
@@ -792,8 +790,14 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 	}
 
 	ilen = min_t(size_t, MAX_INLINE_DATA(inode), i_size_read(inode));
-	if (start >= ilen)
+	if (start >= ilen) {
+		/* stop iomap iterator */
+		iomap->offset = start;
+		iomap->length = len;
+		iomap->addr = IOMAP_NULL_ADDR;
+		iomap->type = IOMAP_HOLE;
 		goto out;
+	}
 	if (start + len < ilen)
 		ilen = start + len;
 	ilen -= start;
@@ -805,8 +809,12 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 	byteaddr = (__u64)ni.blk_addr << inode->i_sb->s_blocksize_bits;
 	byteaddr += (char *)inline_data_addr(inode, ipage) -
 					(char *)F2FS_INODE(ipage);
-	err = fiemap_fill_next_extent(fieinfo, start, byteaddr, ilen, flags);
-	trace_f2fs_fiemap(inode, start, byteaddr, ilen, flags, err);
+	iomap->addr = byteaddr;
+	iomap->type = IOMAP_INLINE;
+	iomap->flags = 0;
+	iomap->offset = start;
+	iomap->length = ilen;
+
 out:
 	f2fs_put_page(ipage, 1);
 	return err;
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
