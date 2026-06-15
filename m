Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F9dIAsr5L2qBKwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 15:10:34 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F40686901
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 15:10:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=OAuCQTuX;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=YEgxQX+d;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=QttiZ5XP;
	dkim=fail ("body hash did not verify") header.d=vivo.com header.s=selector2 header.b=AI8qxaag;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4PcVPnDa7cPg4bz+N62WEd17S/JWDqAaSG3W6uIBmU=; b=OAuCQTuXixH8S3tQD1eOOpkNLe
	cX2MPR2A/OKcsWBZbQ0Prq0nfZx0UGT02FLslKyd6dICpjP+tSh92jtnj3C6xeSUJrt/Co85eagin
	6eYk16+g6XU2e1rvPkxE5dqYexg/6+tqW7dUPeE7+/219qyrOE60TlMhA4+vhT/nXgCs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ75B-0004bE-Ms;
	Mon, 15 Jun 2026 13:10:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1wZ75A-0004ar-2O
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 13:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Oc3z6chtPToyjPqFaqzPAuJftTS0SH9CiaKY5GTjgWU=; b=YEgxQX+dnaP3Tpxni7M1246iQF
 Pw1JI63Cv+kEXUHe4shE8hHf95agVVU63FWxcvfI1lU26boqJUGuwpIUe5x53euck1QBLDK4p/h4R
 Xq/OqVDot/yMkybf6f3jXnacj6ipzdd8fA17z0IidJ7tCvWqM32PLwZ7rA0pFHSbVxx8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Oc3z6chtPToyjPqFaqzPAuJftTS0SH9CiaKY5GTjgWU=; b=QttiZ5XPlndnbYwxUkomgIsoNf
 R2CAkpf0gZTGJpcheQv/TxpttgayRLwUrObEpJjI68rsULdKFJgd1L6Q17nbpaEW1a/9Y/GbxRL1o
 Yspi+J7DeAQ/3fyPB09KBztq4DgP4H5nbYoFFFe5bfnmJaLw+HMaaHVaSOOq/KaLlzMk=;
