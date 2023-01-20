Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CF7675607
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Jan 2023 14:41:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIrdl-0003FA-M0;
	Fri, 20 Jan 2023 13:41:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pIrdi-0003Ep-7e
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jan 2023 13:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=smT8vJ0bT+nzUyUQ1bOT7yb2PHCpctRrRzjc0vu+iEQ=; b=c18Vg9RNvisfAFmozj/vWLCMNx
 MdrqZWXACPZOJ2DFvy22ysvuRGd5J4fecZQLheQC9SG8DXGLnMkaAKWFcCer2z/upa9G1EbRcKcQ4
 11uxcEwEj8ijaU32EkR5qp3PDyrhBEobEJ6fmCPlQGMV16tLDMwRi/19VBuZ9UThv/x8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=smT8vJ0bT+nzUyUQ1bOT7yb2PHCpctRrRzjc0vu+iEQ=; b=KfL9NSoYjPXLndRatsxgQ2zaVM
 ALpjaRbEntMBE7cO3BnJ/wCy8f+/gw0dsBimBLsXtDy4ybTijTju+WJB3Ksu3OYlTOfqQU/M5XnMl
 tSs6dosmsdY6kQxOS3xvIbl04jhPX6zfbxWjkiWA4euA+YPooL8gkiWta+Hxe+px41FA=;
