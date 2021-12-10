Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D01E846F976
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Dec 2021 04:08:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mvWGx-0003DU-Bb; Fri, 10 Dec 2021 03:08:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mvWGw-0003DN-2n
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Dec 2021 03:08:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ul/HOc9DIv7cjUZUG6mWZ6mGzqzvKerOyBpjsEsBh+c=; b=TqqpqNeW4/g8EXMARyq85xBZno
 Clw3/Cdmrcasg4GIxCdCjfxoMTQDNAgxsYM83sM1xAHZt5A9uX+Js+E7bcUWwt2BsDp6MDIhp1dA3
 7Xss9COo19MJEJWz/51qq08R+r+VEzE/Rp5725puMYmPzaVhX7TJipphX7qey//YnsMk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ul/HOc9DIv7cjUZUG6mWZ6mGzqzvKerOyBpjsEsBh+c=; b=a
 cdOGPbeWzDN43DpbfJ/mM2Ne+KuBluF84o4ZhuoGg13okRJwHlG9vQI1ItR2eo2WmCr9xb2expu8M
 CLyDTHb4VEPq+7EvzJyzzU1veHPISGGaDgu8TR6u49tEiBimP4YgbZW6i1yfv1EAIe4ZJHqOogLep
 jI9xbrFcpJ3rRBzM=;
