Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F0F9A53BF
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 20 Oct 2024 13:31:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t2U9n-0004xP-2g;
	Sun, 20 Oct 2024 11:31:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <weilongping@oppo.com>) id 1t2U9b-0004xB-20
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 20 Oct 2024 11:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mKPLZ/HxfMNYXuXYbcGmVRURGHED591fu3h5GMClQ3Q=; b=e5nb0pYeDY4Gn6WfyRWYauK6Q7
 JWK58ebT9ZcMMul0g/kBBk/gqqb0Al62HTk2WqnnYD7QkcwfEE9PAeSAjiH+qCfmVlcnENtBS1/wN
 bEErA9dbDK3YWZERIOelwASvW0PQ2zsZk6XIz2uwS8pPGwtXuuUJEKBNwXwSyWyzsvvY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mKPLZ/HxfMNYXuXYbcGmVRURGHED591fu3h5GMClQ3Q=; b=B
 DKthe3F2agI1P5rFxnsjl1lO6nUy6v8UF2zZi6M0pEW+/W5coobG2XN+OFJdf+nIDwLNbu3aKNYER
 Xgw0cNEPiLFS66/dF0JjJyn1q2Dohqh8yB2Hg9uRHewcSMVKv1+w1qcLfatr3oLRTxprisYcvAcEV
 2oZsGXlyau1mrqZ4=;
Received: from mail-koreacentralazon11013046.outbound.protection.outlook.com
 ([40.107.44.46] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t2U9Z-00054J-D9 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 20 Oct 2024 11:31:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQBRGGLe+1ORFcEInwElq0SAbiP8SzKQa5MuCNFBZt/OJEJxitt8tzGXf5cHFGLJQqKz5h63s0VGA4sbu9zSgASSCuWvcztMy2691PSBDjXtUBJVDpZB11vTzRqbewbe3FazMHuFITpsz6Mfqzd6do+dqK7diww9an2krsZpdOu6LHmM0ZhwP9H17KRL0tCXBgjRSKG3ppI/xZBLrFIFpNczvliIx0ov/Pve9hkcOHlKxyjq3p5dUEjid3+266PSnZ0NNvTUscCjXgBBuEk1kDXX+T6Q+30zd4WDFoSqHLufdWSejHON+GBzng9CchZ0qEW9BxlqJFKpCSxI8rACiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKPLZ/HxfMNYXuXYbcGmVRURGHED591fu3h5GMClQ3Q=;
 b=K1ICNNhv/YsUFmVafLeiiavdQ+yhAmqPtUUTQjmRfMmzL5Q/bJsNfbTWGQFOq7UEylDHsxxOCkem2BN7NLKMn50n6cOF5PJ+lXnz/flHIUSU782nEaEdjTl4AEt5yLyePq5uArcz23SeiGTJC7TExVdGHDJwHUsOdgPVKbm/hXvaivuGPVHgs1KACEcQswbZMK/jlokq+pIYv+3irlMg0ubUjrO7EPuSsHxvxnhqmiVHAadLJMzGvay5uuIF1U/r8xkQharP+QnQEQR2WNgmldBAUIDZPNkR/CPdmkJE6GXlFZBV+ZMdzwvDn4Yq6Dzp9ijvavmbyQiiLUs3g+xtfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKPLZ/HxfMNYXuXYbcGmVRURGHED591fu3h5GMClQ3Q=;
 b=Y7piOvgjsd3Ta0JnqQgfPJKsWdVY7WuozMa82AEDg5PxeWzqxE9bY3Rp6+BDWTnbjsFVje7KA3K27/nl9EhVtdFYnWMZcN4mVmexBDerxJ9GxPsA/HsJnRe5aZQEHjsOCmgZHb1tGebZV0x//f4OZjnmu7p0v945O9UKQv9jk1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com (2603:1096:101:22a::14)
 by PUZPR02MB6049.apcprd02.prod.outlook.com (2603:1096:301:e6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Sun, 20 Oct
 2024 10:58:26 +0000
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b]) by SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b%3]) with mapi id 15.20.8069.018; Sun, 20 Oct 2024
 10:58:25 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun, 20 Oct 2024 18:57:52 +0800
