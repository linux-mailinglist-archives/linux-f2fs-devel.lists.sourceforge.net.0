Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ACA9B4949
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:12:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5l4x-00043H-Bo;
	Tue, 29 Oct 2024 12:12:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5l4w-000432-7r
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:12:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xrs6IJHiG5as3W0LqMnh5DA9cS3174M6LIJV6YECcns=; b=BbenupamskQn2ddX2ulXOCNhco
 JZrkp1uX6AEF22ooJ1H23sdJ27vwDwFJMP772LQNrw55/xefBJUwMTxi1U0I6mUk8otHsnzwKk6Yn
 zhS83F5ljToaYcH11kFAcBPMUiMwEarly7Cb63j4WJ4jyeZaMY3J6xMsXWm33zDKAbM8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xrs6IJHiG5as3W0LqMnh5DA9cS3174M6LIJV6YECcns=; b=dqQo9Dg/rnZUEc/mqNh//B7CVr
 beJLnUjMqATCvGtQFYnww8Vb+3zEgDvjTayN7IgnPyRH4y2TTYpO4Qspz0mr4xlJUm33oV1sP3Bui
 w8iJ+CmK3ThtVwjo1vJNxFWqVTjo+DZXnFLpmctxG66q7Fz6sw9kzof9z9IxS1WdHAeY=;