Received: from mail-sgaapc01on2131.outbound.protection.outlook.com
 ([40.107.215.131] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mvWGt-0007Zg-Lf
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Dec 2021 03:08:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aynx/jbzp8iJsdDbuXMJGBf9MVqSFfgV2anpl0G0Hmj8/qRi6fQEvSra0WnE2jBZzg5PL252q6eiYOX/QZUfObQSK0SCW+fnBnytZuL9Yl8Y1TBVhi4YW1n3ECA6Xh4R6jVvflnhDIJoK8T5moe2wzMyHxo4atYjGUSQGuOti7murjAsMiKXUvyMYe6QB0HBPUhbIdCykyO8epucGtgRP05Sk/xuy/aoJhJI2fMKCpf+/lcqr/GxiyxSpDnsZvDFAsibIM+u+JElsxouIPmnc5tsbhcWSsiXb37E9N+bacRrKT5j4m0n/B5HoLxBsYtotHDWyd1l54/TD4VRPaXlzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ul/HOc9DIv7cjUZUG6mWZ6mGzqzvKerOyBpjsEsBh+c=;
 b=bfUg00AsDKO3jikug2IWgBum6vJ7CnpCTL5QjX9KC5FXvvn9ln+onYhPFUcTpwdZydO/x5kxmAHa0gUbGkNB5/apxeE5b1w2X5qdvIVVCXwiqg5sIEzRFa7dIrobY/6a5iQ25PO/1xfBS+J3Gms8IxMR0GFa2a7sfdVQKxibD8Pvx1czkyNVli3uWWF8WCEORjwoIvgz0MEWSLRaxMrekj/5VbAYtr/iJ+toqWDtodIM7VAwKslFDIq0R2aAfMCjYhdTPd7PqzzQuSZDO7FP6lvrfufTFqRXnj62fx1v4nejvlX2zX5PStomSv0ZV44E629VnXrJ6TOCIVuKA2jR3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ul/HOc9DIv7cjUZUG6mWZ6mGzqzvKerOyBpjsEsBh+c=;
 b=B7H10N6uagbH4Zv9xCu5rg+FR8uHWG/Dne7DOp8mMN1nS7UPI25LEWf9PONJes+qKU6dc/J+/fsXy6369Jrzi/FyfaK37tlwebHjvvOlpoCZbtfTlw2c9rn5TQLM9xqBaQ4CgitdkqpwLO6BBLpIF/QW96WBYrFXSv3UR88/GlM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB1911.apcprd06.prod.outlook.com (2603:1096:802:9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Fri, 10 Dec
 2021 03:08:21 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%5]) with mapi id 15.20.4778.014; Fri, 10 Dec 2021
 03:08:21 +0000
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 10 Dec 2021 11:08:15 +0800
Message-Id: <20211210030815.119153-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: HK0PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:203:b0::36) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dd98081-9f17-43f4-26b7-08d9bb8a5294
X-MS-TrafficTypeDiagnostic: KL1PR0601MB1911:EE_
X-Microsoft-Antispam-PRVS: <KL1PR0601MB19110698C94C8223F50CD40EBB719@KL1PR0601MB1911.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +3VoYimPE7K3SN5nmyv3Ho8gS9HzYLbZq/feOYarSzoJpzkm0wev5RIhYz77zOUIK2saOZFdwzbNn7fzJMeM+7ntS60NowU/4jtrzluS06RQvqq4l/JvVztuoGCDLgg9Rccj4whK9BU3hTQhIEb/gQO8wCTtq82O/83vgpiLEBJmHyj7dkIl44yLJ3fcxgwsiKR3n16TdN40hB78HEFPjhLJQGYX+RA4vhfK6tNM7k3QUG7lXaAiR5oErsn90OT85uXu+arO5sNJHZh7tAJc19kdvM9xOZzXuGZQenyzukuMZogy5av3D+Ve/9gNfOKJ3xB4EgTPY7nwuQexbxHWXa/t/e4q160C1znz3c4KJU4e47AG0QPtDzoCzFieVfDzq05M/K4TJn4zvoxOEkmNP/RjfR6NkqplaFZFANquFFDFR4j1ihMmbz0woowthxXUPoookZwfEmvXZe5TQPmzXHBRydY8WXpJYM1pY87n0qFFGy+Jg8i6bbZHKkgsoEz1/LY+ARSyttE/esMGn7ssoqsASW5TbsVLE6xiDaZOeoigIfKV1RwmuXwCX2rJVeE6BNnyc3/i0A/AdFXZiWpWvgplAXdp8dw19/F0wM7iFsvYNCcnDz3QzsTR+ttDxex6/oa+vVxz9FmOQ72Q9MB2DDQay6hmIX3H7TAb9zpSFTL4JRYOew09B+NtE2lkDxcA+R2kTq3ZxA8/vO0chby2fJ7caqbTjtoeFVQFGmrqr4tE6KCRt/DUYItwOAT2NU6c9ehuBEkguuOUxTHDczunuJlVb7GrLQtpnhSO25gEflI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(36756003)(8676002)(2616005)(5660300002)(6512007)(66556008)(66476007)(38100700002)(38350700002)(86362001)(6666004)(966005)(52116002)(508600001)(2906002)(45080400002)(4326008)(6506007)(83380400001)(6486002)(186003)(26005)(8936002)(1076003)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wrVsukvuwIElXQP+aeImsltwaVzL8SYxkbNL2I2ZcpawSMMn8vGhQnQzs56A?=
 =?us-ascii?Q?gUPqjDZjn3d9O34h7EjHMJ0sF4AJJPU93VRMhkuo3avqRXxWOFEwSVEhygNc?=
 =?us-ascii?Q?USdojSLVGXHwgG5bguhhYlnxLlytXgbZgt377iJACJOK1MCPny9TQp4WXrSU?=
 =?us-ascii?Q?TIdmvCRecxH4l/3YX7XaqONzqDKJFNI13k3+d9ouUSTuIq57CjBMlotRN6xh?=
 =?us-ascii?Q?vDsY8hVHqy15rJnOh9Npy+flYFd8ICqUv1izx5yCRpoo/sm+MQZ1xOlEBQp/?=
 =?us-ascii?Q?U17CaJbinkFvdKaPpTO7qHJcHxktIdpFt7lNY8TeTO9i0zmrWoeRzMys+PEp?=
 =?us-ascii?Q?Od60cLLRcIDdAkxp0rd4X3aHBJDj/itZOasxxlHHdlYst04q15afcf81JuJi?=
 =?us-ascii?Q?5+TZka0ny9A+nPPReSQXR8BmvpyP1zFm9DKflh2pgrKmTaDrkH+tAsIRL65P?=
 =?us-ascii?Q?QB/ZSDJHI8JiSqzgTIupLb7Jj7twVlFZQmP44nluq9TlOudUKMTe7EXx6x1h?=
 =?us-ascii?Q?LAk9FhRTyOmXBE4HRjlvdFwy+joCiolsjD2xw/6ZeGVd40GZeUsjZ35uhvXy?=
 =?us-ascii?Q?ac9/0MsjQP787Q27v+oBF17ZOliPcHkSVf9o8Nc5Jvk02ollrbCF9fWyxL5Z?=
 =?us-ascii?Q?rGuQ3El4MUuTlsm4HRclRsFx2b6KRiBjc2/T9mAYKKtdwyK1B80rX6Lz3P35?=
 =?us-ascii?Q?H6qyhM/17VGWgJcHx9/lm/7kOGQI/IYppB5Je2EDk31eP38x91ftlDjfPwVQ?=
 =?us-ascii?Q?wlfN3C8xnIsYE4t1lByZmQeoQ56OcPMiyFl0ZPmXWqLSgOOB3nSrc0BLj5yu?=
 =?us-ascii?Q?GMGZDVkO8iypdHTyB0oTQXHAJPybxcBLd5ySzaOeBjI6jr6RQ/oOvwYZy/1Z?=
 =?us-ascii?Q?QZlPXkM7SiUVlwZv7EMsASHB7IDGw1fUfMSBAZSjl9sBziGF7y3EoyGhO7Fu?=
 =?us-ascii?Q?ko4At3eqK72FhFJ0a1yD9/F9c7VoS/EMYQB51ZNQ/U68vXsMqwfl42ZRgjiJ?=
 =?us-ascii?Q?g+o3udPWpS27Ag74pZBKMoe/tpkxcQnhGO0PMXyJN08Axpy1noB1wcjTYNVC?=
 =?us-ascii?Q?xse5TszXj+bmoWcAj3WiJc7NoJZSm5nj+vwePQJqEssilkIJu6G76xODoxUE?=
 =?us-ascii?Q?Em9N21O6wdyG6cguKjeugJdWu3z5Io5n2FAuuixn+XeRpfW3gX92sM7y93It?=
 =?us-ascii?Q?fgwLsnDUiD/GyAAbrSgu9/jsWdWurmPcpuoQv+RiKuWDRuAxJvmbZKVauymg?=
 =?us-ascii?Q?KRtj8mbPZ3LZowY7YLXDtYUXwY4xyWywpneGYpBwN5CEcEhSTkVso81CXQAW?=
 =?us-ascii?Q?kFF60FL0XGZsPfxChxSAEFGYC73a7J7BgZJdpfdZq/hECTA10PyxAApHi9z/?=
 =?us-ascii?Q?DelPd7PPIolbpLiLfNuo7gdMeTVZA9IXRvm/UJRS4OgdND9EHI8vkXgoD83O?=
 =?us-ascii?Q?HdlH27utF3Owin6mBJ5x/yZqga1EOXKpgsj120YSVHL9M0xI97UuEVTw4DWf?=
 =?us-ascii?Q?qOZ8B8ft59Mk6EiNo1FXkQ7DhWz5bB4fXLbzebs91Ws2jdo+zJLg4f7fnvwi?=
 =?us-ascii?Q?TOsXG3Ln8zE0wGjZirlsciECR90oRUCLpljay5SaOAzJtkLhc9wbM3qMttgM?=
 =?us-ascii?Q?TX7brr3peRoDZqLYSg/F7pQ=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd98081-9f17-43f4-26b7-08d9bb8a5294
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 03:08:21.6710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPII54f5WZFPdrM3xuTc1Zpz9KHNASQMZKHz+tMchKrN4uJjPg85dNHOFeQWoKW2d6tmerQKM81zodRrf+FgEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB1911
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi chao: As I mentioned before,
 https://lore.kernel.org/linux-f2fs-devel/KL1PR0601MB400309C5D62BFDDDE6AAD8AEBB989@KL1PR0601MB4003.apcprd06.prod.outlook.com/T/#mbe9a8f27626ac7ca71035e25f5502e756ab877ac
 there is [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.131 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.131 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1mvWGt-0007Zg-Lf
Subject: [f2fs-dev] A potential dead lock of compress file
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi chao:

As I mentioned before,
https://lore.kernel.org/linux-f2fs-devel/KL1PR0601MB400309C5D62BFDDDE6AAD8AEBB989@KL1PR0601MB4003.apcprd06.prod.outlook.com/T/#mbe9a8f27626ac7ca71035e25f5502e756ab877ac
there is a potential dead lock problem when just remove
compress file condition in __should_serialize_io().
The modify like this:

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 9f754aaef558..ffbee94924f3 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c

@@ -3218,8 +3224,6 @@ static inline bool __should_serialize_io(struct inode
*inode,
        if (IS_NOQUOTA(inode))
                return false;

-       if (f2fs_need_compress_data(inode))
-               return true;
        if (wbc->sync_mode != WB_SYNC_ALL)
                return true;

This modification is a prerequisite, if there is no modification there is no
problem for now.

And I make a debug, and here is what I found:
Thread 1 is doing checkpoint in below procedure:

Thread 2						Thread 3
f2fs_write_cache_pages page 0
	->lock_page(page) page 0-3			f2fs_write_cache_pages page 0
	->f2fs_write_compressed_pages				->lock_page(page) //lock page 0, sleep
		->f2fs_trylock_op failed
		->f2fs_write_raw_pages
			->f2fs_write_single_data_page
				->f2fs_trylock_op failed
			->unlock(page)  page 0
			->cond_resched();			->lock_page(page)  //lock page 0 success
								->lock_page(page) //try page 1,

			->lock_page(page); page 0 //never success

When Thread 1 do checkpoint and down_write of cp_rwsem, Thread 2 and Thread 3
are write same cluster, Thread 2 start write cache page first, and get lock
page 0-3, beacuse of f2fs_trylock_op failed, f2fs_write_compressed_pages and
f2fs_write_single_data_page will failed, and Thread 2 will unlock page 0, but
keep lock page 1-3 and schedule out, if thread 3 start write cache page in
this time, thread 3 could get lock of page 0, but when try lock of page 1, it
would never success.  Then a deadlock occured between thread 2 and Thread 3.

So, there is a potential limit: We can't write same clutser is multithread for
compressed file .

If we need to fix this problem, my thoughts is we shoudn't unlcok page in
f2fs_write_single_data_page for compress raw page.

Do we need to fix this for now?)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
