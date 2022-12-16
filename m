Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CDA64F1D7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Dec 2022 20:33:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p6GSQ-0004bj-U4;
	Fri, 16 Dec 2022 19:33:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p6GSP-0004bb-FB
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Dec 2022 19:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j/9WZav7ZU957WNBB3ibkb0M+GQK4mTSrY1WJh8+is4=; b=Wde/Vi1UOQX4PQEn6s7WRd/Rrx
 U57NpRjBKZd075UrfEPMKFHF8ZkLt226EycRRFv1RkSQnaj3i5A/d24X0ui2IB6QNohlBUnfULVK3
 ljw7sWd6Otacv0xINAQ7Ra/ZcMPoRoWGut/Cv8EsROxNQtJYuan0dmrL60/Nvd+i9Xnk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j/9WZav7ZU957WNBB3ibkb0M+GQK4mTSrY1WJh8+is4=; b=b4u9nuzURrvjOQKQgNs3KQX+a5
 RpfFKwfo1uzPJ1Oh5yxiuQkyB4+h6/M8cmyu2EgPi3ekBIjtkSsw0QDPW4+11feYnXhFSfPysfVxy
 lv96sMMmPJnKcZ5a/++E+gwok/kUelQF7fnyvuMr7khVFJptoomZ6rSIqvKLzMmwtNa0=;
