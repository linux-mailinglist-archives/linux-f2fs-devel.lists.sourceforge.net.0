Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D408926DAF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2024 04:58:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPCfw-0006zh-PQ;
	Thu, 04 Jul 2024 02:58:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sPCfv-0006zT-AE
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 02:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wg8fhlFiwyjeBmS5+Axsac7ezSONaeyK6uaE6nwGIVk=; b=hHgCombzPLQZxFDbwGlWyidVEM
 reol3zpZFgAVQM1c2AvpOs4tYrEFbxPEytm8OnXdqAAQIXcXJ7Ehb4bEbYnz2yM7hvjYC3d96ao/K
 CnEgX4nZEUrq3FPSSs4N3BREJiwLeVegmYx3GrT1JY3pNPyijYnd5HaxezQy1sVI1sxs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wg8fhlFiwyjeBmS5+Axsac7ezSONaeyK6uaE6nwGIVk=; b=mJ+8EiGzxkaUpmaUC4fdaJeFv9
 yGeTIl5BVSuMxcqsLI+mDnqq8arqO96fhp8P9TqJIQ6vQ3AR472wqZuV5XS/EGmTyKkMcpG4jxtgP
 /L8NHkDCBHtbRySiqjyosAovBbN7rCb+RA0noN5EORLaIWU8eTUKCdjbkHnEHFTdChcM=;