Received: from mail-koreacentralazon11013051.outbound.protection.outlook.com
 ([40.107.44.51] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5l4u-0007Sn-US for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:12:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+488/6ncfgqBh2MFFjgC5Do/2emz7Jf3TimJphB7Ll/9lNzGdQDRD3rhfKa2BSTExhjItSzykQY6dxqrRk9D6J/DdFOD3eZMPGtl00IyhlMBrf2o/39aBqgNMY98BWkU/l2ab3uiCmzI6uVdRUKfY5usfOCBqg21HTdQBwGaEiVEL2ElawbIvvZhwQ+YCQACZ2YrynkSzhT7e6+kaYC6cr070uFGifVtU5uZvGHQsVk8TVlVkRlA7iZWQapO0CP7+WOABeDXXN1f9MVKu1FdJzJQlXigNMrCqaOKpLhh6iMpKo4CXGUruItuOjeuAFHj2eQbNfgw8NWr/j+ZZQruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrs6IJHiG5as3W0LqMnh5DA9cS3174M6LIJV6YECcns=;
 b=sQHuFD1y9n5/9L8WxEriug263t7zbbfpylDwLxIRxgEVA5SeYaEaXEWLzgc/UqyiET6kCilBOihGLWdL1LkvkcafrcJlWZpFd/wMngFcrPe6EY7Q1K66YU5z587gGHVqQC6Tn8eLOdlMLAa2gtC3y8WTeTWu25pyW5j9vrLfMNPRPH72fRWJUWRug8xGptFaQdQsbib0tKfnpv44VD/1yod+LfxZf+bB0A3iLetJMb5rXF95NQIS8gid1IUMKrrN/jQyDDfrHtz5Q9s/weZPdBYIBlMlTmJkRko87Mh3v62d5Gwf2ECX8yILzm7xdXzuWDabfyz3Tcgfnu3f2SfOeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrs6IJHiG5as3W0LqMnh5DA9cS3174M6LIJV6YECcns=;
 b=oOFVBfpBUT6uvitFEHOEqIP1vmZzGg+ncMCItdLgptjbIfiN3ElH/uIQwiHh2rLplAXlRvGWRR46JJLu5BvvZ83GhggxdedzQeEg7WhJZKobIgYIk3b9hF4hj3wlMkciz6vjVhkqIpa4B/5oZ3d2EkF9qDDFdSEFsSYNPlnv7y8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TY0PR02MB6982.apcprd02.prod.outlook.com (2603:1096:405:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 12:11:43 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:43 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:45 +0800
Message-Id: <20241029120956.4186731-14-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TY0PR02MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a3487d0-dd57-4015-fc99-08dcf812d9ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RUbbTfLpNsi5sThzojIw3w+ze9I3zj1GT6LDea9lw7MdQ7Q0N5N0bPcMa3Ch?=
 =?us-ascii?Q?Ud6pvEpymVu18BG4gocBrzJvt+jGv/wOaUN5Ay+QcWVgqFd632pMTaMNUonl?=
 =?us-ascii?Q?6v5vglhl2GJ3DUEv27Jup/pAGzAMdbsT7pujUTThmVkTvB/I12LQDcYAmJJx?=
 =?us-ascii?Q?Yqol5N6etWt/ciMBYL2lz4xHjnnyk06ClKR+EHPUUJh/dA+Te5Ergx7QAHNc?=
 =?us-ascii?Q?N5+39cgrfjktjIWbjAezte1nv3Yw7722/JqEbyJ60ICHB3XOgl4U4nVamp4c?=
 =?us-ascii?Q?Hk6SjrdrPL3lm6/LKFzbeUWPMbGlDG/fsr5ANYy3fU+G7wLvwGjbm3BJVONB?=
 =?us-ascii?Q?OKrdMEpkCvXucjCzXycN9Y61yQNWNgt3fYVEEhVbkDKfA0zOB5aXAqmklAQj?=
 =?us-ascii?Q?lyDe80+5kHsMIsOxFM4U2VA+7ThC1FapP+iCSeKoS+rQGh05azWC3rCBd+M8?=
 =?us-ascii?Q?9nzJf+zFPYxic9NYxQGRu5h0YQhfWFjzlGumFeZqZYBSyjiTjJhfIGMoXKr9?=
 =?us-ascii?Q?LVvRUZdilW6cj1um0p7bOAH09bEDZUST5tUvl1XaaofY0R74VqUbIZBs79lb?=
 =?us-ascii?Q?IryLV1It39/jvbyuhca1FQZ8mSwYwGVUvJDknBQpWDnKNyPYpR15PHKifLzf?=
 =?us-ascii?Q?sPae8tfM+eA8EcErOCZJDhzQc7XfNoWwYElVzAs7SxaPcaFqrMWSxPNIZYBP?=
 =?us-ascii?Q?U2oxAUbpZKZBUt5I8tyyDLYzySOjNiKd8bB+pE5flwk4k0/LdOlIQJa5jNKl?=
 =?us-ascii?Q?RVcNFMgfomktB5xKUXfZEGYlsWklfvH5rUv4De9CwqH5QZ1cE2A6Um2SGKPB?=
 =?us-ascii?Q?rscdoat0uKOWUAgtmbVrN4qf/4TrKaUtNLGZHpOswVy1urTHpaTyWbRRqNFL?=
 =?us-ascii?Q?90QyJIfCbAIZYYC2pud8ybndBJEFljoFowHdrhEHn2n7K+mFSMLcdIbvtosv?=
 =?us-ascii?Q?DFVto/fCqWPWkdWSLvGlIPzDqFu9N+e7ivJLS65gBT7oaKnoj/fDK51bpMM0?=
 =?us-ascii?Q?q9QGF+YS7PlpU6NRwQkxm4XPo1fKygU+p7wWwDqPiXcemjaq5pDzWybqBnDJ?=
 =?us-ascii?Q?0GKOsmRmfNllHRK0rm2tQstdTxogFowhsemfCYDOH6opvXcAhyTl8n9WsK67?=
 =?us-ascii?Q?fIHP9GkVcmhP3A00PxtL6QkeNTlHx2uJ5Z9HBoTMfxJI734tOuRVXt249j7s?=
 =?us-ascii?Q?w471l2wYQv0cdsMIRRu3aNOYfaoHPMGpwBRgrnpI5wnLHzk9TBZgdnHS0jjo?=
 =?us-ascii?Q?W6PlBiZXW8FTgL1YNnl22ySc9crVTzlnCk81DKLAMlnsfF4ytvIHc3q0YspJ?=
 =?us-ascii?Q?rydTrqSM6AKWJ/SMG++NqwZbyt46AI6oYZ9/ZyZ8X582h6s+uGDveg8SVzID?=
 =?us-ascii?Q?1LE5sdk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qhs8gZyZhXQemy0UgXW4WMo+lxobKSpch98v4qUtenrVqslQPL3dHXyHDCJx?=
 =?us-ascii?Q?YnarP/E6CZ5P+xUdKKc5Za1ZqTu6GEpktlU4cd787AwNduuLfOZHfymg29MY?=
 =?us-ascii?Q?b6VxPYo8fiipiqhh+OK8HnTzoRjlSoVQJPWxW5rmmrXT73laSK53kKg2cw4v?=
 =?us-ascii?Q?9Vk9gWdmitJK+XbXJtic+yxp6Jc6AFJDagJtOYGMjXIfZmdtMnXEjeASu6uJ?=
 =?us-ascii?Q?axiL4mu0OHrD1skPCjl4FybM9UVyIdop22fy9/fvOnwvo3WNh6r4YkxKN90U?=
 =?us-ascii?Q?2Kmmv+Q6aZ8GLV85gt1Xw/36B6s0ImlPJzLwfdiJfI6EqHi6v5b2zaSv85JZ?=
 =?us-ascii?Q?CEOKDdP4djCqAN07LEGVnB1plAG0JAr228thV54xjyiMIjVLKVl7zNXuYxHI?=
 =?us-ascii?Q?E2qICxCKuippnc3SS03irYLtvyYtmlcz29Gm72vgWu8G88nx7nNP9WjClY8C?=
 =?us-ascii?Q?68Cy00ciM8gZzBZ+B4u6B+WMuFaGnwYUlk2PSTIYm3J6hbgW+9l80H/gXCQB?=
 =?us-ascii?Q?dfC+e6z/tHGg6UcZ02kSLUygglXvJ8TMPIeGMiwnVkt1cvjX8MdlTisfybrA?=
 =?us-ascii?Q?7uvTIDKzQUBFJeMahm0RzrwETnVcs/WoNh60Knw3hPHjXFNEHWAx4xlkdpyj?=
 =?us-ascii?Q?jk/D6+lInbA8zG4GNzLfYrnttLRvtE73OJDCrGbPJgxdacLVhPjvCIk7sDq6?=
 =?us-ascii?Q?ziCaXW++KoK41lZXJ8g5wKi9wTqvIjAI+LyfWfuC1eRP36aaiY2/L496IF7u?=
 =?us-ascii?Q?VLDEwak9pvtyEII6q9j+fqT//f0IbHfq6Dp+HLuvOq2SRoc2mfAEYejBo0x0?=
 =?us-ascii?Q?ffvTyUio6XyhS4aJmiMfPdgtMmPMAnUvEI0VJPJt0yFzR7cAlRd2twxyFOyM?=
 =?us-ascii?Q?bYngqheOg1orpfpKGPE3TWEOFekQuBmGuVAMZfo9qVIB0mFKzubxMruPu35P?=
 =?us-ascii?Q?SBXvuhZw/Qy/w5iS1+Ko0KxYatssZu+SZbLK3q8DyF+icbCFFXE6LKK3y5G6?=
 =?us-ascii?Q?eGGsOuf1niQ1U93JC2ryeFSbiiH0t743R0D+8ru2yQyH6VJBnb0OWJRwrf00?=
 =?us-ascii?Q?k9TL7q6rEewQHjGlxmfNBU687vl1dq5nNyh0pLSdPOsM9vdllJBGqORj/tKx?=
 =?us-ascii?Q?LTmR9xTU3Jxp/uVcXcPqHI6Z/H4DwWQFSEzutkNo0l9fppI0JMPQ0qTv63DB?=
 =?us-ascii?Q?WYisv8sX8tPP3NdMzEb9YSWKWxmVVD28VuyDJuL8E1BxIWJ2hVTzfhkAvuf4?=
 =?us-ascii?Q?VMcn7LD52+0fUZldVU9j4JjCO+D1OAiRriJW9q/fUOw4Z878BcZPXEAC2d3V?=
 =?us-ascii?Q?XEXpB4U0AoBw2yxQowQBywt018RG4LDKU/iaIF7pD56/GlFFpGQF6ESlVKjZ?=
 =?us-ascii?Q?9DANl8r7L+bAvDXTDPuL0GTsEYkymbMKUVq9Sp99YssX4UlPOvfJBzY9OkhM?=
 =?us-ascii?Q?SCilEzwsNSNsIWyLDqblnjsbqYX/wW4bH54OkQhComzVnu6G7gJGeSML929z?=
 =?us-ascii?Q?J9h+Ay7cNaA1Ex+b0XpVrtLPX9OBkLXNqlvXuScvtlZLGrQIsi/3DqUvYuIr?=
 =?us-ascii?Q?B9upJNij8wLJWtk5SlhjIAURHbcsYEj+SqRKvhy/?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3487d0-dd57-4015-fc99-08dcf812d9ff
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:43.2135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2D4BCXKeVg5sF/29qAHGmYL44BBJyRMD/VPmoz6tLP8a5L2siCEoUGS2B1FhDoVg6T3V4W5ljS1KUMAOvFjFEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB6982
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 tests/f_nat_bad_blkaddr/README
 | 4 ++++ tests/f_nat_bad_blkaddr/expect.in | 39
 +++++++++++++++++++++++++++++++
 tests/f_nat_bad_blkaddr/script | 35 ++ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.51 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5l4u-0007Sn-US
Subject: [f2fs-dev] [RFC PATCH 13/24] tests: add fsck testcase of fixing nat
 entry with invalid blkaddr
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

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 tests/f_nat_bad_blkaddr/README    |  4 ++++
 tests/f_nat_bad_blkaddr/expect.in | 39 +++++++++++++++++++++++++++++++
 tests/f_nat_bad_blkaddr/script    | 35 +++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 tests/f_nat_bad_blkaddr/README
 create mode 100644 tests/f_nat_bad_blkaddr/expect.in
 create mode 100644 tests/f_nat_bad_blkaddr/script

diff --git a/tests/f_nat_bad_blkaddr/README b/tests/f_nat_bad_blkaddr/README
new file mode 100644
index 000000000000..1545fb0fb342
--- /dev/null
+++ b/tests/f_nat_bad_blkaddr/README
@@ -0,0 +1,4 @@
+1. create f2fs image
+2. mount f2fs and create a regular file
+3. inject block_addr in nat entry with value 0x12345 of the regular file
+4. fsck fixes the nat entry by nullifying it
diff --git a/tests/f_nat_bad_blkaddr/expect.in b/tests/f_nat_bad_blkaddr/expect.in
new file mode 100644
index 000000000000..32a3aa4bc77d
--- /dev/null
+++ b/tests/f_nat_bad_blkaddr/expect.in
@@ -0,0 +1,39 @@
+Info: Force to fix corruption
+Info: checkpoint state = x :  nat_bits crc compacted_summary unmount
+[ASSERT] (sanity_check_nat: x)  --> blkaddress is not valid. [_BLK_]
+[FIX] (__chk_dentries:x)  --> Unlink [_INO_] - testfile len[0x8], type[0x1]
+
+NID[_INO_] is unreachable, blkaddr:_BLK_
+[FSCK] Unreachable nat entries                        [Fail] [x]
+[FSCK] SIT valid block bitmap checking                [Fail]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Fail] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Fail] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Fail] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Fail]
+Info: Duplicate valid checkpoint to mirror position x -> x
+Info: Write valid nat_bits in checkpoint
+Info: write_checkpoint() cur_cp:x
+[FIX] (nullify_nat_entry:x)  --> Remove nid [_INO_] in NAT
+Info: Write valid nat_bits in checkpoint
+Info: fix_checkpoint() cur_cp:x
+
+Info: Force to fix corruption
+Info: checkpoint state = x :  allow_nocrc nat_bits unmount
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Ok..]
+
diff --git a/tests/f_nat_bad_blkaddr/script b/tests/f_nat_bad_blkaddr/script
new file mode 100644
index 000000000000..7adb48bf9f0a
--- /dev/null
+++ b/tests/f_nat_bad_blkaddr/script
@@ -0,0 +1,35 @@
+#!/bin/bash
+
+DESC="nat entry with invalid block_addr"
+
+. $TOPDIR/tests/helpers
+
+cleanup pre > $LOG 2>&1
+make_f2fs >> $LOG 2>&1
+
+mkdir $TESTDIR/mntdir
+safe_mount $MNT_OPTS $META $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot mount f2fs image"
+	exit
+fi
+touch $TESTDIR/mntdir/testfile
+ino=`stat -c "%i" $TESTDIR/mntdir/testfile`
+safe_umount $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot umount f2fs image"
+	exit
+fi
+rm -rf $TESTDIR/mntdir
+
+$INJECT --nat 0 --nid $ino --mb block_addr --val 0x12345 $META >> $LOG 2>&1
+$FSCK $FSCK_OPTS -f $META > $OUT 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+cat $OUT >> $LOG
+
+INO=`printf "0x%x" $ino`
+sed "s/_INO_/$INO/g" $TESTDIR/expect.in > $TESTDIR/expect
+sed -i "s/_BLK_/0x12345/g" $TESTDIR/expect
+
+check_result
+cleanup post >> $LOG 2>&1
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
