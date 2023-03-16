Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3826BCB5B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Mar 2023 10:49:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pckEa-0001y6-5y;
	Thu, 16 Mar 2023 09:49:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pckEO-0001xx-5d
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Mar 2023 09:49:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=38gNMJ9SsfkgOaV79jEwIUUP0mz+Rvvz5t9IAGYrGMY=; b=Fdy/4PettE6TzvTdLNcEZkAygy
 Od5aWX/Ke6p2G067ebdRiU8EaGtXWADP/YQtRUdcpmllLG0UkL1VtKQRF1UrBF5ctVE3V6Psacft6
 srzKB7s6/hdFknsAZdRQPpsVfWMRxHKzWkpZdlD0p6ibv7MgBGBRwFinrhsVOc1QhTK4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=38gNMJ9SsfkgOaV79jEwIUUP0mz+Rvvz5t9IAGYrGMY=; b=R
 G0dKdiU+Lz+4Chq2dbFkE1jQcuC4xytr04c6tuMLHe+wxjGpQhc6FIbZUmt+rmZi1K8Ne1/pHE+Wk
 j0n2jIQTczsmqR7TbO+UOTvRc/anjD0TDGQ4X0WvEelTj0t7oORnT9EGHH++drUetbgGdqZmycJ4K
 iKF0M+2ETHI2utvU=;