Received: from mail-psaapc01on2129.outbound.protection.outlook.com
 ([40.107.255.129] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pIrdb-00AF7t-B7 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jan 2023 13:41:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JW+Y0WiZRgva8ciRyQwo44pSbllhhDtNS8MNMd/kayB+KlLsuBZy3Y0aVbLPw2Rzc6cZyZKDfrKfJxNaIoQeSSxiLMQ0We6K86Iq44ofH4DkWmkE8VWbJeMBJ48b7Ue6o0e+m0FWfhHLdwkais8ln04d5XkLshTSPCUTAvkvAUvGgjOMRR+sJUM4jDe9vNIvFbYJ3N4BCNYFKP3HJHt+n59gVWCZVMFOQjyGTSD5rwGHRykooUjjY9E87Dypoarno3YERyZgiA4KlQRvOXCIR1j6GpCLMcMDkl2mXz1AhA9IWtLT9UVR4lRNKaBUWS8ztNhr3fdlM7eoBpD9XYct3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smT8vJ0bT+nzUyUQ1bOT7yb2PHCpctRrRzjc0vu+iEQ=;
 b=iJpKx0OIZ93V0ejwWC0UFWRU96l+vec83GYWcIFOf5VSovEoItRNIHOnUhnE/Vz1dmzZbkneCU/ETRxzn4aZTQiPceg0kHvYcs1dxlP6EmVTzuLTYhkIfIxYDNKzbtZZgTGJQasGxROjChT1CDnMwE8SapdyNJdrYLTsRUO5DqUMMumBaozwhJjAvdcgV1gdxG4KnZAe+WJZIFwJQuiA94W6EJIFTzWgAeFJnBqtdyyhqFQq95QML6oKHHRnxamkTTRz68PZFD9fuqBSWL454K/6vk3DzIB0QTknOo71hhAck/Fj1TgH+ro5pDsddQWG8a6OXfHCKBn2Wvjs13R9EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smT8vJ0bT+nzUyUQ1bOT7yb2PHCpctRrRzjc0vu+iEQ=;
 b=ejhVpBpWvNtzRDNkdReCZR/A9BmakOpS1S51gEieaYNiJ+ms9pzNKJHDbPf4jD0x3H65QQZnJ3fwxsZuoAS7rCInDhoE6r0b0Z3gCv8/FFNKUb3qjUaAw+V7TS0a7bo+cxFCe+ESu7fKjg3X0X7AQgXtpdh8QmytZAgkrfcpMQaJ+RYUSgppPmuorm9VvZI7cqA619LZF5UNk5UOkpWrdIDHSSiU1N/9/pY3pn0JTm2ZLbZY06ZiY0YjWFQZhpN8ZdpuI3u2J8qNmgjcfs6pC5HgUWOMH8lK2xLxc9/aXBJKJ3tKAtDcguMrjgHtoCNTVzSZNz5a63Lm2vkzkDfoTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5127.apcprd06.prod.outlook.com (2603:1096:400:1b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.5; Fri, 20 Jan
 2023 13:40:52 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 13:40:52 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 20 Jan 2023 21:40:27 +0800
Message-Id: <20230120134029.69200-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230120134029.69200-1-frank.li@vivo.com>
References: <20230120134029.69200-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR06CA0234.apcprd06.prod.outlook.com
 (2603:1096:4:ac::18) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5127:EE_
X-MS-Office365-Filtering-Correlation-Id: 331be740-6006-4157-8302-08dafaebf280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 34U/fznAnjtyyvG1NMu1QjcawJqFnCJ96IHvP8PuvK0xMO2A2OoPUcMafsDthJOz4hfJYK0TSHhYj+yVgDTsyLnhz9ZbP/wrfRe+M26IpzciID9Kvk2nyFyIYg/QUcC/qbyT8m9rqPmg+idL4hcdq6pKK05LFXNT6IO5GdqWjoIDTGuW8wHtLhAnhwLMOqZ+m/Nb93jn9T8q56AGgfL4r8a+Wc2ETB9I5vbMl0u35rJgvKK7o6EXW/qAWmYfjWNhWOyE721ZRLb97dI3ChmRejic+lfQdze9FIJz62FAL6eQgr/K2bQPZPH2x5LlBoUFXIj7Jsd9RvFIWRnQyapHtZFMnZSUz9fhLdQdeFykUf10OU3yE+Z1o78df4o7Pas6XMvskGApb8eZm+T6eSIIe9uesXqhu3WqULwQrquOj4CTuHZOoGz/xDkxuh2EVsEfCVsH71nnYnPS1EGNKi+p43Gne6CeqZ/eKq1H5p1HJOe8tMJl8sQLQdtoY4uqJPh1w/P3lGr4cJ7XnH4r9ImN+li0m3sNzLh++mTuDgK/fHZz0pTDh8ViSFbJlstSjJbImETvKTBjPnv4FSgr2n1aAEaDMrWZfHK8dFb215OXoIpmOk0d9XkNZYmGE1Rc/hb6Dkl8OivV/cmDY5b66RZv7v/SKKvjWziFbWOdsZOttL0h9ly85GH9I9jXHJTVbkqM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199015)(316002)(38350700002)(6506007)(38100700002)(66556008)(66476007)(66946007)(6666004)(107886003)(2906002)(1076003)(2616005)(4326008)(26005)(52116002)(478600001)(8676002)(8936002)(186003)(6512007)(5660300002)(83380400001)(36756003)(41300700001)(86362001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RWGgjf44CD8q8i5vfgPV1OwvM65zlZbCu67NZlB8eK+JfP7MRPJp0o2j0gC0?=
 =?us-ascii?Q?CiHoe9s5Vo4wxWzE5tC/JC6cPNE15F0uKd3vNYW05WMIA6kMdeXZ/+OsoPSf?=
 =?us-ascii?Q?aFFFtLVeVKizPanLrWnJyhw1zMgwtV7PloriUP45uJhZobwzn7FTp9P1jebu?=
 =?us-ascii?Q?S1a4hw88JXKUWznWHQ0ogVf6AWPb3Rk7Jv+m21qqw/H1QBW5D6maSnw9mjG+?=
 =?us-ascii?Q?zZS/DSXhzom6BZHU/HkZonm0c+8nypUxMjT4oLnMxncnfN0rDvmxfCxpfc/g?=
 =?us-ascii?Q?Ye7WyH5XmLrXWRVzFOcGlfcfN5uSbjk89wb0GKrEpDN1mJAaux3Ef8MZ8H6/?=
 =?us-ascii?Q?4gw3Pv7sb7H8U9hJFB9CZ88hXoyblLX266wMNSxNa4u+B6J95AVgEJlgYQHo?=
 =?us-ascii?Q?0EAMa2xEi4VRd1mtc1CvgsoqLswOKVkWsNj4TiV4QVlt9X4u5dI+qUyuTio8?=
 =?us-ascii?Q?Dfxm0UJaa+Q8SBQLDYa7VJGae9iLOks11EVGSnPjJRCVab67FNDq1WNfzmqM?=
 =?us-ascii?Q?7jBm9c2ZeDui9wE9CkBD0pFpbIc+i4RuQmCeL77ghH3fL0Kgk0SMn2oIItx3?=
 =?us-ascii?Q?Gn+sye3rk5UAW0loYv75/fbg+zYUlHsEv7JndWlTY0939UKO3GrDYlbxdS1K?=
 =?us-ascii?Q?A0GXS19HP0Cts1aYYuaPOcEUA3p9058Uu2wRZYCpN9pRuJ1uHl1/SAoHaxks?=
 =?us-ascii?Q?9slpZSM68tfvJcXQLyVg1dQJksXABcMgT+ioeWhrJMYw0lXmObB01LTCa8J3?=
 =?us-ascii?Q?vXO9YMDgwKr0MNJoQa33kpTQ4t4vENovVuoY80atoOqKi/vGemk8c4TQYeXT?=
 =?us-ascii?Q?9fAe3C/x5kiz70mB4Sknb5AdYm0w8TLeM1FJhjmdWdom1G5wbLrTA85ZlL/7?=
 =?us-ascii?Q?vJ+fobZXUelHWjgql5k+rbo5cuNbumXNrcEujikcHWPr57QGwsRYmkXKNg8Y?=
 =?us-ascii?Q?PS+i/F0v8mexYD76KT6yBVbEI19cvEZ8928i/NW9TPfSWTCT+wirMaoY482a?=
 =?us-ascii?Q?+LEXeXiY8AIHydSWfIqiOUA2K1fSmayAXzkKS5SG4Ty62SfChstv4C/iMnFo?=
 =?us-ascii?Q?GvW1+18fEug8OGPFLWkXlN9/cwUPw5V1PDftI/eSmSmBd7PVbCjjupuT4uTK?=
 =?us-ascii?Q?g4iYUUdyqY4U8LgRZdsGVXhVFeCKF4L54MyyzAUM6bv/63nQKOODzOMYYdBh?=
 =?us-ascii?Q?NOf/7pFkFo/1BXcE9yw5NAC3GjUWpjuxyzHnMR7nnAinw8H2WW5lZI1hT8lE?=
 =?us-ascii?Q?BvQAT4fTe53eCftq3OFBxVmzh6Nt1t6xzxvlQlgpYP1lV2I1xaa45xMGEE3a?=
 =?us-ascii?Q?rmhzKRMO65Y6fksc6/98vdjMvNo4ZSWUL+9+obxGdsANcv3Y0y1oVOlvYuJo?=
 =?us-ascii?Q?Yt37M77GnPgp8iQfS9iQ+rxFExwoaOl5ceyf+j2PJbCOdwZVmXXS09ajcxap?=
 =?us-ascii?Q?7A/AKbx7OqsyzxU0AJ84VO+hyydkiINLYvMyTQ4n6piKu0RiUvM89HBXHArr?=
 =?us-ascii?Q?rrjHnTiROk68rtgeLWjdNCPEphw84OFnvF7Mb1BQ4+Ofw/Fl48JT2vNK1op+?=
 =?us-ascii?Q?wSxTcKSx9RI7G31yI0mTZ85glB8XfBd2cwFr1J1h?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331be740-6006-4157-8302-08dafaebf280
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 13:40:52.0206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HnugIPF/2l2ForYzuwyAbeFYkPA5WRhDBlCOnGVqKw/Fh4EuligokRvTZT7z093Jgv89fF/l/CEg7LhRWo0Tdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5127
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Disallow the value set beyond the range,
 and disallow to change
 the value in lfs mode. BTW, convert open code to use BIT(). Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- fs/f2fs/segment.h | 1 + fs/f2fs/sysfs.c
 | 11 ++++++++++- 2 files changed, 11 insertions(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.129 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.129 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pIrdb-00AF7t-B7
Subject: [f2fs-dev] [PATCH 2/4] f2fs: add sanity check for ipu_policy
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

Disallow the value set beyond the range, and disallow to change
the value in lfs mode.

BTW, convert open code to use BIT().

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/segment.h |  1 +
 fs/f2fs/sysfs.c   | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 0b0eb8f03cba..d73e988566a5 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -681,6 +681,7 @@ enum {
 	F2FS_IPU_ASYNC,
 	F2FS_IPU_NOCACHE,
 	F2FS_IPU_HONOR_OPU_WRITE,
+	F2FS_IPU_MAX,
 };
 
 #define F2FS_IPU_POLICY(name)					\
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index bdc761f36310..576e6416ffb9 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -452,7 +452,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	if (ret < 0)
 		return ret;
 #ifdef CONFIG_F2FS_FAULT_INJECTION
-	if (a->struct_type == FAULT_INFO_TYPE && t >= (1 << FAULT_MAX))
+	if (a->struct_type == FAULT_INFO_TYPE && t >= BIT(FAULT_MAX))
 		return -EINVAL;
 	if (a->struct_type == FAULT_INFO_RATE && t >= UINT_MAX)
 		return -EINVAL;
@@ -706,6 +706,15 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "ipu_policy")) {
+		if (F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS)
+			return -EINVAL;
+		if (t >= BIT(F2FS_IPU_MAX))
+			return -EINVAL;
+		SM_I(sbi)->ipu_policy = (unsigned int)t;
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