Message-Id: <20241020105752.1767730-1-weilongping@oppo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG2PR01CA0131.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::35) To SEZPR02MB7967.apcprd02.prod.outlook.com
 (2603:1096:101:22a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB7967:EE_|PUZPR02MB6049:EE_
X-MS-Office365-Filtering-Correlation-Id: a4cd34fd-cc78-4a4d-f827-08dcf0f61f0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jH7FLGyWP32Qm4pHiCKdS+8x1cPoNiPrEY+UskJRpwtRkBupJ+/ddZSJ1B1h?=
 =?us-ascii?Q?1dJAmBNa+G6Ze4y00L9qF8A2h/GGLyhhN5uw7nC7viVNd92wlInS8Q9mbanT?=
 =?us-ascii?Q?mN9m7lrgHebEfV2tW+cOkpK9FOl7jVmjXmWbXH4fKCDW33NGbrV5GZSzg2tc?=
 =?us-ascii?Q?34KCjWiGb7P5jQ3fCxBEm6805IREbR6gctl7TNhcEkHeuWUi6JB201d/s4pJ?=
 =?us-ascii?Q?EG4Jw+UERY5OJ42hFRT2wuXRXm3fG9EOqXdOEKgAXRSXDOj+im0sqPCPE0Iy?=
 =?us-ascii?Q?7xw8kfB0PM6Xi9buQuw6dU1kQM3q452UMJ7HbMU5MmIbZvbhvlOhov6h/0Ue?=
 =?us-ascii?Q?vQdaAd4+lsdVHrCzf5b9mmr9fcfCpBaOEmJVOhPQoPl4slGiPZrndg+3bP9U?=
 =?us-ascii?Q?2aGn9GTUQ3LWHFIWm1jF6gXo4lUcPoveuog4urifyX2u38RgvX3Bn5E9HweZ?=
 =?us-ascii?Q?v7lKcbgDQz7JBSSk/806CXEa+EQv97gA3TfMyCgViveVB5HDWhVWpxevhdLo?=
 =?us-ascii?Q?0kBrilpvZ8WrAKPnBna4j0dFrwbVHVMr2rA3+1gurnKgW2cjxCLk8p3ahITL?=
 =?us-ascii?Q?W6x69XJbzsRJWLlHM3DaNWsx8BTlOVgaoelLqppYd+xMRxZniIe1ZVQsOEhk?=
 =?us-ascii?Q?HqRF5pUrWx0guq3X2srLDLVeERNAvmHN0gOegDOggf2+CFif+a248bzPcWIy?=
 =?us-ascii?Q?M31zwR19JODcddTTuASIzAlbkCnR1YOKJfkvv3aP9PYlXLxPf1oNcJX3HZwW?=
 =?us-ascii?Q?2VuwW8BXSJ/sLggehupcrSgUxakNCTzUO3R/TUvlJeTE3DGa31P/1glmhqYy?=
 =?us-ascii?Q?y763SNHP/xynGECw82eL81UNOLmgEELb4+Q10Z+D/FiFjllUJ5uJyJMGH7Ny?=
 =?us-ascii?Q?pUhYIkWRAebrGRqoIUVvUK9VQYbJqvoOG5Ir/b/CzcWc/KxrN/ZzuHgL2c4a?=
 =?us-ascii?Q?JJOltgJHitGlHsOwkG4IOrvsAqCEuFtk8Zah2a3iaFp5Kp0agqpSv5RIBteD?=
 =?us-ascii?Q?FgwJiBEmjdzN4humH/4ArUQCzHjEutgUwA9E/H5PciFcA5lMgqlTiUUC2mvS?=
 =?us-ascii?Q?wH8YuPOlmfOiQgOa/lNHb6MYm6ZoK7S6ZHEbi8C7bignnDjPVEilfwoy3WZX?=
 =?us-ascii?Q?r56syQj5joViGHN5+pyRxk9BZOrPATywK8npv1+3Oz3FMrEqpCdAC1qli+LH?=
 =?us-ascii?Q?qYnrE3yTXBr8F080Aw060a+qwyJ8vD46vzitztPEklxmoXfJ2qQpIoAp/zP+?=
 =?us-ascii?Q?F3rAgwPMsEaW4xevU5fvQLCz1maere2KJPvcCkTMALGFzhAAzb5fcmvdLj3x?=
 =?us-ascii?Q?aKKzmbURK8m+B4K8Fy020K3JQD7Uio6HAubSUOjeaRQGYo8HQGSBenF+UaZk?=
 =?us-ascii?Q?Dl9fDf0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR02MB7967.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DQfL0snnVnxUtw2WLkqm/bjgpKS0FK39Gs8ZDwTsPSHI/Jqq6LVTyHxqgTCh?=
 =?us-ascii?Q?wBsLf2oDtaAV7TxiRVSYREVh7EQmCHQEMlD0B9B6T5wwmuAXNgrjlRBqdET7?=
 =?us-ascii?Q?/imZqBdAzFl46izt7TCfM3deh7e7K3bkMHx0cklriHfARuNoQ342fk2dO1JH?=
 =?us-ascii?Q?q+ckcIQkWKM6I12r/oSIvU5bsABT6cSAN2SWWbfdHMBF6QuDUYCw/ggqksam?=
 =?us-ascii?Q?DqwXs3HMIDBgmsGvvw5fB29Jq3VnlJQrppYDdS/fKpfzaw4A1kcmQ9mtPehC?=
 =?us-ascii?Q?hrYbJ/1bTD4oGuZNrAp9KkWWhd1KNoWyt7JNAp37cdTbmJXQ3uKYHM7bHvzk?=
 =?us-ascii?Q?N6qpZofIkUZTWriWE0BMH+oen3K5jh2cqK7Nf7uwDvtiCasKvWDt71k0zswY?=
 =?us-ascii?Q?oUHYKA78rRbPCM95JBntopBnhrfzWY+XxPfOlSEo6Qjx2/b6Y8236X912Pyw?=
 =?us-ascii?Q?ZvX+Lm1I6ty6fjBrkHu76DQ9uepWRukgE2zV0IQaP6Dd2PYmFEZhmI/DQ1Ci?=
 =?us-ascii?Q?WsMfop0+uJcMeeQOr/zH0Kye5pIqF71+P8e4Op98P1pKzn19HRe7TtXq9CPV?=
 =?us-ascii?Q?6gQNNvaEaEfr+dBVdVyWIcFH4HfcBHFDgWO6NW/NesKmwNQEzbv5yzl3o2/z?=
 =?us-ascii?Q?/1moAXHY66jEg0TV7YY3GmgpjMwskg3qg6cAiaxv3bNt9FG0NtcxCeyQ43wC?=
 =?us-ascii?Q?quIlxoGjPbS9JkKia1kySLozI/aQ8SSetffglqMf1EDHFAFh17Vm9q8qKO2g?=
 =?us-ascii?Q?lVCZ9wkkli24i6q7cEdGhIqdCSi1ky6ORBG9qFRmCE+MMv8CvaNKKW8fkDUE?=
 =?us-ascii?Q?kyXPtx610SnzQCOoVrL09pgKHN30AbtlCFJMgp93AwIAWjsCPKnisnzARBFJ?=
 =?us-ascii?Q?k9xrJ1s0l2jNILwgzeXhRbqrI0yXQj59UwXUh+Sc6D3UDh0funvORVMTcOcG?=
 =?us-ascii?Q?Ln0JrNSJG23yA3vts3ZbuJ29vzN9+DqN9U7OAIYiO3Yuk6e/mVCgsoYIXJV1?=
 =?us-ascii?Q?XT7RCA2zRBFeFnnXAHLB8j/j2gPVoq33DFbMz1VwKzmH3rrieR9/XTyjQbvO?=
 =?us-ascii?Q?vayznpXaMhJgv61aEDwqYAAlmRzv4GH9V56pWp5FbTw/ML1qnyVQIYEvvOna?=
 =?us-ascii?Q?KVBb3ZH31Joe3ciuFP3ym/VCRHTbpfv5gfAcx9tbH6LiJ18TZsQJw9FzX46v?=
 =?us-ascii?Q?zZ8VKfnwzBuGdJuAxDzDHVEx0teYAoBPs80rxkiXh49opM6pLmsF9fU5Ty5z?=
 =?us-ascii?Q?cJDjT+yeZVx/T+qayyKPM61wq9ZdLFMbFlKqInAJVlYAK0iRUfj8CbF9KTum?=
 =?us-ascii?Q?5yVKXtj1eMlfGSorm7HocbzVNkyxW1gUynSwpswpdl/f5wQnsNJh2KOF9ChJ?=
 =?us-ascii?Q?r2djSXsE1Bz+lDb9PrLuEFQ8xXaZp4/SVDwNjvJvqF1jGvZEVpQrDfFE3Rvn?=
 =?us-ascii?Q?/lyGQ7SM2NxPZRt4DU55F6x7sL1vfn46sX5gMPHFmMpSsN4v1DO22ffF34RV?=
 =?us-ascii?Q?HI64CpetbGlPAZ9EwdFhV1+zwDWQ2IRXAYXKWISoEPtVIiPfTaF62Eg5Ox1o?=
 =?us-ascii?Q?MDjtEHCfySDvnxUb7d7PIyQC+CR8YNM+sVP9We91WlcrT2p2k7xI/Y3GfQ3z?=
 =?us-ascii?Q?KA=3D=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4cd34fd-cc78-4a4d-f827-08dcf0f61f0a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB7967.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 10:58:25.5727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mr0PmomxBnVAZn7aNe5bq1SHgxhZ76iUj2AORW+mo2G01Cg9RuDtxcW6etv9jsY09wo+1yOZZL67UUT1TSY0qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR02MB6049
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This f2fs_bug_on was introduced by commit
 2c1905042c8c3("f2fs:
 check segment type in __f2fs_replace_block") when there were only 6 curseg
 types. After commit d0b9e42ab6155(f2fs: introduce inmem curseg [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -1.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.46 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1t2U9Z-00054J-D9
Subject: [f2fs-dev] [PATCH] f2fs: fix the wrong f2fs_bug_on condition in
 f2fs_do_replace_block
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
From: LongPing Wei via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: LongPing Wei <weilongping@oppo.com>
Cc: LongPing Wei <weilongping@oppo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This f2fs_bug_on was introduced by commit 2c1905042c8c3("f2fs: check segment type in __f2fs_replace_block") when there were only 6 curseg types.
After commit d0b9e42ab6155(f2fs: introduce inmem curseg) was introduced, the condition should be changed to checking curseg->seg_type.

Fixes: d0b9e42ab6155("f2fs: introduce inmem curseg")

Signed-off-by: LongPing Wei <weilongping@oppo.com>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1766254279d2..7b54b1851d34 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3977,8 +3977,8 @@ void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		}
 	}
 
-	f2fs_bug_on(sbi, !IS_DATASEG(type));
 	curseg = CURSEG_I(sbi, type);
+	f2fs_bug_on(sbi, !IS_DATASEG(curseg->seg_type));
 
 	mutex_lock(&curseg->curseg_mutex);
 	down_write(&sit_i->sentry_lock);
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