Received: from mail-tyzapc01on2108.outbound.protection.outlook.com
 ([40.107.117.108] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pckEO-00AaSM-MV for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Mar 2023 09:49:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvcOaFIbDLWog6rWo0hAsz9FI//nzS2tog4rEzNzJ92N6O+eWcrHCQOVo0iX2sEgwm1HmZpnJWB/Z8i/MSMMQTkGtpmUCcEp6ZBrHSFCFKIjeKIodtqrTfAg9EAhF19tgV2fMfmBVfcovpItJ301U2BOydTQf/mhymIGeUHtLfx9TpUgUxBJseB8KJlf+g5VJHQb1Z2Y9QoVPdnRHT/a4VGhCkMbr49g7JOaGevmfJW+LWty2XAcVFV83mKphwiPIxGMhpT+Q7m/YOD9ZOqlwcVb1ckBoG9BbC8jXFrY/C/V8cMHXtbXAh8Ko75ConYmgmbUIOctpb46gezEAJ9qLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38gNMJ9SsfkgOaV79jEwIUUP0mz+Rvvz5t9IAGYrGMY=;
 b=QGzgImyr+9+hRrsUHm/MHpHpCl+kfyS0ji0aS54E1wP4AwwhMfZknxzOEGezW4+86QwlrXgL2oZsC6JItiROSus241Q5N20Hx+kcMdNctu8VvBlHGjjYV0HA0Ou//Py7MNVz7kjkpC8vsn2AdxyZmmBxTjdcBOssMyokwgiSPKWoUZRXuXcQJZwc2VX8t5NpetA8dtNMuMbIb1HCvUbLKo97tuLD/XGyBJoYQ0o7pLmYXK0ARzZ7qisSE3oSdDpNkt0UWSSbt/PnOBcYRngOEPw1rCsHsokDfHSzqPDi967wSGgBIGV8QHA4BhLTFMYt84zfpbV1NVNNZSDAQp9ESw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38gNMJ9SsfkgOaV79jEwIUUP0mz+Rvvz5t9IAGYrGMY=;
 b=VkLucwXJdsnjT+p2deocov3XqWpvtyKmEX+dG0RAm+q9VABPuSOfe5tEp+0vibEDJtGjz5PIwp4AGQR8myNDLDccGOlrnpEh/Rd8dJNAaDTD9S3L/H8h1TPLOO3G8KMiWK75O7v2SyA3GfO+TsWdyFY8oAQDibA03eVmeMX+sue8s1pcsyg3+U9dOV5qEfAHDh6TCbe6S/LgGwuW1XoYDGtvtH/T7v8kzQrX3/SXCK/fE+PgXqY74mI1hoLDdhEcuBS1MbKnVMQf73+abihaSuG5Bt4k8LYDnpGLLTJULLG4+ruGqVMfqbQpmZaMazwvq8LfOThhcGSIc8nOge9J4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by SI2PR06MB5196.apcprd06.prod.outlook.com (2603:1096:4:1e0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 09:48:59 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190%2]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 09:48:59 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 16 Mar 2023 17:48:47 +0800
Message-Id: <20230316094847.32486-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR01CA0126.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::30) To TYZPR06MB5275.apcprd06.prod.outlook.com
 (2603:1096:400:1f5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|SI2PR06MB5196:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f89ec0-114d-4f8c-d25c-08db2603aa98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xis5Q4r92xVXeUcPy8YD3mTWZIp007szmL/eyPpBXVDJqphZGx5kTKvIxIf4bSLN1EL6chUW2U2kXsDUINeebhklkWjvfHQF/07EoJVcxC3AhmzUnBbP2syKMl4ULmfgD+Wn3aX8UndpcEuo4BQBqQGSG0Y6GiQdoOSlD0VoSLX4FohpL7l5bzPdbdY3KNpNAw4FjKUvhid2g8eDZtcgviruZ/jJslpK1meJDMNyVXRpu6AXjNk3tzcqZEAbtrJ+Gs0Bscy63vHW7nC2jkKIoRvvXG0bcWofMHxWj2cLMFyKcVtWZfZ2n4urJi0opr3Z4NQka6v0Kh5SvCj4ecu2v+D/ZIlnUv0mu2pVvUc66iBqCPtZNyLmNyyrJa9ihu/7O4g1Bx+P8tWuum+FeZFsZj68zKQewO/2frVTG8qXPONkLzJGKTtOSnyb+kkwggeCURCI0e4xqI0oAsHf4J1zyZs3vGFBg594OM0fzLn5y2+/y0ck9SUdsUz6ydftySsf/oJw/0tQSD+JbLBvkCedU+cfaSlXoEFvdupbU1scSu7VQaj9KeX10Tit7HBKzmn96pIU1mqDfva9BElI5zLmeEB6qVuqVEBWmAZUTx/kJPDEFXIrwWxBxupf1R20vWXjL7NQcGk6BuDKK3fECPteFYC1P8qpIkXtTnb6ay7VMmR916YOKWTh5fc2HpERktImQ/97k5qIXggcTuJpsLOlZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5275.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199018)(86362001)(36756003)(38350700002)(2906002)(41300700001)(38100700002)(8936002)(5660300002)(2616005)(6506007)(1076003)(26005)(6512007)(186003)(4326008)(316002)(83380400001)(6666004)(66476007)(66556008)(8676002)(6486002)(66946007)(107886003)(52116002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oRvkElUvCiTIFxFjrWoWjwwDkBk3YuxzzvyeQUz+MU+BpjcIMMkZdF5MvVfp?=
 =?us-ascii?Q?AZxWad0DaSgYg1aeBv438HPYAYnnWE9YCTIceGDCJ30XC9YLD8AiA1Hga3wz?=
 =?us-ascii?Q?apUVWWEUNUqOI2th2cVYGb/1E7GpPtQqlwhRpBELvsM5+UzMdFGi1i7x3zPx?=
 =?us-ascii?Q?73d1ohQrLt/15EsA07DXZPCihPOKIrcHxWF3EsWpJhsZ7pIBGyRHEymR8x7P?=
 =?us-ascii?Q?ejWo3rtgYwjpxOd9iw/rOg0EbDLMDMR4YEO8Ifgxtllw0RwJ35I6A7KKfk32?=
 =?us-ascii?Q?tumGdlw1PS6SkKQckVGrEtd9a+dfJ82/m+u9KIgjDvpon4llk++T/LmnmbYt?=
 =?us-ascii?Q?ixFVCQNqe5fBYj0XnXlQnvAs7RDDPuoqA+QlusG+uZq/T9JPJc/l4CPqToZH?=
 =?us-ascii?Q?Tm+heO3q3UuZLK2F7H//QzkWEfH6i5vC1X5cVLGFCT5AJjlbmXTTDEQ0yhA2?=
 =?us-ascii?Q?eQEhPcb/e1vJjOSDvltoqUIL3rJNeFmxhIHGinE5cTxyMypnlw66PGC3Hv6z?=
 =?us-ascii?Q?/Zbqw8DziRi/aNVvnQOfTakwgIUgqv2OLPZer/ZEUjnE4KF2AqX70ZcDCf6A?=
 =?us-ascii?Q?wH9Qm0c4uickoTw4nZLhMtbR36HCY/pOJVxk5vap0NgNM53tNdFetCSWDL5R?=
 =?us-ascii?Q?oABq9KdYlAN4RmoYfghV9zFPP4kSMeTHygpdCjtfpbs7zX7e8KgHWvzyDLRH?=
 =?us-ascii?Q?7alCBHtEDAu0HMWOqq+dIQOY/9dpRHfyAkXo4vI812BgxSoD+JP47sZsM/4p?=
 =?us-ascii?Q?rrv6GJDRvgwqML3lvHsTNVq8TCdGvacAtFUqxvt6UPKBxu/GI2dBI8lUdQkZ?=
 =?us-ascii?Q?+2/Gi5pF2tqjiEGd1sKjNEAi3urEzpQoW2YQLc/gCeZI9WVt3O0nb9gBoS/d?=
 =?us-ascii?Q?tLMXsIgNnyJG3BBe8ZkTKvJgWApR1gjc7WfHD+51ws0UBLM84McxbGi8BGnz?=
 =?us-ascii?Q?8WS7NJ4h86emd3hX3Y7Z160lKkgVyVDwsBqhJjtKHcEiVQIqkthNquOax3iq?=
 =?us-ascii?Q?SKhe8QcdKVcLEwCHtcGMoIbm0YxUNzU9W0qL4NbUyYP5J/pkQKAVmuFHmAar?=
 =?us-ascii?Q?AdIDex7MVtwnxu96ss3rGi2zOSAXzhaueD93NY6CLWK4Fc904aG5CDeB2eY7?=
 =?us-ascii?Q?7KSLBC6LdS0VgTsh3XXf79xD07bmU7LNc0D2d2jPwAYywSuTFfhLhKgTsbIF?=
 =?us-ascii?Q?vtRlGoiz2ZAKYSR9ardYM38aB0AlpDzjIdks47JyLD8yRpiKlxB6MkZei2xy?=
 =?us-ascii?Q?yUHwh/B3JZ3b62JyvoFtzesNpyZdcroZ7vkV/1ShtAWa/xORMpHRCdsdc1b5?=
 =?us-ascii?Q?kwcz8XN3TrSyfl4PtiNK4QTjVZqs5NyTWYGKXNxxiCYukivOyLhfgmu4GEB7?=
 =?us-ascii?Q?VCHEEjQz+16uR3suiTcwdrkoGIxcijwep8uqhgSCEjcbePTCAuUmyDaCQeia?=
 =?us-ascii?Q?19n4TRCXNh5TZH+fD1Trn66nxQe/KFwEUw+z5iE6snHXYkvZjwvClSnu9TgV?=
 =?us-ascii?Q?iBTlFWF0cwjp0gozCtJW6k/9cS/t7Sz9QM08L14bYoOZLQenNvxAaFNnZQtC?=
 =?us-ascii?Q?rk43Qo6H7urcWedAOS9+HOKmWgPl6gJd6o7g0BXc?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f89ec0-114d-4f8c-d25c-08db2603aa98
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 09:48:59.2893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ZpnFlj5lfeSjsE9jg5t8bpvmWC9awYrdNvs8b4hYZLiqgCdfl7582Y4T4YiKTp3gZGt0OviXla1ZQo4DUGmJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5196
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  BUG_ON() will be triggered when writing files concurrently, 
 because the same page is writtenback multiple times. 1597 void
 folio_end_writeback(struct
 folio *folio) 1598 { ...... 1618 if (!__folio_end_writeback(folio)) 1619
 BUG(); ...... 1625 } 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.108 listed in list.dnswl.org]
 1.3 RCVD_IN_VALIDITY_RPBL  RBL: Relay in Validity RPBL,
 https://senderscore.org/blocklistlookup/
 [40.107.117.108 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.108 listed in wl.mailspike.net]