Received: from mail-japanwestazon11012070.outbound.protection.outlook.com
 ([40.107.75.70] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ757-0006NG-VM for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 13:10:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EsqiVqLf/0ynH7GDZfVCfbs3f/rQ3BwvM88ewab1mTlBHBzMV5TWlzlSyYyLZPM3dh1gfGKx107z+FbfbgknUF5Qynn5FIdDuQ2Acz+8YRHuOkocPrJd5sNajGoc5ZSnwQkKRYx4CJoa/W/9UcvgIiTFQhN2YW0rC5sZnWw7ff+cR9UB8uuj6ibbV5aQlpEepjGs95321ee5hOz8UOhOyMpoI52ewJNdk7l1WEYyXgeVQcxLTqcp0XIfXZ45eAtl2FG6dC68jnFre5sM3dY8fEecNgCAsRagQisMpRSOoL8TJ8OnnRJ6FvqcQJHDCDEIyOOu3zWXr42olZA7Z/7ZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oc3z6chtPToyjPqFaqzPAuJftTS0SH9CiaKY5GTjgWU=;
 b=Z8tIzcNirKpSQDJEOCI0gtsMx8HO/pHt8Tz4CalRsojcON7gavILQxiMpQp753n5xaBIYxHJyhkUnIfhMr5f4SeMc81ZT9QAWDHmbSqXsHz7pPpif7Ox4mNhXbeEQ0WpTlOD7dFkoH9R5M5vLQgGiPURr0KKSAnrhdMjG3RMyjoSnB7P5SR9MSEZE5GieZppPr3lnj6B/aLLnByxOadnxFgibJ8s1EAp24iZeHfdnND65k9sZrRIDI3HWiGLeLOaVlY9Y5xgCA9rPz06nCYLWcopqkuptfF0GZR1aOeCgZsqkr4o6fIUq7pikH0h1hKS04cmr3/zcFNIY44przu0kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oc3z6chtPToyjPqFaqzPAuJftTS0SH9CiaKY5GTjgWU=;
 b=AI8qxaagL32JG4uifjXa/W2y1ehLbIdkhXKkoKoojeADaffk0+d+1uQTfuhKa3Mkn4fFSzdKumDT+1EBqsg5r1pFmvMkvRzjSWBCcCX8nYm1HMyYTRLiY+w1aA2Z8Jvz02JRI7lq/at6dH4Q0jmb1ZR8C+dgvwuLODRho2yjGX+IWyYBa7nAIgK2kX/La1C+1W+D3A2yh7tSMIyV6J4so0aimbLkNGtZVH7tnWH6egNzCBYFQ/ENY0cDRrqowzblmz0QTUdOQqATbyDp8AlQD71Dz822XfgRtZMw5PCcAdUJh35n5w53Tdb6YakWS7UlYpTGg+XXGkSYuD/d7v6z7w==
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by OSNPR06MB8687.apcprd06.prod.outlook.com (2603:1096:604:493::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 12:55:34 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 12:55:34 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM),
 linux-kernel@vger.kernel.org (open list)
Date: Mon, 15 Jun 2026 20:55:14 +0800
Message-Id: <20260615125517.362294-3-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615125517.362294-1-liaoyuanhong@vivo.com>
References: <20260615125517.362294-1-liaoyuanhong@vivo.com>
X-ClientProxiedBy: TPYP295CA0031.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:7::9)
 To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|OSNPR06MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: 28612dc7-66c5-4329-54f6-08decadd63de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|23010399003|1800799024|56012099006|11063799006|22082099003|18002099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info: Hsx/DfnxycYACGVWAf1mhMsoWU4WdaB2Tx52isWJJFww/iBg9IqVJU/tMq/ZUqB+4/AldZGpkF766qwuS19JT/j0KOLSw3PmIs1TPMKaxIzF8R8z3c4YE2I0DoqtzFVl39gKft/SMKkTyGWPzV+WkO0qdfcS/RlHO9BbRv3TchFf6b/bPtEwzBQgVXkzQy6s8ybHt/KbTv+PEGUc7nhxWhvUX8bfjKnzjmrAcIH5Rf4D1f12+MjOuyKrJ3kXgVxSDhT6gnIUlzvcSQyFK7nEvq5wsmV2lU6gv3NO8aGUGVc9n8JAfj7wmZcyX/eAbPYhgd3PQvyG5838kwZIlSJ1BRX0qxEqHEgSMGdx++ukwpCTIs26pVkqhITZDSiY5sp3JbNy5Xjb/cNgQx1TVRVE0jVwGZEJ/urxZx7JZD4t3nhpR44Xe/X8X6ke13jO2H17GPuuz6M9E8xOhRMBaZx5JgTPz9EZYjKRBQgaCNX0fSn+l5b90fc9VRy470CrRyZGvyhQhwH35t2A4eCuEm6a4vw7rJ5RLV4/JLbxv6Kl2ykbKFWQLjJgVl+SizIujJykaY/6qzlFtDZvlvKowaW7IlArpbRZNLx2l/1sLMkzUyVx1gmfYg1F4uw48cneg1VnXtXAxur5bvzmddCg9gWoQf/E/N24XzvN/soJZkwsOvPZJS2S7byzDVwzPvWMZirCoz2lNIUjT3Xp2U6mLcPiFV3hhPhrXJ9Gw+YSR1FfgdfyK7tJEXbFIQ+FMNvA/mjU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XG5k8DncN9Z15w73DkmPD1epxmywm6WR8tIBlXbDsqeWNinaI1xwkoI3mHVp?=
 =?us-ascii?Q?UXNl2CdcfMe1CGLYDq+O6JPbFeD2+Vq4g5RldweVFqbBR/4YdPJ5HGSOYHYJ?=
 =?us-ascii?Q?B6qmNig/F1s0CRgqjxTde6YUMqilzIwviKK7JYzxBhhv25jGUa1g/bZHwaT/?=
 =?us-ascii?Q?EdJifBZ8K5hslpqZQzT8/MCtIImOCOrL7P+7eRxfZwvHFPlMI92WyKgvUsZX?=
 =?us-ascii?Q?9tY8XGLcVKGFIBJhW3uhMTG0X78+7L32N8jff5BgwOTrm3KYY/li0gqURdU5?=
 =?us-ascii?Q?S7BZzSvU5ie45gEiUsTyny79ymba//iivl8oaJjM/qAn2zsnMJZdIy6dD/k3?=
 =?us-ascii?Q?u/jQEHx44GcTZnNp5ROTRrmlkAgPCnZh7if+FIdLMXMYQyQxIU8BSEk1t1LO?=
 =?us-ascii?Q?GZMT8jRudRRUMWwFF4GejRNXPDcO/lOHBSSWNJj9xoT+stEw6r3rMGRotphV?=
 =?us-ascii?Q?bTgOSXsvnFFoZWhBekN5PIH1dTmFNk5YDWwT5VhrgX457ruX/rxYr11BSewu?=
 =?us-ascii?Q?KrWDlry18nqttunTu097P29NvG9t6iPolfL2d1jGEqxIkmpJ4sRjHaf/AdK1?=
 =?us-ascii?Q?jJ9EdnUNij/yc6FyO5NKX1MdhFqinh97/YGrO1Rak8nXpoO5P3RK9V+4Uhht?=
 =?us-ascii?Q?zEw1BQfoYw4Zxx39M4W491KGSz67zYz27USiBmX6QVIhFWYoieSi0Frujy3d?=
 =?us-ascii?Q?7nfL9HJuDy9yC9VwXOLO+9aS+jDuAeWJiM76OGGKO3vL5X1WNSYb0sMqWLNz?=
 =?us-ascii?Q?1sywFRtvfgO80gTBBkix9huF1EsnUMBq4UcrtXP8rZ/saXaFgEKgD5OEQQLd?=
 =?us-ascii?Q?sCHO9y1vgcZNsxcPaTOgwsWEJ+4r9O2Ig45vAPSo30TsboihXZ87iirsMKtF?=
 =?us-ascii?Q?xa+nyAk6kPU9KYLF2rgj0Ja020wCJjtTmL7J9IEac9cBXzYmTZWT7JaLPpKx?=
 =?us-ascii?Q?mLMXyGYDaVcAV2OL3G9JozQXOl7vy0XNrt1nwqlJKCm9Nu2E6xDy3Zs2gIJg?=
 =?us-ascii?Q?1fqnu1E1Be52tW1tox/TikT3u4kFw/cjR/b6c+tNZY3H27AUU3nY8bPQHgeX?=
 =?us-ascii?Q?/dvz0HQcT9iqQhdmLcH+eBKsSScU3aXdxz9nBpJoSV1Q5uNW0k3ZzxiJrpu/?=
 =?us-ascii?Q?zRTHbrhD9cx7TlyGfZhpmP2CSNkB8ie8zxPaIjodt0R6rHg7Q2A8lebTdb6G?=
 =?us-ascii?Q?5D/hGfQrDcAwHq8GiqXbAPCzAYsDG39UBatAeG7mMU4gMrYG2KbJcTaBp56B?=
 =?us-ascii?Q?vNiobqMaRSAv7ekHsSxAeJHYknvXEwax6wV3vr+o7AlJJWpx8YuwhqdTE+zF?=
 =?us-ascii?Q?nx4nHYEJziQhtx0/tgugfOY4tShKBErOZPwZ1xoJEjMYcRTaVCTh+L8bnFkn?=
 =?us-ascii?Q?YLb4KCLqXYA1h8S9EJZDJZvxcHtqTN1FXDnBWe9OEoJmZ63xblsj/kKDfY8s?=
 =?us-ascii?Q?9oTZAZ85RK3TAmbKrIWrkGi9o1gE+7zwVaArCAlf9qejNMnc1O0dfBrctl1I?=
 =?us-ascii?Q?tRZpGixezZoP+4TELEj/3F0HWAdI1rVKaItykJGKHyF/TWK47rdJky/eRFA3?=
 =?us-ascii?Q?HDKMbpangEkjZGV3xtZtxnjpkDzVumeZKjKbyTs92AzERVE7DRXKSvnD1evM?=
 =?us-ascii?Q?zTXYmEOBFeHG9OGE31mnNQojpbc3ysaKA7jDcClkHyQukfRWF+2cOCg6wKHW?=
 =?us-ascii?Q?xivKVjNXmSz4wiXc5j/XMp9vvURdXASJudCMS+tfDap5u48XykpvjJoT5DQY?=
 =?us-ascii?Q?hK8P3FZ38g=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28612dc7-66c5-4329-54f6-08decadd63de
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 12:55:34.6970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7mXQr2PtFWIM8bLTY9suf9FXwIsMVzaiJ22kA8nsbQzcvKHIkzNGKdgeW/jTpbPGyAcJ5cIzcgi+PzW3hj2t6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8687
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: F2FS normally disables inline data for encrypted regular
 files
 because the inline payload is stored in the inode block and does not pass
 through the regular fscrypt data I/O path. This wastes space fo [...] 
 Content analysis details:   (1.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.75.70 listed in wl.mailspike.net]
