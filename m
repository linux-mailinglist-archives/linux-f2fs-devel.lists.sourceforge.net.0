Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF7D418EE6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Sep 2021 08:09:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GEI0yNYhBJ7EdBJ6Qj9D5Xc/2gszzklfnHWG2OijMEs=; b=dxzhp3OwJO7jAVErcI2kYh5mh5
	+cKwikG9j6bSggxzjVpKCf6vk7Ts0tMtAO72S1oKM+LAETtib9qU8B6txC6Emso2EEPoaT+fB1U4C
	5zvcqCuZYEx1P9iRXpM8NWLwQp7b6TIsRZasr9fheXBC0W4jPpjs2F24Crw5r2sXkano=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mUjpY-0005dK-7A; Mon, 27 Sep 2021 06:09:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1mUjpW-0005dC-64
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Sep 2021 06:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w2+eARkMB17D7Sgzd8IRFyyKUzpi14h9YLK6xPLuV34=; b=er+ptGBL8Sry09qsBh6f/idDjT
 bD2wQGiYJ8q+F9/NWbEyaj0Z0ljmes4kjiqPhciYmzroRq2AT1Z4QXwoVUO9+jYpG1RQ7DKNWaAZx
 RwkX6m7Xjs67nSWztqh//90k1kymfTR+xKChHRmjlTBnJegHitPrjbozqT8R06dgmhpc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=w2+eARkMB17D7Sgzd8IRFyyKUzpi14h9YLK6xPLuV34=; b=b
 p7hqF+WaTFO4LFhWAu1zpMKNAx0Rx+MN49KMithOoYmuIsTFQXEF05BHDWpXncwnt1gHd4QlTfd0L
 crIWXaxQhKNqyQtrSfUjDyGQFqZRi4NRmhVjKfPCX6d4qAbpauRWJ5nVVPM55ZEH+JlOdeeD03c1c
 LyCL+kK6iQ6in3Kw=;
Received: from mail-eopbgr1310115.outbound.protection.outlook.com
 ([40.107.131.115] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mUjpO-0003w9-SE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Sep 2021 06:09:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBjByKzxPu4gIRrOcJ+aYw/75x7pMc1gd0SK8srUJUztjS2QwnUsnSeKr8nUsfjjr/o8xenJqkczz63oWRJranz5JJUejavh2M1D9MelcTWS//Q4UXm6EPkYI9XUh6NVorUiKEt4/lXTVTqAgy60VIxATxPvX1HpN3vrtMIGK39MV+LsYnRZMhLqWxJeTS2m5ks5k6+WpIwViSl4sFV6YFEnLmDWbeA2r6Kpz7/jhADoyPxwy9EfBXzVCiO518bRn+QDs+wQqdL8KyikPeVdCKKdrrj5mrB3BCMTHptvKSQ9DBV9HKAc3skFR/Cx640xRCoTS4E9GBxDe4dBQqFn1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=w2+eARkMB17D7Sgzd8IRFyyKUzpi14h9YLK6xPLuV34=;
 b=eiwQk2Du2sGoaax+b0LOlTOq9i0rMvWMcmhrB3vsfPUMlhFCsc9UnGCzE+azP8C1Putz//61xhWPHlKOxIUQkh/3g1Y7IZt5m/AYoYe6fzSYBG3nhSQnWeFLOg3h5CB9BuyU6bvXVhDi1F4yT/Fm2Wpcwf4B99jTlH8E0g+6fWN7TKb5Wy5gFtM4nevUU0piCfI7i5HpYTkUYIeAby4joHGEJ+3o/p+wtEFmrf0uYXJSfE50jqmUUQhQb2Vnoh7KkLjRNWCLw/+7h3OkmpAJG+Q3w7SJkeO+6WVy6ECq17C1oip8OABubTYWyyLna9zSF++pP295+fDcpBcL0DYxzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2+eARkMB17D7Sgzd8IRFyyKUzpi14h9YLK6xPLuV34=;
 b=OaJg7FsaORBOmFYXgicvwn/QBlKM8d0Hr0/+kzaQTl1mX4OiJQUykKVcvfU6vCpYzOnp17y9WD029qA+1UMAqakzXM4kiT1CWWDW+vjcsiO+eCr9vqAt7DPWSdyfoP7Wvir/Ezu16Im5k38IURpOabRWcCtDRjIFqY7+G13E1IU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB4116.apcprd06.prod.outlook.com (2603:1096:820:2b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 06:09:16 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fcd1:f2b4:cfa6:6970]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fcd1:f2b4:cfa6:6970%8]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 06:09:16 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 27 Sep 2021 14:09:05 +0800