X-Headers-End: 1pckEO-00AaSM-MV
Subject: [f2fs-dev] [PATCH] f2fs: compress: fix to call
 f2fs_wait_on_page_writeback() in f2fs_write_raw_pages()
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
Cc: Yangtao Li <frank.li@vivo.com>, hanqi@vivo.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

BUG_ON() will be triggered when writing files concurrently,
because the same page is writtenback multiple times.

1597 void folio_end_writeback(struct folio *folio)
1598 {
		......
1618     if (!__folio_end_writeback(folio))
1619         BUG();
		......
1625 }

kernel BUG at mm/filemap.c:1619!
Call Trace:
 <TASK>
 f2fs_write_end_io+0x1a0/0x370
 blk_update_request+0x6c/0x410
 blk_mq_end_request+0x15/0x130
 blk_complete_reqs+0x3c/0x50
 __do_softirq+0xb8/0x29b
 ? sort_range+0x20/0x20
 run_ksoftirqd+0x19/0x20
 smpboot_thread_fn+0x10b/0x1d0
 kthread+0xde/0x110
 ? kthread_complete_and_exit+0x20/0x20
 ret_from_fork+0x22/0x30
 </TASK>

Below is the concurrency scenario:

[Process A]		[Process B]		[Process C]
f2fs_write_raw_pages()
  - redirty_page_for_writepage()
  - unlock page()
			f2fs_do_write_data_page()
			  - lock_page()
			  - clear_page_dirty_for_io()
			  - set_page_writeback() [1st writeback]
			    .....
			    - unlock page()

						generic_perform_write()
						  - f2fs_write_begin()
						    - wait_for_stable_page()

						  - f2fs_write_end()
						    - set_page_dirty()

  - lock_page()
    - f2fs_do_write_data_page()
      - set_page_writeback() [2st writeback]

This problem was introduced by the previous commit 7377e853967b ("f2fs:
compress: fix potential deadlock of compress file"). All pagelocks were
released in f2fs_write_raw_pages(), but whether the page was
in the writeback state was ignored in the subsequent writing process.
Let's fix it by waiting for the page to writeback before writing.

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Fixes: 7377e853967b ("f2fs: compress: fix potential deadlock of compress file")
Signed-off-by: Qi Han <hanqi@vivo.com>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/compress.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 93fec1d37899..904af359fa8e 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1456,6 +1456,14 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 		if (!PageDirty(cc->rpages[i]))
 			goto continue_unlock;
 
+		if (PageWriteback(cc->rpages[i])) {
+			if (wbc->sync_mode != WB_SYNC_NONE)
+				f2fs_wait_on_page_writeback(cc->rpages[i],
+						DATA, true, true);
+			else
+				goto continue_unlock;
+		}
+
 		if (!clear_page_dirty_for_io(cc->rpages[i]))
 			goto continue_unlock;
 
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
