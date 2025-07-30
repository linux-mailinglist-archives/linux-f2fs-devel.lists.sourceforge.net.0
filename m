Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EECB1579C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Jul 2025 04:43:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cfJsTTpmg1ub3CmaVAu+yAcVtgcgjijvyuGGDjWht6s=; b=Lb/JvvzPT02OYnSJRiEOq7SnOa
	6loDxBIlD7dy9ugBfa+MjCbLI6eNkpHe3cq+jvcwATza8rQuQdhX/9hdn4MgrZt1++nL5DtO1AQxV
	MoARNUQcQoMcxA8S0DhmPfEjgjl8KU13Wocr0Li67t8mW1ZomccphRduMHTKDhOpeUqY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugwmM-0003vD-Uw;
	Wed, 30 Jul 2025 02:42:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1ugwmJ-0003v3-St
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Jul 2025 02:42:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V+S/2PTJ2+uV+abFDRTmhoNEqxHX6iC03j3erW8RGO8=; b=QUOTz6DSeXDxR2tvd9BrilPdXy
 LiYZGZ+ceKNT14BSHO3K3WutLtssk7Hrt5ed/hd0hzPd/VfiWM6TZQNKqVxGu6J7HAB1wRY00LXu4
 QwHIpDDbLQL7E0SL3WTzl1xe2mRGgr9qyzGYYRVfKIqxo58XORS3BWPwfaiuc/SzTmEs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=V+S/2PTJ2+uV+abFDRTmhoNEqxHX6iC03j3erW8RGO8=; b=H
 28b9U6u7zrYsxo2K9azLjiCZtyLxwIdztvdchmN7YWqBNUWTGl7KH4zC2IBHF+wSihVC3ykd1ZODE
 fEu0jV+pyIGvVChXGts+wK3t8Yfxx9InZ6OPa3614OQI5MHX1qZ3A1dStF0FhoXbE/C7p22kTgFd1
 ge3k9Z2YCmskfCNo=;