Received: from mail-tyzapc01on2111.outbound.protection.outlook.com
 ([40.107.117.111] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p6GSB-0002zI-Ag for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Dec 2022 19:33:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKRiAZOTpC/N+Awibn2YzzG/dTV0OAgcfUePOFhSh7oDFV63fGxE16GDx9SC7r4pFKEP35TXPMHnIJzfVHfnaZ9G8OKTDFIX6ssIA5tAh3KwPWlYj+SE6BS371//3OZ/S6cZBIKAJnGmeLUHo7eenSGSkLKuy9vMMA8Dzgi3c789obXFS86bf4Fv8JUQOgu+3QShfgErZj7QI2w7Yc3oqWy1yXTpmwmoWqsnMMosDzf9/GmhfiuFH6bQpikJs3M5N/A4o1Nr3yfwaArCPaAWOivSE3pey48dcyqt+3uddMTo9JiAT7yBG9Fk+oBRnTFY1Zqlkd0jVWlZ+mKGxP9ERA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/9WZav7ZU957WNBB3ibkb0M+GQK4mTSrY1WJh8+is4=;
 b=TiJDPHpgSnQXbqfDtmG7NvDIsDwzxvh3Nx1Izy8dYDL1q4KCUbU5kz3hjFP0yBuxvUmmP5LBOAzPWNHHkqvS+waiiAM5uRsf6+64oib52P7/rX+mWmXF+h4TiABvDiGVn7An7Z9nenr62t43MlBhWBeeM+nJRfxmojCK1bUlmFIpR6+yIkE6f3ym0pSlhidlwz9abL0y83DzODRiKGUbBJdqRypxGw93uZtmujIxzBANZQzEzXlxvhat21HgilS5JL9qz/ls+9ip4J2S6vgluVbTYk0tQzk5mYn4CDRv85XFSJ8hfU46xECQ12fvzW+YS7odwJ/+N4ez9kK5SNV3gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/9WZav7ZU957WNBB3ibkb0M+GQK4mTSrY1WJh8+is4=;
 b=ltdBw9pXFfK/MRBfwvSaaircq+p6JVAUwvG9LNSLCRBX5h4dpiR4D7a3+dO+gQmrrX9+9GSDjYFztad9hHGCLdca6o3A37p61G9Tp/RQffT4E52m/93uZzTOTJKKsxJQR0Rg6MN5Y7NIoWjOV9GdBKKUNn+ZbhPpUGmazwBPUuB9nZqTG6wpN7gJpu/0xoRClYOxmnQvauDfizy00v+HmmxX1F0RQ4GQw3DYwUPUsXGiv5TkWY6OTPcqZxIBuYsi9KYqFuvjspJwRJhLNy/N2neIf7VLxmq9+YjMhwb9Ie1EiquUp55pz8WaNV7nUeCHs1zn7yO67QEKQ8YK50Rh+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB5243.apcprd06.prod.outlook.com (2603:1096:4:1e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Fri, 16 Dec
 2022 19:32:57 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5924.011; Fri, 16 Dec 2022
 19:32:57 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 17 Dec 2022 03:32:48 +0800
Message-Id: <20221216193248.71333-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <a2c286e1-470f-ff83-196a-f7ea490096ff@kernel.org>
References: <a2c286e1-470f-ff83-196a-f7ea490096ff@kernel.org>
X-ClientProxiedBy: SG2PR02CA0103.apcprd02.prod.outlook.com
 (2603:1096:4:92::19) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB5243:EE_
X-MS-Office365-Filtering-Correlation-Id: 95514d97-69cb-4e2f-b98c-08dadf9c55a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o89ytYmCilWlPx4Hs1h8D+s2IXMQaCJfmdheJT4RVT6JUHALgQEWoWV2cPnP9m8hynLZNa/zWDJIczHvkDC9+RrmWEWpgezfMTbEmo9RGkfOZ3CeAzIGjEG8h5LQwItbhDbtkzg5W+4FZFqvLT46PqmOJqdZJtXzr8kxqGAmp5v4XkVfipOlrESlKkJFNnsQeYpF12Xqq+G8zHi7+RTRa3UlmQPcv01u+61by0REZGkXDB2HTYIFNjmvoaPy57BiVBnVCw9p5Dw86JtKrBv70GQv7ih5e/qZkisJ4Xat9Rucf9oOiEn0xb3W4AJvfuRr43aJ+nJXBkuAxOB6YXVwelm8oMJ8lCPRVzasJSxRPPs/BuA8tEt4X5A3hMbyySr676cr2BkcAc0TSVQ7JZmnACdhDn6DC+iLYPJgh3p01BsgBkG48CjFxCd2TQnw2ze8yq1LRvetL1AjmcWHmSo5ZKICkDfKjZIHLks0kLm1ijkfql3wIwnZn2ChmD86CQUXDAC6vxk/OObUVbS92gx9o1vzGf84cGyXuo/Jbkar37EC9uYMyj4khaeQriBUJxcBTgRGt+EvsnYWG1SZo0BaaAxAkcNAyvYjse1+bKPMoHljCUfVVlzWaYyVSO4dlqeiIPD2CI++TsKrvopLO+OzvghwWf4fsSgw5xJj+oisi6FsUPUaI7r73yA7dJBzfgi1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(451199015)(8936002)(6666004)(86362001)(478600001)(41300700001)(36756003)(186003)(66946007)(2616005)(1076003)(6512007)(8676002)(66476007)(4326008)(66556008)(316002)(5660300002)(6506007)(6486002)(52116002)(26005)(2906002)(83380400001)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uCLvDdsa0w9sIW7JrAUpUtMyg9aLmzqnM0n7G3rIZBJE1SeWz3hnhpQ7cHWH?=
 =?us-ascii?Q?DtjX8Eh7VVzQitCC0odN9mWD3v9vjxEQTWTtRX59CLWLQ9CaunNc8cK0LUnf?=
 =?us-ascii?Q?UZEBRla+6EyAVXA8VV3Ipa3Mg8fN2RUX9aDff0xTSGrlaKkxoJkRhdtBawdC?=
 =?us-ascii?Q?zIAcGNQiZGlThQfqprJ1tqaIr0rdCkganpKkGQBus7UNG9IJcdKjX9I/RfdN?=
 =?us-ascii?Q?aLYCiN2ZzjTyR1095kC38jc0Gtv/qqokqiB7x6sdNiER6L8VYOMqnyRA7y4n?=
 =?us-ascii?Q?jYSpYB81QskmNep0EkDFGMsyzOKT2ydJ4X/8/QaDYYC9PeHLbjq2pCIuMMex?=
 =?us-ascii?Q?SAbVffPve6PLgq4V5xWhbkyAE3ou8VSWEgp1Z3quGrqapioYDxaXzrgAwZ2f?=
 =?us-ascii?Q?xj9LvYQ07z+z08CWFCQiQr9iESjg4qSQCfy7RM7xgKPYS9kHmj1Bk/zIgNRX?=
 =?us-ascii?Q?VbTnukRf6QddaWp7t7USS30LW0rMLV8TzeyJUsf+bMTYbx2C8UC0MeLRE9ek?=
 =?us-ascii?Q?fLbPJQ5/SZxc81neVEreIIieUixqSy7OZT/lp7m0WaDJiGRtJVVZkMfu+hRL?=
 =?us-ascii?Q?FqLUnY7PfObCS2BFWc92hvvHOu7L/mWHBYM3suXbdRHDXGEqOJpc4eLBKzas?=
 =?us-ascii?Q?oW5ArSphLEJZdgloGaFjSpCH02gv28YPTN3PWrSI1oWmt/1PgReYpbU2+XBE?=
 =?us-ascii?Q?ynEI/SwpKPsfP/I7GQ7Am0QARJ2MVY39w7wjC5Z4Tf4zQ7tmluPC44Tv6Qq6?=
 =?us-ascii?Q?7w2TAmICiOjYKc1CHhVN3I6xjIIJ+DsBdn/55lQtIwzmH5Pz15QflkX0CGiE?=
 =?us-ascii?Q?cYr7S434/INz1ZdKbEBkUzdICdHnrBIVPuBN2SoNsiFpzxiyZwa9AqAj6+w2?=
 =?us-ascii?Q?8N+Yhh1iOuNUsnNP1qxcpZeTAtWbU2j7Qk10o/euWYS6gVRjzs2qU0ZTngLl?=
 =?us-ascii?Q?/mSCRbc8w3GEgDz313kFxTuUDgRqrJbV6JtnF6Zsj8EJa7SjMsYVh40my8cM?=
 =?us-ascii?Q?QDmbywqPc9qe1r99TlwCl0wzZhghsPzXePDrYMVj70XXZ0IScPyt8G3Sx2LN?=
 =?us-ascii?Q?VmU7ziROfzYS1OeglGHhI8ODoQ6Osabvwsf5of/H3lSp8L5U3GDIgEUA/Q8d?=
 =?us-ascii?Q?6kyDfbIMoWPVLwReaPQFK2CNQ3RqJ5GBROEiATGu+mng0W8NU/9l9MIzRGPN?=
 =?us-ascii?Q?urfXxc5kVRrj1IAgkLeLiXnplnN5lfVgG7PYZI8Ih4qcBhqWpfRGxnsQq5zI?=
 =?us-ascii?Q?ttCbPw4RhFnmt83oorP//fJ/k0tZ/SmjXEdtgpA04dEgQaN3VnGh48dxevc/?=
 =?us-ascii?Q?9KuOn1JjauveTM25rD+1T9CuyGE7Z+LsvUYvpiScOFb6ZNARXob5H2UW/EG7?=
 =?us-ascii?Q?K/BKxmoT86Wyt+q+Z+13jf9OiTyX7diLbDbFUIBvwMYmvWufRjyyKWzmUTdT?=
 =?us-ascii?Q?SKoa9S/YrXv/dfTXSUWIg86WL+AXyYronLAKyH+R7o1UsKjiwcttRyJunRET?=
 =?us-ascii?Q?yhbNI4wXXKnP+NkWjJwlRy2vsHVvFgAnmVmNoKRA3E4AEVXsURLeq+ggbF12?=
 =?us-ascii?Q?49iNsbkN85iuPWSqeT66bXCg2lWS9f38nQq0Xrg0?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95514d97-69cb-4e2f-b98c-08dadf9c55a5
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 19:32:57.3037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNk3JeB4I/DRSPysmsJesmGI7drnu8aPFyJbUJ+tnH1y72D3p/Y+2nENgQvnBqP5hSTXgbx2Q/0M5yYmSpDw1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5243
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao,
 > After moving f2fs_show_injection_info() core functionality
 into time_to_inject(), > __builtin_return_address(0) result changes from
 return address of caller of > f2fs_show_injection_info() to return [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.111 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.111 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1p6GSB-0002zI-Ag
Subject: Re: [f2fs-dev] [PATCH] f2fs: merge f2fs_show_injection_info() into
 time_to_inject()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

> After moving f2fs_show_injection_info() core functionality into time_to_inject(),
> __builtin_return_address(0) result changes from return address of caller of
> f2fs_show_injection_info() to return address of time_to_inject().

It seems you are wrong, and the original patch didn't change the logic here.
Because time_to_inject is an inline function, __builtin_return_address(0)
has not return address of time_to_inject().

My test:

(1). w/ below patch, we found that the value of __builtin_return_address(0) in
	__time_to_inject() is the same as that in f2fs_show_injection_info().

# mount -t f2fs -o fault_type=0xffff,fault_injection=1 /mnt/9p/f2fs.img /mnt/f2fs
[   19.739661] loop0: detected capacity change from 0 to 2097152
[   19.749759]  new F2FS-fs (loop0) : inject kmalloc in f2fs_kmalloc of f2fs_fill_super+0x7eb/0x1780
[   19.750313] raw F2FS-fs (loop0) : inject kmalloc in f2fs_kmalloc of f2fs_fill_super+0x7eb/0x1780
mount: mounting /dev/loop0 on /mnt/f2fs failed: Cannot allocate memory

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4035dab1f570..1e5030633f4d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1876,11 +1876,13 @@ struct f2fs_sb_info {

 #ifdef CONFIG_F2FS_FAULT_INJECTION
 #define f2fs_show_injection_info(sbi, type)                                    \
-       printk_ratelimited("%sF2FS-fs (%s) : inject %s in %s of %pS\n", \
+       printk_ratelimited("%sraw F2FS-fs (%s) : inject %s in %s of %pS\n",     \
                KERN_INFO, sbi->sb->s_id,                               \
                f2fs_fault_name[type],                                  \
                __func__, __builtin_return_address(0))
-static inline bool time_to_inject(struct f2fs_sb_info *sbi, int type)
+
+#define time_to_inject(sbi, type) __time_to_inject(sbi, type, __func__)
+static inline bool __time_to_inject(struct f2fs_sb_info *sbi, int type, const char *func_name)
 {
        struct f2fs_fault_info *ffi = &F2FS_OPTION(sbi).fault_info;

@@ -1893,6 +1895,10 @@ static inline bool time_to_inject(struct f2fs_sb_info *sbi, int type)
        atomic_inc(&ffi->inject_ops);
        if (atomic_read(&ffi->inject_ops) >= ffi->inject_rate) {
                atomic_set(&ffi->inject_ops, 0);
+               printk_ratelimited("%s new F2FS-fs (%s) : inject %s in %s of %pS\n",
+                       KERN_INFO, sbi->sb->s_id,
+                       f2fs_fault_name[type],
+                       func_name, __builtin_return_address(0));
                return true;
        }
        return false;

(2). w/ below patch(remove inline form __time_to_inject()), we found that the value of
	__builtin_return_address(0) in __time_to_inject() is different from that in
	f2fs_show_injection_info().

# mount -t f2fs -o fault_type=0xffff,fault_injection=1 /mnt/9p/f2fs.img /mnt/f2fs
[   81.019451] loop0: detected capacity change from 0 to 2097152
[   81.031058]  new F2FS-fs (loop0) : inject kmalloc in f2fs_kmalloc of f2fs_init_write_merge_io+0x35/0x1c0
[   81.031745] raw F2FS-fs (loop0) : inject kmalloc in f2fs_kmalloc of f2fs_fill_super+0x7eb/0x1710
mount: mounting /dev/loop0 on /mnt/f2fs failed: Cannot allocate memory

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4035dab1f570..f15001b5d73b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1876,11 +1876,13 @@ struct f2fs_sb_info {

 #ifdef CONFIG_F2FS_FAULT_INJECTION
 #define f2fs_show_injection_info(sbi, type)                                    \
-       printk_ratelimited("%sF2FS-fs (%s) : inject %s in %s of %pS\n", \
+       printk_ratelimited("%sraw F2FS-fs (%s) : inject %s in %s of %pS\n",     \
                KERN_INFO, sbi->sb->s_id,                               \
                f2fs_fault_name[type],                                  \
                __func__, __builtin_return_address(0))
-static inline bool time_to_inject(struct f2fs_sb_info *sbi, int type)
+
+#define time_to_inject(sbi, type) __time_to_inject(sbi, type, __func__)
+static bool __time_to_inject(struct f2fs_sb_info *sbi, int type, const char *func_name)
 {
        struct f2fs_fault_info *ffi = &F2FS_OPTION(sbi).fault_info;

@@ -1893,6 +1895,10 @@ static inline bool time_to_inject(struct f2fs_sb_info *sbi, int type)
        atomic_inc(&ffi->inject_ops);
        if (atomic_read(&ffi->inject_ops) >= ffi->inject_rate) {
                atomic_set(&ffi->inject_ops, 0);
+               printk_ratelimited("%s new F2FS-fs (%s) : inject %s in %s of %pS\n",
+                       KERN_INFO, sbi->sb->s_id,
+                       f2fs_fault_name[type],
+                       func_name, __builtin_return_address(0));
                return true;
        }
        return false;

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