X-Headers-End: 1wZ757-0006NG-VM
Subject: [f2fs-dev] [PATCH v3 2/3] f2fs: support encrypted inline data
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
From: LiaoYuanhong-vivo via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>
Cc: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:liaoyuanhong@vivo.com,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,vivo.com:s=selector2];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,vivo.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp,vivo.com:replyto,vivo.com:email,vivo.com:mid];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[liaoyuanhong@vivo.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5F40686901

F2FS normally disables inline data for encrypted regular files because the
inline payload is stored in the inode block and does not pass through the
regular fscrypt data I/O path.  This wastes space for small encrypted files
on filesystems that otherwise use inline_data.

Add encrypted inline data support for encrypted regular files.  When the
encrypted_inline_data on-disk feature is enabled, inline payloads of
encrypted regular files are stored as ciphertext in the inode block.  They
are decrypted into page-cache plaintext on read and encrypted before being
copied back into the inode block on write.

F2FS keeps the on-disk format decision separate from fscrypt key
capability.  It uses fscrypt_supports_data_unit_inplace() when deciding
whether a new file may keep inline_data.  It calls
fscrypt_prepare_data_unit_inplace() only when the encrypted inline payload
is actually read or written.

Update inline-data size checks to use the encrypted inline capacity, since
the stored payload is rounded to the fscrypt contents alignment.  If an
encrypted inline-data file is truncated from a non-zero offset, convert it
to normal data blocks first and then use the normal truncate path.
Recovery copies inline payloads as on-disk bytes.

Signed-off-by: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>
---
Changes in v3:
- Follow the updated fscrypt key support matrix.
- Clean up the inline-data conversion error path.

 fs/f2fs/Kconfig  |  14 +++++
 fs/f2fs/data.c   |   8 +--
 fs/f2fs/f2fs.h   |  37 ++++++++++++-
 fs/f2fs/file.c   |  24 ++++++++-
 fs/f2fs/inline.c | 134 ++++++++++++++++++++++++++++++++++++++++++-----
 fs/f2fs/super.c  |  12 +++++
 fs/f2fs/sysfs.c  |   8 +++
 7 files changed, 217 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 5916a02fb46d..0220f23be56d 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -92,6 +92,20 @@ config F2FS_FAULT_INJECTION
 
 	  If unsure, say N.
 
+config F2FS_FS_ENCRYPTED_INLINE_DATA
+	bool "F2FS encrypted inline data support"
+	depends on F2FS_FS && FS_ENCRYPTION
+	help
+	  Allow encrypted regular files to keep inline data inside the inode
+	  while encrypting that inode-managed payload in software.
+
+	  This does not change normal data block encryption.  Normal data
+	  blocks continue to use the existing fscrypt path, such as blk-crypto
+	  when inline encryption is enabled.
+
+	  Filesystems carrying the encrypted_inline_data incompat feature
+	  require this option in order to be mounted correctly.
+
 config F2FS_FS_COMPRESSION
 	bool "F2FS compression feature"
 	depends on F2FS_FS
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 657fd5986c73..9371ffa7c96d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3700,7 +3700,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 
 	/* f2fs_lock_op avoids race between write CP and convert_inline_page */
 	if (f2fs_has_inline_data(inode)) {
-		if (pos + len > MAX_INLINE_DATA(inode))
+		if (pos + len > f2fs_max_inline_data(inode))
 			flag = F2FS_GET_BLOCK_DEFAULT;
 		f2fs_map_lock(sbi, &lc, flag);
 		locked = true;
@@ -3720,8 +3720,10 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 	set_new_dnode(&dn, inode, ifolio, ifolio, 0);
 
 	if (f2fs_has_inline_data(inode)) {
-		if (pos + len <= MAX_INLINE_DATA(inode)) {
-			f2fs_do_read_inline_data(folio, ifolio);
+		if (pos + len <= f2fs_max_inline_data(inode)) {
+			err = f2fs_do_read_inline_data(folio, ifolio);
+			if (err)
+				goto out;
 			set_inode_flag(inode, FI_DATA_EXIST);
 			if (inode->i_nlink)
 				folio_set_f2fs_inline(ifolio);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 832b2f8beb11..0a2d75baf23e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -276,6 +276,7 @@ struct f2fs_mount_info {
 #define F2FS_FEATURE_RO				0x00004000
 #define F2FS_FEATURE_DEVICE_ALIAS		0x00008000
 #define F2FS_FEATURE_PACKED_SSA			0x00010000
+#define F2FS_FEATURE_ENCRYPTED_INLINE_DATA	0x00020000
 
 #define __F2FS_HAS_FEATURE(raw_super, mask)				\
 	((raw_super->feature & cpu_to_le32(mask)) != 0)
@@ -4502,7 +4503,7 @@ extern struct kmem_cache *f2fs_inode_entry_slab;
 bool f2fs_may_inline_data(struct inode *inode);
 bool f2fs_sanity_check_inline_data(struct inode *inode, struct folio *ifolio);
 bool f2fs_may_inline_dentry(struct inode *inode);
-void f2fs_do_read_inline_data(struct folio *folio, struct folio *ifolio);
+int f2fs_do_read_inline_data(struct folio *folio, struct folio *ifolio);
 void f2fs_truncate_inline_inode(struct inode *inode, struct folio *ifolio,
 		u64 from);
 int f2fs_read_inline_data(struct inode *inode, struct folio *folio);
@@ -4595,6 +4596,39 @@ static inline bool f2fs_encrypted_file(struct inode *inode)
 	return IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode);
 }
 
+static inline bool f2fs_sb_has_encrypted_inline_data(struct f2fs_sb_info *sbi);
+
+static inline bool f2fs_uses_encrypted_inline_data(struct inode *inode)
+{
+#ifdef CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA
+	/*
+	 * When the filesystem allows encrypted inline data, inline payloads
+	 * in encrypted regular files are interpreted as ciphertext.
+	 */
+	return f2fs_sb_has_encrypted_inline_data(F2FS_I_SB(inode)) &&
+	       f2fs_encrypted_file(inode);
+#else
+	return false;
+#endif
+}
+
+static inline unsigned int f2fs_max_inline_data(struct inode *inode)
+{
+	unsigned int max_bytes = MAX_INLINE_DATA(inode);
+
+	/*
+	 * Encrypted inline data is rounded up to the fscrypt contents
+	 * alignment before being stored back into the inode.  This is an
+	 * on-disk layout constraint, so it must not depend on whether the
+	 * inode's key has been prepared yet.
+	 */
+#ifdef CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA
+	if (f2fs_uses_encrypted_inline_data(inode))
+		max_bytes = round_down(max_bytes, FSCRYPT_CONTENTS_ALIGNMENT);
+#endif
+	return max_bytes;
+}
+
 static inline void f2fs_set_encrypted_inode(struct inode *inode)
 {
 #ifdef CONFIG_FS_ENCRYPTION
@@ -4827,6 +4861,7 @@ F2FS_FEATURE_FUNCS(compression, COMPRESSION);
 F2FS_FEATURE_FUNCS(readonly, RO);
 F2FS_FEATURE_FUNCS(device_alias, DEVICE_ALIAS);
 F2FS_FEATURE_FUNCS(packed_ssa, PACKED_SSA);
+F2FS_FEATURE_FUNCS(encrypted_inline_data, ENCRYPTED_INLINE_DATA);
 
 #ifdef CONFIG_BLK_DEV_ZONED
 static inline bool f2fs_zone_is_seq(struct f2fs_sb_info *sbi, int devi,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 71385ca4163d..ec243bb9039b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -825,12 +825,32 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 	}
 
 	if (f2fs_has_inline_data(inode)) {
+		if (f2fs_uses_encrypted_inline_data(inode) && from) {
+			f2fs_folio_put(ifolio, true);
+			if (lock)
+				f2fs_unlock_op(sbi, &lc);
+
+			err = f2fs_convert_inline_inode(inode);
+
+			if (lock)
+				f2fs_lock_op(sbi, &lc);
+			if (err)
+				goto out;
+
+			ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
+			if (IS_ERR(ifolio)) {
+				err = PTR_ERR(ifolio);
+				goto out;
+			}
+			goto truncate_blocks;
+		}
 		f2fs_truncate_inline_inode(inode, ifolio, from);
 		f2fs_folio_put(ifolio, true);
 		truncate_page = true;
 		goto out;
 	}
 
+truncate_blocks:
 	set_new_dnode(&dn, inode, ifolio, NULL, 0);
 	err = f2fs_get_dnode_of_data(&dn, free_from, LOOKUP_NODE_RA);
 	if (err) {
@@ -1147,7 +1167,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	if (attr->ia_valid & ATTR_SIZE) {
 		loff_t old_size = i_size_read(inode);
 
-		if (attr->ia_size > MAX_INLINE_DATA(inode)) {
+		if (attr->ia_size > f2fs_max_inline_data(inode)) {
 			/*
 			 * should convert inline inode before i_size_write to
 			 * keep smaller than inline_data size with inline flag.
@@ -5007,7 +5027,7 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 
 	if (f2fs_has_inline_data(inode)) {
 		/* If the data will fit inline, don't bother. */
-		if (pos + count <= MAX_INLINE_DATA(inode))
+		if (pos + count <= f2fs_max_inline_data(inode))
 			return 0;
 		ret = f2fs_convert_inline_inode(inode);
 		if (ret)
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 099f72089701..85846f2e7866 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -21,7 +21,7 @@ static bool support_inline_data(struct inode *inode)
 		return false;
 	if (!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))
 		return false;
-	if (i_size_read(inode) > MAX_INLINE_DATA(inode))
+	if (i_size_read(inode) > f2fs_max_inline_data(inode))
 		return false;
 	return true;
 }
@@ -31,6 +31,9 @@ bool f2fs_may_inline_data(struct inode *inode)
 	if (!support_inline_data(inode))
 		return false;
 
+	if (f2fs_uses_encrypted_inline_data(inode))
+		return fscrypt_supports_data_unit_inplace(inode);
+
 	return !f2fs_post_read_required(inode);
 }
 
@@ -65,7 +68,9 @@ bool f2fs_sanity_check_inline_data(struct inode *inode, struct folio *ifolio)
 	 * been synchronized to inmem fields.
 	 */
 	return (S_ISREG(inode->i_mode) &&
-		(file_is_encrypt(inode) || file_is_verity(inode) ||
+		((file_is_encrypt(inode) &&
+		  !f2fs_sb_has_encrypted_inline_data(F2FS_I_SB(inode))) ||
+		 file_is_verity(inode) ||
 		(F2FS_I(inode)->i_flags & F2FS_COMPR_FL)));
 }
 
@@ -80,22 +85,66 @@ bool f2fs_may_inline_dentry(struct inode *inode)
 	return true;
 }
 
-void f2fs_do_read_inline_data(struct folio *folio, struct folio *ifolio)
+int f2fs_do_read_inline_data(struct folio *folio, struct folio *ifolio)
 {
 	struct inode *inode = folio->mapping->host;
+	unsigned int len = min_t(loff_t, i_size_read(inode),
+				 f2fs_max_inline_data(inode));
 
 	if (folio_test_uptodate(folio))
-		return;
+		return 0;
 
 	f2fs_bug_on(F2FS_I_SB(inode), folio->index);
 
-	folio_zero_segment(folio, MAX_INLINE_DATA(inode), folio_size(folio));
+	if (f2fs_uses_encrypted_inline_data(inode)) {
+		struct page *tmp_page;
+		void *kaddr;
+		int err;
+
+		folio_zero_segment(folio, 0, folio_size(folio));
+
+		/*
+		 * Decrypt through a temporary page because inline data occupies
+		 * only a byte range inside the inode folio.
+		 */
+		tmp_page = alloc_page(GFP_NOFS | __GFP_ZERO);
+		if (!tmp_page)
+			return -ENOMEM;
+
+		len = round_up(len, FSCRYPT_CONTENTS_ALIGNMENT);
+		if (len) {
+			err = fscrypt_prepare_data_unit_inplace(inode);
+			if (err) {
+				__free_page(tmp_page);
+				return err;
+			}
+			memcpy_to_page(tmp_page, 0, inline_data_addr(inode, ifolio),
+				       len);
+			err = fscrypt_crypt_data_unit_inplace(inode, tmp_page,
+							      len, 0, 0,
+							      false);
+			if (err) {
+				__free_page(tmp_page);
+				return err;
+			}
+		}
 
-	/* Copy the whole inline data block */
-	memcpy_to_folio(folio, 0, inline_data_addr(inode, ifolio),
-		       MAX_INLINE_DATA(inode));
+		kaddr = kmap_local_page(tmp_page);
+		memcpy_to_folio(folio, 0, kaddr,
+				min_t(loff_t, i_size_read(inode),
+				      f2fs_max_inline_data(inode)));
+		kunmap_local(kaddr);
+		__free_page(tmp_page);
+	} else {
+		folio_zero_segment(folio, MAX_INLINE_DATA(inode),
+				   folio_size(folio));
+		/* Copy the whole inline data block */
+		memcpy_to_folio(folio, 0, inline_data_addr(inode, ifolio),
+				MAX_INLINE_DATA(inode));
+	}
 	if (!folio_test_uptodate(folio))
 		folio_mark_uptodate(folio);
+	return 0;
 }
 
 void f2fs_truncate_inline_inode(struct inode *inode, struct folio *ifolio,
@@ -119,6 +168,7 @@ void f2fs_truncate_inline_inode(struct inode *inode, struct folio *ifolio,
 int f2fs_read_inline_data(struct inode *inode, struct folio *folio)
 {
 	struct folio *ifolio;
+	int ret = 0;
 
 	ifolio = f2fs_get_inode_folio(F2FS_I_SB(inode), inode->i_ino);
 	if (IS_ERR(ifolio)) {
@@ -134,7 +184,13 @@ int f2fs_read_inline_data(struct inode *inode, struct folio *folio)
 	if (folio->index)
 		folio_zero_segment(folio, 0, folio_size(folio));
 	else
-		f2fs_do_read_inline_data(folio, ifolio);
+		ret = f2fs_do_read_inline_data(folio, ifolio);
+
+	if (!folio->index && ret) {
+		f2fs_folio_put(ifolio, true);
+		folio_unlock(folio);
+		return ret;
+	}
 
 	if (!folio_test_uptodate(folio))
 		folio_mark_uptodate(folio);
@@ -186,7 +242,12 @@ int f2fs_convert_inline_folio(struct dnode_of_data *dn, struct folio *folio)
 
 	f2fs_bug_on(F2FS_F_SB(folio), folio_test_writeback(folio));
 
-	f2fs_do_read_inline_data(folio, dn->inode_folio);
+	err = f2fs_do_read_inline_data(folio, dn->inode_folio);
+	if (err) {
+		f2fs_truncate_data_blocks_range(dn, 1);
+		f2fs_put_dnode(dn);
+		return err;
+	}
 	folio_mark_dirty(folio);
 
 	/* clear dirty state */
@@ -267,6 +328,8 @@ int f2fs_write_inline_data(struct inode *inode, struct folio *folio)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct folio *ifolio;
+	void *inline_addr;
+	int err = 0;
 
 	ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
 	if (IS_ERR(ifolio))
@@ -280,8 +343,50 @@ int f2fs_write_inline_data(struct inode *inode, struct folio *folio)
 	f2fs_bug_on(F2FS_I_SB(inode), folio->index);
 
 	f2fs_folio_wait_writeback(ifolio, NODE, true, true);
-	memcpy_from_folio(inline_data_addr(inode, ifolio),
-			 folio, 0, MAX_INLINE_DATA(inode));
+	inline_addr = inline_data_addr(inode, ifolio);
+
+	if (f2fs_uses_encrypted_inline_data(inode)) {
+		struct page *tmp_page;
+		void *kaddr;
+		unsigned int len = min_t(loff_t, i_size_read(inode),
+					 f2fs_max_inline_data(inode));
+
+		tmp_page = alloc_page(GFP_NOFS | __GFP_ZERO);
+		if (!tmp_page) {
+			err = -ENOMEM;
+			goto out;
+		}
+
+		len = round_up(len, FSCRYPT_CONTENTS_ALIGNMENT);
+		if (len) {
+			err = fscrypt_prepare_data_unit_inplace(inode);
+			if (err) {
+				__free_page(tmp_page);
+				goto out;
+			}
+			kaddr = kmap_local_page(tmp_page);
+			memcpy_from_folio(kaddr, folio, 0,
+					  min_t(loff_t, i_size_read(inode),
+						f2fs_max_inline_data(inode)));
+			kunmap_local(kaddr);
+			err = fscrypt_crypt_data_unit_inplace(inode, tmp_page,
+							      len, 0, 0,
+							      true);
+		}
+		if (!err) {
+			memset(inline_addr, 0, MAX_INLINE_DATA(inode));
+			if (len) {
+				kaddr = kmap_local_page(tmp_page);
+				memcpy(inline_addr, kaddr, len);
+				kunmap_local(kaddr);
+			}
+		}
+		__free_page(tmp_page);
+		if (err)
+			goto out;
+	} else {
+		memcpy_from_folio(inline_addr, folio, 0, MAX_INLINE_DATA(inode));
+	}
 	folio_mark_dirty(ifolio);
 
 	f2fs_clear_page_cache_dirty_tag(folio);
@@ -290,8 +395,9 @@ int f2fs_write_inline_data(struct inode *inode, struct folio *folio)
 	set_inode_flag(inode, FI_DATA_EXIST);
 
 	folio_clear_f2fs_inline(ifolio);
+out:
 	f2fs_folio_put(ifolio, true);
-	return 0;
+	return err;
 }
 
 int f2fs_recover_inline_data(struct inode *inode, struct folio *nfolio)
@@ -826,7 +932,7 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 			return PTR_ERR(ifolio);
 		f2fs_folio_wait_writeback(ifolio, NODE, true, true);
 	}
-	ilen = min_t(size_t, MAX_INLINE_DATA(inode), i_size_read(inode));
+	ilen = min_t(size_t, f2fs_max_inline_data(inode), i_size_read(inode));
 	if (start >= ilen)
 		goto out;
 	if (start + len < ilen)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index c6afdbd6e1cd..9eddcde7939c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1549,6 +1549,18 @@ static int f2fs_check_opt_consistency(struct fs_context *fc,
 		return -EINVAL;
 	}
 
+	if (f2fs_sb_has_encrypted_inline_data(sbi)) {
+		if (!IS_ENABLED(CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA)) {
+			f2fs_err(sbi,
+				 "encrypted_inline_data requires CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA");
+			return -EINVAL;
+		}
+		if (!f2fs_sb_has_encrypt(sbi)) {
+			f2fs_err(sbi, "encrypted inline_data requires encryption feature");
+			return -EINVAL;
+		}
+	}
+
 	/*
 	 * The BLKZONED feature indicates that the drive was formatted with
 	 * zone alignment optimization. This is optional for host-aware
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 665687244c93..600eaee75926 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1399,6 +1399,9 @@ F2FS_FEATURE_RO_ATTR(pin_file);
 F2FS_FEATURE_RO_ATTR(linear_lookup);
 #endif
 F2FS_FEATURE_RO_ATTR(packed_ssa);
+#ifdef CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA
+F2FS_FEATURE_RO_ATTR(encrypted_inline_data);
+#endif
 F2FS_FEATURE_RO_ATTR(fserror);
 
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
@@ -1567,6 +1570,9 @@ static struct attribute *f2fs_feat_attrs[] = {
 	BASE_ATTR_LIST(linear_lookup),
 #endif
 	BASE_ATTR_LIST(packed_ssa),
+#ifdef CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA
+	BASE_ATTR_LIST(encrypted_inline_data),
+#endif
 	BASE_ATTR_LIST(fserror),
 	NULL,
 };
@@ -1604,6 +1610,7 @@ F2FS_SB_FEATURE_RO_ATTR(compression, COMPRESSION);
 F2FS_SB_FEATURE_RO_ATTR(readonly, RO);
 F2FS_SB_FEATURE_RO_ATTR(device_alias, DEVICE_ALIAS);
 F2FS_SB_FEATURE_RO_ATTR(packed_ssa, PACKED_SSA);
+F2FS_SB_FEATURE_RO_ATTR(encrypted_inline_data, ENCRYPTED_INLINE_DATA);
 
 static struct attribute *f2fs_sb_feat_attrs[] = {
 	ATTR_LIST(sb_encryption),
@@ -1622,6 +1629,7 @@ static struct attribute *f2fs_sb_feat_attrs[] = {
 	ATTR_LIST(sb_readonly),
 	ATTR_LIST(sb_device_alias),
 	ATTR_LIST(sb_packed_ssa),
+	ATTR_LIST(sb_encrypted_inline_data),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs_sb_feat);
-- 
2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