Message-Id: <20210927060905.68318-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: HK2PR0401CA0018.apcprd04.prod.outlook.com
 (2603:1096:202:2::28) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 HK2PR0401CA0018.apcprd04.prod.outlook.com (2603:1096:202:2::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4544.13 via Frontend
 Transport; Mon, 27 Sep 2021 06:09:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3c3c1a2-c975-472b-cce8-08d9817d5542
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4116:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <KL1PR0601MB411659F2338570E31E06BA91BBA79@KL1PR0601MB4116.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:221;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kex3bIyVu3qZFkoWTekpLqtwqmDQf+wGZvcs/HOqQqNmL9VZTJnRscREdJX8l5F/XmE3ckFv+5z8XD7VFRiIss3igsMvZjbC4CPBbqAwlkd7OK5+RvG4VMNnOTU+hVOzh6rsvQXbWYkfYtt1QBoFiHSN2Y/AtdJO2xpboTIIxGP6aaPDLJQu9c/rE1IjbfU+r+h97cgmahKy7MtEqrxjgYqIiDbjfEnCXhZzDWNwMpmZss9B6nU+N6OyNp82tuA2NBR/mdu+v8xbpgtDRhHlFNjs6yhew/Yx26SQC3txJ7/wgNy2SGB45rqAeM6c9Op2ckn1/S9ZwylQsRk9vk5lsoPpZt+gLH7+KBZKYr7HHBDSbecBuhw1735c6p8U67Y201iMvGEvR7ZZ5XMrduI8zqbrGH9OllNCk8V/PwGwpHCvzhjNzw1zllz29RSFcixKcvEKzH8g7YrQ9z4Vp1a2A8DSxljwIQLCqq/B1VjyLdGPXPqbV3p94a9TXRZ2ntiTVex4eetRz6jDVZzL0sHrvyZz6mjqFWO5oruStYT2U50P9397/4QPXfMPdElk625TDYtnjnO8r8yxVZ0z/e4hVGXWCBOzChIkwajd/nb1qg0XvFxH1ujeeLTUcayIa5qIq3o3tNtOOXQxR0Eq7EQf1pMoZUxAKcgai4uTU88aOdAg/E4fIRC2avMu0XBJX6u6HfZBsheA3AHgx9I0GLxnANX92WcqnuzMhEtxDz/Z7Hs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(66556008)(508600001)(186003)(36756003)(6506007)(8676002)(2906002)(54906003)(956004)(38100700002)(38350700002)(6486002)(8936002)(316002)(2616005)(83380400001)(1076003)(52116002)(4744005)(66476007)(6666004)(6512007)(5660300002)(26005)(86362001)(4326008)(66946007)(4730100016);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xhkZYrhaDanLZeCMIt0iZ7nQUeFTQk2Z3Y1ICynNcvccTO7GlwvuBbq4CXWC?=
 =?us-ascii?Q?aTyfvrwRFzze9U8ZRsEYZk6AvkxcQEvJnzN3egwsiblhHW9cY9bssvOjr0Xn?=
 =?us-ascii?Q?uxAidi8vMF3qizGCxfmNnws8cYP/X2E9lTuSzvH+k5wIO3Rgxe+XRC30TB8h?=
 =?us-ascii?Q?4CIcvUpIyTd2rO0mOJ3FEFFgQxelMwwsfQwe930F0H8McrvPJ2drpI6QdCQs?=
 =?us-ascii?Q?p9neEhGC3EbIxe7rZJm0VhzaauCe71LbDlLp55K5hWh5pJUqLnSDrEeuYTWy?=
 =?us-ascii?Q?cT/pCeOdNTqd1lJsuLBu/dS5Q61ptsbraNXa5vvYXn1AXLoiF4n1cyC5cfVp?=
 =?us-ascii?Q?SJdLencHLvuTt8e0G1XHN74Lwc4TZhvOkpXojb+dQvzPhO94C6c7DaYZui4Y?=
 =?us-ascii?Q?TC93TLVw0kbxBiEm5A20kHGox8cYntjO14R1D3dyZgZajhI335IhXQyNSeHc?=
 =?us-ascii?Q?CkY7r53McJ7ydN82A5JdpmCmExpnZw+Fjfl+m5hiBjnJQpIhFGtr0bSsrp1F?=
 =?us-ascii?Q?0JLbD4cacu7S0uCYq7TUc2288GEHvFL9EUWxYN78g6jaAe93iz4qu6Xg+Byk?=
 =?us-ascii?Q?fDD0lSeIZXyKwP/uNQTvvoypCz0XhWSt0PaN3LvbI90E/ajnwWFdau6pJ5B0?=
 =?us-ascii?Q?cqQP+QRHe3hxcBLdlP6a4QjizCddTrdy9atSLobvyotomRFBSlZ9wJfpwZCq?=
 =?us-ascii?Q?QHy4qJpJVffEKpIhMVCcYA8TccqhX/118gYqOD+sqZT+Fp5EvLbaGsUyYOKg?=
 =?us-ascii?Q?urj/YB25vAOzUPDtdUebf5WJGIjuiXt7bslPufWNJ4de8DTDe8KzRaVfu3aI?=
 =?us-ascii?Q?2GytU87P678qwaAMmrohf4FU+Mk0Mc97AJXc+wOBEqur5gAHOrebJz7HeUp+?=
 =?us-ascii?Q?adl41eqyW47+DLpRJM1XAxfTii60SR+3K4DCrr7XdoHTGj+tHnUD/r3I13Rs?=
 =?us-ascii?Q?XLRmNR5xmJwHI3oQW90SbZNUWMWGWyA3swii3xbyoshX65ICUC2S/ZVHx539?=
 =?us-ascii?Q?f9eWIKaI7uH0lENQs3AfI6/vIZ8sDttXTpOenz+lpef2SMrQfjfWYNlf+mvb?=
 =?us-ascii?Q?iVVxmPHE0Fdwh7GeV3TBqCbWJnI6DEmfp347dEx9qMROJ3e2QZASskM2Ngy2?=
 =?us-ascii?Q?e8os7tEGix2uYkke0SPW4c8jUMN84pJVM4GVWI3gvPufoAoqmBijHh84gi4f?=
 =?us-ascii?Q?NnlYUEpnYt8KyUmcu1qGUdgTT0Bw22YpArHjLV+OMjVsx0DcfuXuaKngopp5?=
 =?us-ascii?Q?FixKg0FAUWgtIVzlSjBgPWxgve774PiQLhr9Cz+mNIEJna5uW6eHeQEUQzmn?=
 =?us-ascii?Q?5O/IXL+d5h/y7XzHUTBP+1ZW?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c3c1a2-c975-472b-cce8-08d9817d5542
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 06:09:15.6806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qB3PahScJ5EQ/iT2Owg6pxwQurL+ygq9g6XTrT+PhRcUgygvpX8Xw4SEHUs2I9nQh7HsDuc1u1EcTMCPNjIdrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4116
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When mount with whint_mode option, it doesn't work, Fix it.
 Fixes: d0b9e42ab615 (f2fs: introduce inmem curseg) Reported-by: tanghuan
 <tanghuan@vivo.com> Signed-off-by: Fengnan Chang <changfengnan@vivo.com> ---
 fs/f2fs/super.c | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.131.115 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.131.115 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mUjpO-0003w9-SE
Subject: [f2fs-dev] [PATCH] f2fs: fix whint_mode mount option error
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
From: Fengnan Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Fengnan Chang <changfengnan@vivo.com>
Cc: tanghuan <tanghuan@vivo.com>, Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When mount with whint_mode option, it doesn't work, Fix it.
Fixes: d0b9e42ab615 (f2fs: introduce inmem curseg)

Reported-by: tanghuan <tanghuan@vivo.com>
Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 78ebc306ee2b..86eeb019cc52 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1292,7 +1292,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 	/* Not pass down write hints if the number of active logs is lesser
 	 * than NR_CURSEG_PERSIST_TYPE.
 	 */
-	if (F2FS_OPTION(sbi).active_logs != NR_CURSEG_TYPE)
+	if (F2FS_OPTION(sbi).active_logs != NR_CURSEG_PERSIST_TYPE)
 		F2FS_OPTION(sbi).whint_mode = WHINT_MODE_OFF;
 
 	if (f2fs_sb_has_readonly(sbi) && !f2fs_readonly(sbi->sb)) {
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