Received: from mail-sgaapc01on2042.outbound.protection.outlook.com
 ([40.107.215.42] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPCfv-00010i-8d for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 02:58:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvoXt2zkVqaNGy6MDM+9VCLNmXW0gW3pvVEGbU3JgCHl/k31nHX54711EkRE2+wSfAFpgXLk+CF4n/x5cG28Hhonk+oYq8/1FYBLvWWkhpON+5SUzpZEorIGhSgqRlahECpg73qD2mQfTh6EUuUDc+7IZ7XZPojbJekLVBJeCLXVThD4O6mAh9tjW3CuON+ZV002+wmkpzIfWmfVR71pKFfIYa0Dy5fdUzDIKuCjMv5c1K2o/2Fe13zk2W6qoMzCiFi00b4VTckGN8BujHIjddSRyV4TcprVKSrSE4dn83fMQww7P1nRllB0iHm2RofizKjWy6ncMApO9G1odBqhOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wg8fhlFiwyjeBmS5+Axsac7ezSONaeyK6uaE6nwGIVk=;
 b=k6fArJ0QTHjwUFtkfJHBLruPcyZtTMce5fJVlso5zZmxCEqv3CgNzSuXvB36D4eIw86C2ivN9yKeFHIU6oUspfFLOL328MxxObHF6f1ng/ehj8HU0oxil5kNpxhlMN4eBPBlu6vvznvdDJeP8FeNVoCmakNoNCcdaR9Oy6iLoCM1u70RtyapAIX4mJ7pY7LLPJkXf2QbgZZvv2M/B24sz6ca1H9ZS7EulxxXcUf487+FhEu9PZf98tDI38ua8h4k47BSsraYOPl6bJyv0rmMUiDueFgUXYuswg/UR/4UZnxOBLhEVkF1unbuIe7mjhfmpGx4DGL1gI9mMvmDdag+bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wg8fhlFiwyjeBmS5+Axsac7ezSONaeyK6uaE6nwGIVk=;
 b=AlyEmMRcbba6R0PHjRj62tY2V7TK/8/QPbXnyTrJNQifk5sYxNbh0+DYcjk0VLwCEIOR4PatNdEfqmvJas/WJ6pq+ODJ3o/f2LuN6IpeYYXGT0JaiYSlKlD93ph44m8Q/YbxLHZZaxwDF2HKoYMsT5kFWmXmmtzICguUN/e8+X8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEYPR02MB7733.apcprd02.prod.outlook.com (2603:1096:101:20c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 02:58:10 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7719.029; Thu, 4 Jul 2024
 02:58:10 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Thu,  4 Jul 2024 10:57:33 +0800
Message-Id: <20240704025740.527171-4-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240704025740.527171-1-shengyong@oppo.com>
References: <20240704025740.527171-1-shengyong@oppo.com>
X-ClientProxiedBy: TYAPR01CA0220.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::16) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEYPR02MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: 88e4aaf8-4840-40bc-bfee-08dc9bd5232f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W1nc6er34mEcxTVDm2dU2/e3ZoXgMQc4scTQA88HizrLe1toH/nEAZ4FRRoP?=
 =?us-ascii?Q?eRpWKRZ2i1zvy4xcBAeYfG6z0WrmOp0v/jF03ktX9GG188JWaTbxiCat30Y/?=
 =?us-ascii?Q?sONEWhb+u27gqy0+bMrONiSo0kptgj8Pxi0YmndJRusie6iKziZ+568hogpC?=
 =?us-ascii?Q?ibeFZHw/ZMouuePBqMqGWSj8taX6t4EMEgOmX7+nFA3vfIaKcsabSucAFV2S?=
 =?us-ascii?Q?yDfFl+4SX/sJ9wMA6WjzEdBeyutkOOZl3Px6dd0x97oQ6PYjLIS28q5Tc5U8?=
 =?us-ascii?Q?TyJDkcTujpZ2rk7H9+JvM/O+UpTIM41+I2WDuuLHPz498coUBycRcHGcrRRs?=
 =?us-ascii?Q?9LL4+HPa+0wJJGsEudM85wasbgmHdejNunzPyvsFXmRhBXgdvT1y614j+wTd?=
 =?us-ascii?Q?rmY2UsP94O677BKah7qAzakYBRv03qxwgdqkfB4yrkdTPLyApPuAhyAEeO8C?=
 =?us-ascii?Q?J2F/o41+i9Tx4HgK4H3Lrk9+sslVOG5A9SY3myTOYcbx39rXfc9jyoYdWs5L?=
 =?us-ascii?Q?suLp2KXW5BAgfsJBkw7KxZE92TL7qe5xcuYNs9JIup7QNjUe2pIimU3cmngn?=
 =?us-ascii?Q?bChuNl0BLroxKZtJ10kuz7SBl88bqEC2s1QgIQJXTMKvIZigSzkCxoyIbM7E?=
 =?us-ascii?Q?V4HS8lc2WOozEfymtIFEbg+G2PK+ZdkshV0AcooZdui0hhuGG/E5FCtWcAmV?=
 =?us-ascii?Q?KP91VM7d8EW/o6uLXeD6a2f14ORjdaXPEZdWbskHnajULeyT4+9YnYyVakwx?=
 =?us-ascii?Q?jmbJBbwp+oz3XJBqhYkP+is/OUkGuVTTnAyCyZDH54mxbutzZsotnzkinUEd?=
 =?us-ascii?Q?Qf6lyJ6C0z/MHSsQJAB8BnwQrltUCVaxtG/6wxsY89h1O61renaGXGZ2xW2f?=
 =?us-ascii?Q?a/oiAKc4zrXG//wazod4WZGv8FbWhLCj2ZRqS08dQkUjHRHQP/QeQhTRMTBl?=
 =?us-ascii?Q?Xl9cfEweEp129kbvcQf44iURQORpGolbotHIIjdOiqELBJ6ZZs4/tJ1gwGBD?=
 =?us-ascii?Q?LDd0ZvCbp5oqSTNpr25uWszo/J6erw2nWBH9QqAoGsqqXYeOA6zU8j5d9/2m?=
 =?us-ascii?Q?8QlR/6HoYHQsPcxKLNgv/X3pR8VG46gUXiBS6bb5F6O8EXTUkdQUthNkZS9K?=
 =?us-ascii?Q?i6qwVs7R41x5AnXEbHVDr46jhP2bQt3fUGEsM49ZTgHCsWYEnq+XJT1BHafG?=
 =?us-ascii?Q?/5b4CPx8d931zWFUeJqTHex3eCKsAHxFotV8hofOxuRNeNlLX51D0m/Y9BtV?=
 =?us-ascii?Q?CLpmQ9IOC1uWwLZ/cFbweMck7f8dr+cn+1G9T90QjHbEAjr9D1OuQVE6utlT?=
 =?us-ascii?Q?fFGUf7R2hgyqlmxPBdn+OTSS8Wm5JDntRGXzevZ1ySrj0QXpN3HN4TLcWEF2?=
 =?us-ascii?Q?ClDQdyx3SIKVcjf3yI40wtOxIMnWzFfszCEoXfasvefXI8JK1A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dxeVPfZp/tmYZ5VcXlOW7+ZUcDOqQh8Opq2YB8oJ+LlzauPH+HUdZliYwjNc?=
 =?us-ascii?Q?IVNiUnDy0xPeobTKwQIDAlWKuKIXwuU896yUsl2lnsbv2EDKwwi7MTQrzoDl?=
 =?us-ascii?Q?948ivD/xn7QIPZIoAeG6rYGoC/0FcuY+AhuoLRFhn0fTAwhnDmc21Bp+QfHE?=
 =?us-ascii?Q?GME4TDH0QyXMi99yLxjm02sTYboi9Hr/N/JuRUCPJOXnt3XRJZhfRV7FATcb?=
 =?us-ascii?Q?bhFiU6sFHaxiaCZiSJ5L5WMA1bv2gK8J7xXBq7oVP1yUm23NrDZwSNrGYQvj?=
 =?us-ascii?Q?8n4qV7T1sK1wwEKwBXcoxmZCHmnwVbm4cYKSUrzZB/xvOaMjGGJUVWb/gUl6?=
 =?us-ascii?Q?oykv5yBE/eqFuFPWBvL/ycYDDIHuw/dkH2oAyo5jH4xEnod9Zxf/1hvkFgGb?=
 =?us-ascii?Q?ZWbM+srY+dmWe222iTR2nKvllEpHcCMSp1uLv/t0E6zeC79Qu9z3Z2uXi8bA?=
 =?us-ascii?Q?V/cWOCEDlXHJm5pOgTCV8kuTSmqPw2wtrVIvl147Sqr3NG8ZGQmXVxa/xA4H?=
 =?us-ascii?Q?/ulAyOeoEJSuO1uf1Nvp2gfUACH8ZCeec6l1onbqgRGcjCKA0X8iV8MEy4IC?=
 =?us-ascii?Q?x/9TuOMD+oAEgmVvrDcXjZILGSFp2U7Uabu0BgWKpJ8QDCz6YpuqSjeL74hC?=
 =?us-ascii?Q?o1/Mde4lm8DJcUcgIK6fk4j+/6ueSJjr8yvM4jOLxUxc6LH8udN2is3iva0w?=
 =?us-ascii?Q?ZUcQVfJDl+0WhVf5EQfjxbhbMK2X1dvq/f1dGiotAPXM8d6YPjxc0I+EEzog?=
 =?us-ascii?Q?NkEN8UgKnhQugcfZQ0drp+bsFQpolEu42jWSvk9RurqhX8N6m+1pvGGdQWWE?=
 =?us-ascii?Q?aTNBFyTZAaw2Ha4gui6M4d/OX08QEcVKzOw0iCRSxBOEqGJbppPtoYgwnGxn?=
 =?us-ascii?Q?hSYQPeVGXs8irMUTzC45IwfoTePnuVizHga9uxqsxpPhCcEoHqnsywdq9SqO?=
 =?us-ascii?Q?pWlHTW8n3KxM4qHvfq39vq0Gb797HAInucFN8x7A01xecDECl2Dd+a4pBt+e?=
 =?us-ascii?Q?WjIE7K5wjPfwcBdXkZYmgPbnCXmRjOpT1DU3jY4DTzb3LO/EiGHtwOfeCn7j?=
 =?us-ascii?Q?CS8/Xwgmzqj12IFs6ebkfeebv2P3Znw67JZp/JamuGjUk0SR9Pk/Grr29K1Z?=
 =?us-ascii?Q?7I4Uwx+pJ+xd3lOX5v5WRqJbsygWcKdBkImtFr1KCi6x2O3GewN6gWl5dSl5?=
 =?us-ascii?Q?m0ntek0+0nGYE70lfjKoMZDtOrunwBs5x5AQz1Ss5wEtTNRqQ3npOU/ukj0I?=
 =?us-ascii?Q?PGhJbNIOsW+QslKchZ6m+TuTF/fYVD2C49KfqxHsB8CPwbDqwqcXqbWQdcU5?=
 =?us-ascii?Q?+sq9RF0clm1JlvOf4px8vX/ahVKzdu+gOkUdJebKzT5/3i9jdtbgKAf2z3O5?=
 =?us-ascii?Q?Lf9Ayek7W+FXToRuB4UNofL8THgTIVlULPWNOhCGc+Y2gPgElpWblV5ufpw8?=
 =?us-ascii?Q?CbBidzV53nYAvCj2MYIypDCBC7P8PvMDKtIdqTZ1qoL3N5xOFFFyMR1j8Fs+?=
 =?us-ascii?Q?bWZYvrwGsJkdyW7hGvNYPgLUxlts5IwfMqmF40h+gpdGONABbkxQ+x81eemK?=
 =?us-ascii?Q?2o7yQ3A7hYt3DiCmH/ELLQd+O/A3e6VCUXDQ/0gy?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e4aaf8-4840-40bc-bfee-08dc9bd5232f
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 02:58:10.3475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DtmsF2S9tonVRp1Do6a+aGFpJ1YfaVUdUeamBSTnBFx3Ue4hHSDBjNN4RMemX1ItHDRF3qHQWoxyJHpo71xtjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB7733
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch enables injecting super block. The meanings of
 options are: * sb: means sb is injected, its argument chooses which sb pack
 to be injected, where 0 means the current valid sb is choosen automatically.
 * mb: indicates which member in [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.42 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.42 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.42 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.215.42 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sPCfv-00010i-8d
Subject: [f2fs-dev] [RCF PATCH v3 03/10] inject.f2fs: add sb injection
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

This patch enables injecting super block.

The meanings of options are:
 * sb: means sb is injected, its argument chooses which sb pack to be
       injected, where 0 means the current valid sb is choosen
       automatically.
 * mb: indicates which member in sb is injected, its argument is the
       member name.
 * idx: is used when the mb is an array, its argument is the index of
        the array.
 * val: is the new value to be set when the type of mb is a number.
 * str: is the new value to be set when the type of mb is a string.

The members could be injected in sb contains:
 * magic: magic number
 * s_stop_reason: s_stop_reason array
 * s_errors: s_errors array
 * devs.path: path in devs array

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/inject.c | 140 +++++++++++++++++++++++++++++++++++++++++++++++++-
 fsck/inject.h |   5 ++
 fsck/main.c   |   5 +-
 fsck/mount.c  |   4 +-
 4 files changed, 150 insertions(+), 4 deletions(-)

diff --git a/fsck/inject.c b/fsck/inject.c
index f6fd346..f29e746 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -18,17 +18,43 @@ void inject_usage(void)
 	MSG(0, "[options]:\n");
 	MSG(0, "  -d debug level [default:0]\n");
 	MSG(0, "  -V print the version number and exit\n");
+	MSG(0, "  --mb <member name> which member is injected in a struct\n");
+	MSG(0, "  --val <new value> new value to set\n");
+	MSG(0, "  --str <new string> new string to set\n");
+	MSG(0, "  --idx <slot index> which slot is injected in an array\n");
+	MSG(0, "  --sb <0|1|2> --mb <name> [--idx <index>] --val/str <value/string> inject superblock\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
 }
 
+static void inject_sb_usage(void)
+{
+	MSG(0, "inject.f2fs --sb <0|1|2> --mb <name> [--idx <index>] --val/str <value/string>\n");
+	MSG(0, "[sb]:\n");
+	MSG(0, "  0: auto select the first super block\n");
+	MSG(0, "  1: select the first super block\n");
+	MSG(0, "  2: select the second super block\n");
+	MSG(0, "[mb]:\n");
+	MSG(0, "  magic: inject magic number\n");
+	MSG(0, "  s_stop_reason: inject s_stop_reason array selected by --idx <index>\n");
+	MSG(0, "  s_errors: inject s_errors array selected by --idx <index>\n");
+	MSG(0, "  devs.path: inject path in devs array selected by --idx <index> specified by --str <string>\n");
+}
+
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 {
 	int o = 0;
-	const char *option_string = "d:V";
+	const char *pack[] = {"auto", "1", "2"};
+	const char *option_string = "d:Vh";
+	char *endptr;
 	struct option long_opt[] = {
 		{"dry-run", no_argument, 0, 1},
+		{"mb", required_argument, 0, 2},
+		{"idx", required_argument, 0, 3},
+		{"val", required_argument, 0, 4},
+		{"str", required_argument, 0, 5},
+		{"sb", required_argument, 0, 6},
 		{0, 0, 0, 0}
 	};
 
@@ -39,6 +65,38 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			c.dry_run = 1;
 			MSG(0, "Info: Dry run\n");
 			break;
+		case 2:
+			opt->mb = optarg;
+			MSG(0, "Info: inject member %s\n", optarg);
+			break;
+		case 3:
+			if (!is_digits(optarg))
+				return EWRONG_OPT;
+			opt->idx = atoi(optarg);
+			MSG(0, "Info: inject slot index %d\n", opt->idx);
+			break;
+		case 4:
+			opt->val = strtoll(optarg, &endptr, 0);
+			if (opt->val == LLONG_MAX || opt->val == LLONG_MIN ||
+			    *endptr != '\0')
+				return -ERANGE;
+			MSG(0, "Info: inject value %lld : 0x%llx\n", opt->val,
+			    (unsigned long long)opt->val);
+			break;
+		case 5:
+			opt->str = strdup(optarg);
+			if (!opt->str)
+				return -ENOMEM;
+			MSG(0, "Info: inject string %s\n", opt->str);
+			break;
+		case 6:
+			if (!is_digits(optarg))
+				return EWRONG_OPT;
+			opt->sb = atoi(optarg);
+			if (opt->sb < 0 || opt->sb > 2)
+				return -ERANGE;
+			MSG(0, "Info: inject sb %s\n", pack[opt->sb]);
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -48,7 +106,12 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		case 'V':
 			show_version("inject.f2fs");
 			exit(0);
+		case 'h':
 		default:
+			if (opt->sb >= 0) {
+				inject_sb_usage();
+				exit(0);
+			}
 			return EUNKNOWN_OPT;
 		}
 	}
@@ -56,9 +119,84 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 	return 0;
 }
 