Received: from mail-japanwestazon11012007.outbound.protection.outlook.com
 ([40.107.75.7] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ugwmI-0006B7-PI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Jul 2025 02:42:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3R9+uVbUr+ydc9DgnoPC9bbU4GEgNV7E52gZc2Z3NKzZGvLeNM6XMahCZHSfIj8ejgCoa7CK3SNRA9r4hbbogyVBwJN2/xaTJqBXy1pcQh65TmC7NlsNwbQWgaFaMAczLy4y3C7oUupDX8051p+Gbunb+BTP7RxZXVxMoVX/t6PHB8mXRUBMFgmAgAaB8ka38XWTNUiLW/e9Uj3PKjrwU0F/P8KeUY9/gMJoEx6OCu5RL0lEJQWEqvP03yDJHftRlFo4k1HMD0xsbnLub3N8IXKIsu5e5HnxkvIKZ2ub+eHUFCppGb2dfDbeCZgF95nwdlpQ6oosAnLad0NdXRoQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+S/2PTJ2+uV+abFDRTmhoNEqxHX6iC03j3erW8RGO8=;
 b=HyTpsoTNB0ipdIUxIha/wuPyYmNK7ZQXiSdP1Na6QplejKPQIQDDxCuTzmCBA/Olp876oz7YaeYLPyJ3MHEKyC2e9Bw8hZTj4lFFA5lFQavL1mh+asfaaEBFd9UyQGTIQlVM4Pm5Mcz6Y7sbT5LumHN69+pG5PXlj9aZRPgbgGeF7QL2azkmdbCp/8cTU5x9p0SmwvtV4sOvnYnVN64xt+u/dYaYXTmSWjJ7z+5SCjQmqZAtfVX/8eQHABQyayunUU607fO9Q4I7N10YLvQbRnDxPgn0MXvWLRHX+U8+l3LEO7vsvntGIz58RPE4YKukUxz0ZcpzDO1ViX9+uMav1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+S/2PTJ2+uV+abFDRTmhoNEqxHX6iC03j3erW8RGO8=;
 b=a1aFdSecxCEmsbTQV+7lDO3ckaFwmymQe3p6eRFr0cV3PeQ0Mgf3ZWQ0Qi5uHIo9CqISsh3mnODVmMsN4IQr/arHqFREy3/7Tjl41ulKGO8888dX0TM+rZMDwpuL5HH9nP3At94BHJYh63ZlfrX/rp1d1S4tBoKG1ZlOADIZYZMRqeBtGtbTOVVxbooBuYRAYXczI2O38H5YVZ+N2ku7AoVTUbLKHLk/gm9Wau3+V3KIdJ3vMzBQAca//czkG6l+nUPdXyvymdpCGwbnIgduFrQRzHDf5Dz0sDM1/qNEUE0/T5KN4dhWC5wdH6Lz+YAI8Iyf0xngdtRan7O/XnsFGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PS1PPF5540628D6.apcprd06.prod.outlook.com (2603:1096:308::24e)
 by OSQPR06MB7132.apcprd06.prod.outlook.com (2603:1096:604:296::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Wed, 30 Jul
 2025 02:42:40 +0000
Received: from PS1PPF5540628D6.apcprd06.prod.outlook.com
 ([fe80::5f12:df6:9716:ecb2]) by PS1PPF5540628D6.apcprd06.prod.outlook.com
 ([fe80::5f12:df6:9716:ecb2%7]) with mapi id 15.20.8964.023; Wed, 30 Jul 2025
 02:42:40 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Wed, 30 Jul 2025 10:42:27 +0800
Message-Id: <20250730024227.584549-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SI2P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::18) To PS1PPF5540628D6.apcprd06.prod.outlook.com
 (2603:1096:308::24e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF5540628D6:EE_|OSQPR06MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: a211dbc3-f6c2-41dc-0f3e-08ddcf12c0b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ysfKb4SXhn6oznzdiPfurSm/sEVDqkLgfWRk9TRmWSp50FGuWPOKQFIEW6gR?=
 =?us-ascii?Q?3RJ1z6T7wjzP4xl5mkleBlsHUdHelMEDjmPzgENWoccUJvDxlntf/AFk9eT5?=
 =?us-ascii?Q?PiX50CgK4Mep7SgcZTWpNrkfh2wQzSq5DPweDahfjJhbZpcqbdmGho058Qtf?=
 =?us-ascii?Q?KSnRbAoyhpRvTPA2ITm0X4665/r7rbiGhSGG9pKz/gJbMZQddYdpIZCOMWXX?=
 =?us-ascii?Q?AqnYUaD0yQiIpWX1GLIJvPgrnOQ78sf90Q/sHQb84lDVH2o3ND65Yp8foVaD?=
 =?us-ascii?Q?WM001kNOWbkw5FHYsEa+pgv3gUrMeZhd9dF1i3JIG9P3TIX9FJovKRMGvr0T?=
 =?us-ascii?Q?6GDHVsbwFxJ01/hZ+2VqIPdrFc8i+Z7wH8PRqoZVLWCfZsXu3nC8YOYeL7Xw?=
 =?us-ascii?Q?O5GZRg6sbkriVJO/ZINRx5F1X/jUZnGsfYff1S5No5cIPDmvJi46iFryqLUq?=
 =?us-ascii?Q?fj4HfozAhBWd/SND82Vc8Nisnw8yd1FWCusExAVfOlkPoB7XfVKCpOpamHjn?=
 =?us-ascii?Q?nUG7k/2ikg5Wyyk870WP+viAWM8XMULYozuODCzxjPLDNbM2GDh61mLvullY?=
 =?us-ascii?Q?DXRoAPEJpvj+zteOSfMPGF0A5AzSmtX1Zt+TybiO8ROWXCy4CBSsoQGa5Ihk?=
 =?us-ascii?Q?/ybIdOJDQP+pIHSyHpk2dAJ1TEdhksW4dt3cTZihxaBAdqMrSt+Wj+S+KjIW?=
 =?us-ascii?Q?46LKO2QgUZLaBtnoZYxp7mhvwlkaPau+klBWBp1Dxuxg08XGeOm+cgF5CexI?=
 =?us-ascii?Q?nUjJjS5cYLMc3S7yol8Fl4UnCEAyLzyrBRpET0Iv3s/bHil4Ebwi9fYqjVZR?=
 =?us-ascii?Q?+qQccQL7XyC2e236xVNCGP3UYFpMtDuJGvEYrCAh5/VfeqfZlT5eaZBKoaxk?=
 =?us-ascii?Q?508sxncbwg9Ma+3fK57MU1HNs5z66RkPzAjr8jARyRcUgcm1Oy6xGBjz51q6?=
 =?us-ascii?Q?XQh7KIXuSbTDXNKipxgZMKNTGuYLwZS9oRKuPO+S5rqqrWeyBm+BLDT06TYA?=
 =?us-ascii?Q?ec30SQr6L2tun8vV95geXpIE9m6x/iaSfDMMIBWghN7neSa/ipBV2p5pJzvn?=
 =?us-ascii?Q?oEDrb2dDnvsy5xOEORFVpb2Qr45FTRrGg5gPMTaptX8YXnVrP9/U+QRjfZ5b?=
 =?us-ascii?Q?JgTZexint9hDN4SP2xxv/zxnajlPXiThUmpsnKjpWKhhJb0hqJ/mJjHDN9e8?=
 =?us-ascii?Q?hINYNJSUxckm51UkZrh08HLlaeVQ9WS+S1Zsb30h+lBAsi8xTLsMA4NJRu7W?=
 =?us-ascii?Q?Mgt3y1Y0mUtRa3LsPxbFm4Jys01N2kdRZ3yXGoyfXJ+RXIyMruIen+gbnHnS?=
 =?us-ascii?Q?6PrBldXGlvODsgyLdaRR0SzkQ75vSjSz42qZyKZT8OnR0rtVXuAlh/gRsjEh?=
 =?us-ascii?Q?EUxTrrS+qHKVTlHzHHd4efbrkfb7if+eAxynNRrQcjncv1k1bIAPK6nUTo3N?=
 =?us-ascii?Q?uSdEePiFhQrex6mZXgHa8SDEDDEYnYOBHi/T3w8n0YwvKKQQV1o/p1rhU/MX?=
 =?us-ascii?Q?6N6dAtWBYRNwgXc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS1PPF5540628D6.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DIKtsvCSVyhJzUpyLcx9bowOzq6osvouQiNuBdVNQZlV8DcRaI9LIZEG3T8n?=
 =?us-ascii?Q?XbIAhh/kAlXbsgrQRnN1HqCtZDh6zDZh9pn0ToV41h6JkbnckfqEkgXwFgsx?=
 =?us-ascii?Q?yxjZKFy9EFRxHACg3ik6GsmZh3FDvpaQt0vHEJ3cfFr8BPfXrUuz8h7KRR/6?=
 =?us-ascii?Q?ZAuceiO6iQFereTLL2AfDmoT8PBwuLe4xhESt6KZLQcx/cI/OwGVXOOHP8nh?=
 =?us-ascii?Q?Yyd9oki7r3Tjhk9TXssvod8XUKZ+HXvFZq0wGWtW//RtLu/KOCI4+TGCU08H?=
 =?us-ascii?Q?xuLBipjDHIWjWaTdBbso452DpLg+KS1La5Sc711NlXRuU6Cb46qU5CKmKy5Y?=
 =?us-ascii?Q?tWajfvCFU0e0NyC6ldrSD4PecI70AnmDoT+WBP289xmQVeMgrXBXgxqO1x3k?=
 =?us-ascii?Q?UCxwc4UCGt/3RhHcU3NdRvnPNeFiu/ioUJ50VRjwtBWlC6sulN6IrjMAdVD2?=
 =?us-ascii?Q?23UWRuC2y7jdbiws+B7CN/9Ae1eSduSi/C4j1llmGQGeAHt4r1Xy4sNWhuft?=
 =?us-ascii?Q?jtd9/mGnxmAK17orUIZXo0TtZxTore7FaF73YgDiA8gzxOYSqbDpXpUSmqGh?=
 =?us-ascii?Q?gMuQiiYE5sWl1PEgkKtHMn/BvYbiroC0S+wGK3ryXVepGZZ/BkCyXk5mQ4ns?=
 =?us-ascii?Q?JcPCt30rARhGlJZYzCuT8R5R1gUNzbhm/LelsCfw6qJB3Yba3O2gF3nkXFcN?=
 =?us-ascii?Q?rQdJySMfPxdppYecthn5Xq50gyDIw17qC+1K6S/LNyma5Pm8UysXf8t+sIex?=
 =?us-ascii?Q?8T8GQDbyBk2W3f39j+Pncl5dy3YbqlOtgKi2YCARqsWB9Lcxvgy7IyLwxgK9?=
 =?us-ascii?Q?gnlmlwpFCSh1Zb5jY87kLnRUbCDMLq34x88+zEjx3upOSewyCr7nEr2tHYsA?=
 =?us-ascii?Q?Yi7AE+3Z1MPO0TBeB4yT2iRa0fBhEEUovbKhZzGlCtd6uJr8JtKq+b6PJDlj?=
 =?us-ascii?Q?B9+PzE0hNRwsiFrFeZpgkUEc5hDtCeuyTZxr1Mrnb9aZW83vTG2WzBmjs9Ab?=
 =?us-ascii?Q?7UKmmqn6FwWPncTvw9ELRtjh6ARnCsGuTtClHQOmxGU0Ff320O8wQRQ61dVo?=
 =?us-ascii?Q?j5aOJf0PHnz2UeFmlt4yKNKkXuYMr047Uo6KUiA5heU6dAjbdsM5WvYoC2cJ?=
 =?us-ascii?Q?r5GffY8wtiejIUggI0QfUE8JQjcq8NjzbPacQs+QgSVhV0YOqmBTv3yPJ4oq?=
 =?us-ascii?Q?7fIHsV7v84AnVlgjx8QZpUpN/v+L7t87NC5bUuosnMpRgjhKS9HKMF58wCS3?=
 =?us-ascii?Q?Ai1Y34otn6Q2aTYJjwcxpKTz+Tz5DGsAXkz/NPOFN44gjZmfUA2z0H4jcE0b?=
 =?us-ascii?Q?tUosRg8R4iWTRasqNbqG7E/YT7BeDcAk/qPc0iqVxE0GDF8KJRgCT97WF69a?=
 =?us-ascii?Q?S+HUpf1YpIMeXV6F+QHnCPOA/L1yQI7pgEeEGYD1foPm7XVGOYXkcHZatr4W?=
 =?us-ascii?Q?cxdWVfR0PEae6YyydLZDRBfKCZwIFvZx76N799d9DZXoC9QqOJhaib2GKFlE?=
 =?us-ascii?Q?+5uBUozEG/oKdLtrNoO4lGcKNBJh708rmCCQiOKR8Raxc3gYS8g/wPRddI/O?=
 =?us-ascii?Q?7MnIKmLaqWlcImYJMvLgg6ucm4kbNxc9+wJn+qnr?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a211dbc3-f6c2-41dc-0f3e-08ddcf12c0b0
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF5540628D6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 02:42:40.8544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+yY0ldLpOMnfAekY94z+h4fR8ZlCilOJhMCoaSiWEAh9zBigrObjvjl7oMexZxYn1CH6TN6yxPee0vkfGosgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7132
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch allows privileged users to reserve nodes via the
 'reserve_node' mount option, which is similar to the existing 'reserve_root'
 option. "-o reserve_node=<N>" means <N> nodes are reserved for privileged
 users only. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.75.7 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
X-Headers-End: 1ugwmI-0006B7-PI
Subject: [f2fs-dev] [PATCH v2] f2fs: add reserved nodes for privileged users
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: Chunhai Guo <guochunhai@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch allows privileged users to reserve nodes via the
'reserve_node' mount option, which is similar to the existing
'reserve_root' option.

"-o reserve_node=<N>" means <N> nodes are reserved for privileged
users only.

Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
v2: Add two missing handling parts.
v1: https://lore.kernel.org/linux-f2fs-devel/20250729095238.607433-1-guochunhai@vivo.com/
---
 Documentation/filesystems/f2fs.rst |  9 +++++---
 fs/f2fs/f2fs.h                     | 15 +++++++-----
 fs/f2fs/super.c                    | 37 ++++++++++++++++++++++++++----
 3 files changed, 48 insertions(+), 13 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 03b1efa6d3b2..95dbcd7ac9a8 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -173,9 +173,12 @@ data_flush		 Enable data flushing before checkpoint in order to
 			 persist data of regular and symlink.
 reserve_root=%d		 Support configuring reserved space which is used for
 			 allocation from a privileged user with specified uid or
-			 gid, unit: 4KB, the default limit is 0.2% of user blocks.
-resuid=%d		 The user ID which may use the reserved blocks.
-resgid=%d		 The group ID which may use the reserved blocks.
+			 gid, unit: 4KB, the default limit is 12.5% of user blocks.
+reserve_node=%d		 Support configuring reserved nodes which are used for
+			 allocation from a privileged user with specified uid or
+			 gid, the default limit is 12.5% of all nodes.
+resuid=%d		 The user ID which may use the reserved blocks and nodes.
+resgid=%d		 The group ID which may use the reserved blocks and nodes.
 fault_injection=%d	 Enable fault injection in all supported types with
 			 specified injection rate.
 fault_type=%d		 Support configuring fault injection type, should be
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 97c1a2a3fbd7..f4c4ea115465 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -131,6 +131,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
  * string rather than using the MS_LAZYTIME flag, so this must remain.
  */
 #define F2FS_MOUNT_LAZYTIME		0x40000000
+#define F2FS_MOUNT_RESERVE_NODE		0x80000000
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
 #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
@@ -171,6 +172,7 @@ struct f2fs_rwsem {
 
 struct f2fs_mount_info {
 	unsigned int opt;
+	unsigned int root_reserved_nodes; /* root reserved nodes */
 	block_t root_reserved_blocks;	/* root reserved blocks */
 	kuid_t s_resuid;		/* reserved blocks for uid */
 	kgid_t s_resgid;		/* reserved blocks for gid */
@@ -2355,13 +2357,11 @@ static inline bool f2fs_has_xattr_block(unsigned int ofs)
 	return ofs == XATTR_NODE_OFFSET;
 }
 
-static inline bool __allow_reserved_blocks(struct f2fs_sb_info *sbi,
+static inline bool __allow_reserved_root(struct f2fs_sb_info *sbi,
 					struct inode *inode, bool cap)
 {
 	if (!inode)
 		return true;
-	if (!test_opt(sbi, RESERVE_ROOT))
-		return false;
 	if (IS_NOQUOTA(inode))
 		return true;
 	if (uid_eq(F2FS_OPTION(sbi).s_resuid, current_fsuid()))
@@ -2382,7 +2382,7 @@ static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
 	avail_user_block_count = sbi->user_block_count -
 					sbi->current_reserved_blocks;
 
-	if (!__allow_reserved_blocks(sbi, inode, cap))
+	if (!__allow_reserved_root(sbi, inode, cap))
 		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
 
 	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
@@ -2740,7 +2740,7 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
 					struct inode *inode, bool is_inode)
 {
 	block_t	valid_block_count;
-	unsigned int valid_node_count;
+	unsigned int valid_node_count, avail_user_node_count;
 	unsigned int avail_user_block_count;
 	int err;
 
@@ -2769,8 +2769,11 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
 		goto enospc;
 	}
 
+	avail_user_node_count = sbi->total_node_count - F2FS_RESERVED_NODE_NUM;
+	if (!__allow_reserved_root(sbi, inode, false))
+		avail_user_node_count -= F2FS_OPTION(sbi).root_reserved_nodes;
 	valid_node_count = sbi->total_valid_node_count + 1;
-	if (unlikely(valid_node_count > sbi->total_node_count)) {
+	if (unlikely(valid_node_count > avail_user_node_count)) {
 		spin_unlock(&sbi->stat_lock);
 		goto enospc;
 	}
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 30c038413040..54a40820b3da 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -143,6 +143,7 @@ enum {
 	Opt_extent_cache,
 	Opt_data_flush,
 	Opt_reserve_root,
+	Opt_reserve_node,
 	Opt_resgid,
 	Opt_resuid,
 	Opt_mode,
@@ -265,6 +266,7 @@ static const struct fs_parameter_spec f2fs_param_specs[] = {
 	fsparam_flag_no("extent_cache", Opt_extent_cache),
 	fsparam_flag("data_flush", Opt_data_flush),
 	fsparam_u32("reserve_root", Opt_reserve_root),
+	fsparam_u32("reserve_node", Opt_reserve_node),
 	fsparam_gid("resgid", Opt_resgid),
 	fsparam_uid("resuid", Opt_resuid),
 	fsparam_enum("mode", Opt_mode, f2fs_param_mode),
@@ -336,6 +338,7 @@ static match_table_t f2fs_checkpoint_tokens = {
 #define F2FS_SPEC_discard_unit			(1 << 21)
 #define F2FS_SPEC_memory_mode			(1 << 22)
 #define F2FS_SPEC_errors			(1 << 23)
+#define F2FS_SPEC_reserve_node			(1 << 24)
 
 struct f2fs_fs_context {
 	struct f2fs_mount_info info;
@@ -439,6 +442,7 @@ static inline void limit_reserve_root(struct f2fs_sb_info *sbi)
 {
 	block_t limit = min((sbi->user_block_count >> 3),
 			sbi->user_block_count - sbi->reserved_blocks);
+	unsigned int node_limit = sbi->total_node_count >> 3;
 
 	/* limit is 12.5% */
 	if (test_opt(sbi, RESERVE_ROOT) &&
@@ -447,12 +451,19 @@ static inline void limit_reserve_root(struct f2fs_sb_info *sbi)
 		f2fs_info(sbi, "Reduce reserved blocks for root = %u",
 			  F2FS_OPTION(sbi).root_reserved_blocks);
 	}
-	if (!test_opt(sbi, RESERVE_ROOT) &&
+	if (test_opt(sbi, RESERVE_NODE) &&
+			F2FS_OPTION(sbi).root_reserved_nodes > node_limit) {
+		F2FS_OPTION(sbi).root_reserved_nodes = node_limit;
+		f2fs_info(sbi, "Reduce reserved nodes for root = %u",
+			  F2FS_OPTION(sbi).root_reserved_nodes);
+	}
+	if (!test_opt(sbi, RESERVE_ROOT) && !test_opt(sbi, RESERVE_NODE) &&
 		(!uid_eq(F2FS_OPTION(sbi).s_resuid,
 				make_kuid(&init_user_ns, F2FS_DEF_RESUID)) ||
 		!gid_eq(F2FS_OPTION(sbi).s_resgid,
 				make_kgid(&init_user_ns, F2FS_DEF_RESGID))))
-		f2fs_info(sbi, "Ignore s_resuid=%u, s_resgid=%u w/o reserve_root",
+		f2fs_info(sbi, "Ignore s_resuid=%u, s_resgid=%u w/o reserve_root"
+				" and reserve_node",
 			  from_kuid_munged(&init_user_ns,
 					   F2FS_OPTION(sbi).s_resuid),
 			  from_kgid_munged(&init_user_ns,
@@ -841,6 +852,11 @@ static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		F2FS_CTX_INFO(ctx).root_reserved_blocks = result.uint_32;
 		ctx->spec_mask |= F2FS_SPEC_reserve_root;
 		break;
+	case Opt_reserve_node:
+		ctx_set_opt(ctx, F2FS_MOUNT_RESERVE_NODE);
+		F2FS_CTX_INFO(ctx).root_reserved_nodes = result.uint_32;
+		ctx->spec_mask |= F2FS_SPEC_reserve_node;
+		break;
 	case Opt_resuid:
 		F2FS_CTX_INFO(ctx).s_resuid = result.uid;
 		ctx->spec_mask |= F2FS_SPEC_resuid;
@@ -1424,6 +1440,14 @@ static int f2fs_check_opt_consistency(struct fs_context *fc,
 		ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_ROOT);
 		ctx->opt_mask &= ~F2FS_MOUNT_RESERVE_ROOT;
 	}
+	if (test_opt(sbi, RESERVE_NODE) &&
+			(ctx->opt_mask & F2FS_MOUNT_RESERVE_NODE) &&
+			ctx_test_opt(ctx, F2FS_MOUNT_RESERVE_NODE)) {
+		f2fs_info(sbi, "Preserve previous reserve_node=%u",
+			F2FS_OPTION(sbi).root_reserved_nodes);
+		ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_NODE);
+		ctx->opt_mask &= ~F2FS_MOUNT_RESERVE_NODE;
+	}
 
 	err = f2fs_check_test_dummy_encryption(fc, sb);
 	if (err)
@@ -1623,6 +1647,9 @@ static void f2fs_apply_options(struct fs_context *fc, struct super_block *sb)
 	if (ctx->spec_mask & F2FS_SPEC_reserve_root)
 		F2FS_OPTION(sbi).root_reserved_blocks =
 					F2FS_CTX_INFO(ctx).root_reserved_blocks;
+	if (ctx->spec_mask & F2FS_SPEC_reserve_node)
+		F2FS_OPTION(sbi).root_reserved_nodes =
+					F2FS_CTX_INFO(ctx).root_reserved_nodes;
 	if (ctx->spec_mask & F2FS_SPEC_resgid)
 		F2FS_OPTION(sbi).s_resgid = F2FS_CTX_INFO(ctx).s_resgid;
 	if (ctx->spec_mask & F2FS_SPEC_resuid)
@@ -2342,9 +2369,11 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 	else if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_BLK)
 		seq_puts(seq, "fragment:block");
 	seq_printf(seq, ",active_logs=%u", F2FS_OPTION(sbi).active_logs);
-	if (test_opt(sbi, RESERVE_ROOT))
-		seq_printf(seq, ",reserve_root=%u,resuid=%u,resgid=%u",
+	if (test_opt(sbi, RESERVE_ROOT) || test_opt(sbi, RESERVE_NODE))
+		seq_printf(seq, ",reserve_root=%u,reserve_node=%u,resuid=%u,"
+				"resgid=%u",
 				F2FS_OPTION(sbi).root_reserved_blocks,
+				F2FS_OPTION(sbi).root_reserved_nodes,
 				from_kuid_munged(&init_user_ns,
 					F2FS_OPTION(sbi).s_resuid),
 				from_kgid_munged(&init_user_ns,
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