+static int inject_sb(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
+	struct f2fs_super_block *sb;
+	char *buf;
+	int ret;
+
+	buf = calloc(1, F2FS_BLKSIZE);
+	ASSERT(buf != NULL);
+
+	if (opt->sb == 0)
+		opt->sb = 1;
+
+	ret = dev_read_block(buf, opt->sb == 1 ? SB0_ADDR : SB1_ADDR);
+	ASSERT(ret >= 0);
+
+	sb = (struct f2fs_super_block *)(buf + F2FS_SUPER_OFFSET);
+
+	if (!strcmp(opt->mb, "magic")) {
+		MSG(0, "Info: inject magic of sb %d: 0x%x -> 0x%x\n",
+		    opt->sb, get_sb(magic), (u32)opt->val);
+		set_sb(magic, (u32)opt->val);
+	} else if (!strcmp(opt->mb, "s_stop_reason")) {
+		if (opt->idx >= MAX_STOP_REASON) {
+			ERR_MSG("invalid index %u of sb->s_stop_reason[]\n",
+				opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject s_stop_reason[%d] of sb %d: %d -> %d\n",
+		    opt->idx, opt->sb, sb->s_stop_reason[opt->idx],
+		    (u8)opt->val);
+		sb->s_stop_reason[opt->idx] = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "s_errors")) {
+		if (opt->idx >= MAX_F2FS_ERRORS) {
+			ERR_MSG("invalid index %u of sb->s_errors[]\n",
+				opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject s_errors[%d] of sb %d: %x -> %x\n",
+		    opt->idx, opt->sb, sb->s_errors[opt->idx], (u8)opt->val);
+		sb->s_errors[opt->idx] = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "devs.path")) {
+		if (opt->idx >= MAX_DEVICES) {
+			ERR_MSG("invalid index %u of sb->devs[]\n", opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		if (strlen(opt->str) >= MAX_PATH_LEN) {
+			ERR_MSG("invalid length of option str\n");
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject devs[%d].path of sb %d: %s -> %s\n",
+		    opt->idx, opt->sb, (char *)sb->devs[opt->idx].path, opt->str);
+		strcpy((char *)sb->devs[opt->idx].path, opt->str);
+	} else {
+		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	print_raw_sb_info(sb);
+	update_superblock(sb, SB_MASK((u32)opt->sb - 1));
+
+out:
+	free(buf);
+	free(opt->str);
+	return ret;
+}
+
 int do_inject(struct f2fs_sb_info *sbi)
 {
+	struct inject_option *opt = (struct inject_option *)c.private;
 	int ret = -EINVAL;
 
+	if (opt->sb >= 0)
+		ret = inject_sb(sbi, opt);
+
 	return ret;
 }
diff --git a/fsck/inject.h b/fsck/inject.h
index 62543c1..c7d0e33 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -20,6 +20,11 @@
 #include "fsck.h"
 
 struct inject_option {
+	const char *mb;		/* member name */
+	unsigned int idx;	/* slot index */
+	long long val;		/* new value */
+	char *str;		/* new string */
+	int sb;			/* which sb */
 };
 
 void inject_usage(void);
diff --git a/fsck/main.c b/fsck/main.c
index eca09aa..40edf35 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -822,7 +822,10 @@ void f2fs_parse_options(int argc, char *argv[])
 #endif /* WITH_LABEL */
 	} else if (!strcmp("inject.f2fs", prog)) {
 #ifdef WITH_INJECT
-		static struct inject_option inject_opt;
+		static struct inject_option inject_opt = {
+			.sb = -1,
+			.idx = -1,
+		};
 
 		err = inject_parse_options(argc, argv, &inject_opt);
 		if (err < 0) {
diff --git a/fsck/mount.c b/fsck/mount.c
index 8524335..77e3919 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1212,7 +1212,7 @@ int init_sb_info(struct f2fs_sb_info *sbi)
 			c.devices[i].path = strdup((char *)sb->devs[i].path);
 			if (get_device_info(i))
 				ASSERT(0);
-		} else {
+		} else if (c.func != INJECT) {
 			ASSERT(!strcmp((char *)sb->devs[i].path,
 						(char *)c.devices[i].path));
 		}
@@ -4018,7 +4018,7 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
 	}
 	cp = F2FS_CKPT(sbi);
 
-	if (c.func != FSCK && c.func != DUMP &&
+	if (c.func != FSCK && c.func != DUMP && c.func != INJECT &&
 		!is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG)) {
 		ERR_MSG("Mount unclean image to replay log first\n");
 		return -1;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
