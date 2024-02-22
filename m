Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1100B85F310
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Feb 2024 09:35:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rd4YA-0003gp-9u;
	Thu, 22 Feb 2024 08:35:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1rd4Y8-0003gf-5j
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Feb 2024 08:35:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KiXhafatXWRis/1dcKXLwDzUS1zit5rY5oRy9+MjAQo=; b=KtzzIPN84HO9qrgS4nRtVDsQgs
 eb8lJuVWwlUMEqEWtlI1mUYgc3m7tH/vgbHFHUXFAfqwhVf1zV/vpdUq/pQ9InnTNWl8VbkzXvQzF
 dwb8zyrIZQqFL4w3BFiFxudWhvdYFL/b1Q5tZY/gn6jzNgIoHZEBKVgXX+W3UWd29GhI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KiXhafatXWRis/1dcKXLwDzUS1zit5rY5oRy9+MjAQo=; b=IiF+8iL8jqPP70ubaacp2fIyyI
 kX5QEWLloqzuUJycpRESyXT/grF5nOlZKqDrkV7sNcksr60CpSytl1KmzsljFlXDA7OemAiUn4vfI
 TnhlHDRukZ/72jcFLW51RX+Rahd4OLha4CO7h5mz5DJR2iC9AgLG5USWH1v+s4h+g7bY=;
Received: from mail-psaapc01on2067.outbound.protection.outlook.com
 ([40.107.255.67] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rd4Y3-0004im-16 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Feb 2024 08:35:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqU/MyiygVjYEv5a9uWqZkj9kGMW15P/hgvzNmAX0EyklrOOcO7rRd19iknM0ba79wNj32SkuejgYyrwuEmu+VLFtZ2cnMZKdNQXCK8TLoPBVL7H0vZuY1FNZqCO7CxXWxJ0uj8mdL/YtnHQzKFCJYku6vAKvnB0+H9pYNnRcPV5hvpvOq0BXhUzgeJ3v5muLiKKffV3n5aLUdyHVNrMXkMgMcERam5p1rDan/7nFG1l3Gu/xHSydKYL5jsL/O1VsDgW5P2mcwP9/C6Ki3US8I6l7hN3wgz4UBjKMUth7HbALsAQ1uDV9wqhB6UGVwdMR6RuRKzxPpmo5V91PDCKiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KiXhafatXWRis/1dcKXLwDzUS1zit5rY5oRy9+MjAQo=;
 b=TvJ8neKDJrF0MiUE+gdmurHCHK4B9fUpRiSbBAeD10KHw4ghCVNA+KRcojIZPkCH0k95X1jG7zf/NaQPRNW2HYB4WlDHkX92YZHAOoqYOHaQ55bETki5HPpc7pEqBJuOLIDq+7iLNv97iliOgW2WUgAynzfAcrfEI7GDHhLpJ2zUd/s7YurbIqpICgAT61GZZBJifYe1he9xMCL9ysCsGOYiZlbOl5/CmOy3RGbHvU3bhpMMipIE2ipbaNz7BvcmekdzePqI48/kO2tSJLjuOB9/c64SIO5zHC0bBKFGmS4qn8MZ1SlGSWp/3xmoUmLBKjuKBNL+2EaF44JtAoEeKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiXhafatXWRis/1dcKXLwDzUS1zit5rY5oRy9+MjAQo=;
 b=INgojQTKq1hmAh5N4rpDYbC33Sp7OYKtGwO02wyVtR04uxvXPQhvso/8BHvHkexS4hyoQAp0uVXS6JNrp4i7sVArWuYqt0KmHO6l7ZWNAe0xMUenq6rXmoTWPsMv8hQfOVbKywKdIRA9RDZaOcbTm6TsqMMbQtt0QBzS7nSAt/aA3g2nrIy5ndRk3L5kBrYYsXxWcrtepqqtwhm+HXtXS6XfnibDMySJmP1IY5CpHvFJ2ot7aKpvf7unYThJLwq3XRv2h2r42jAU0cZ/9yS5amCidgspViCaO2oo7rqWz+pF7zcjQMJVsmB0Q/awNgGAwCXq5aH6qCD+AfiIfA5Izw==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PUZPR06MB5697.apcprd06.prod.outlook.com (2603:1096:301:f7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Thu, 22 Feb
 2024 08:19:20 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::bb55:9ee1:ca98:c525]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::bb55:9ee1:ca98:c525%5]) with mapi id 15.20.7292.036; Thu, 22 Feb 2024
 08:19:20 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Thread-Topic: [PATCH] f2fs: compress: reserve blocks on released compress
 inode while writing
Thread-Index: AQHaQ6NaJP5KCQgwSkWyEPOTYY0ue7EWR/JQ
Date: Thu, 22 Feb 2024 08:19:20 +0000
Message-ID: <SEZPR06MB5269414D751BC878FF577906E8562@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20240110091009.138206-1-frank.li@vivo.com>
In-Reply-To: <20240110091009.138206-1-frank.li@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|PUZPR06MB5697:EE_
x-ms-office365-filtering-correlation-id: f0dcb5d7-63b9-4fd6-94f0-08dc337ef864
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AtP/DGyzABrQxu6eFwJ5tHR43fDWwB/qfKh9Ym87RXxhLFFHGdVd2fgvsXEwcBNjJ4JZlN2kXXuZX2R2ebMqYPsW19Brp0HNz2PEQ+tfVL6ueAbTjAeLW+X6wPROjhNcs9KOBaTzbtLyOZOAcmsX4WjJRuqDZYv98JSTHNTif+bPltyxe+MR1SPKgwFF1hu334QNNXoIv6ckxllkMyOtipYFD+61CpdQVH8q3qv/oBG21Y/C8o3o573x51GklRDTJBiXrA2ZkJjZJ73RRZnIUmMiUfi2nvYuIrR1EIz2wZO7oloEx/kzZbn+R6u0g3NWcoD9wd/HIyHZLpEF6lzbPsR6PPMeFCPm71MQ2j2bq1o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?ZjIrSUljMjl4RzVVcGpGZjllVzljRXp1ZHgwdEdTbElqT25Zd0cyZEZTRXFX?=
 =?gb2312?B?U2tWTVRvQVZFR3JwZDdDbkVzTVZOYnJjNHJIdHJNdmRuWDNiKzREZjlNekli?=
 =?gb2312?B?cDdoVnBjVVdTNE9od0xRTHV1akNwOFpYSzQ3cUt5cFZESERGVWNFYmZMQnRK?=
 =?gb2312?B?bUtHUTdadXNSMXBhb2JQN0hUOFRZbm9zb2VNd3JvTjNkSzN1SWJDeExxVjJM?=
 =?gb2312?B?M0k2U1p6ZHp2SExaMVUvQVFiMFhrQzJUVGNHcFg3VER5clh0L2lpQ2lydDRl?=
 =?gb2312?B?bEYxdU01SFUwSHVBZnNrdUdUT0ZOZzdWMCs4bEtqMisxR2F5VStNdHkrTFRB?=
 =?gb2312?B?eWJINVUwM3FSYjBvbnYwMGlTbjgyQzFvTFN1WHpVMFNvWjV6Ukdja0RtRWhY?=
 =?gb2312?B?VDBkTERPdGtWMjB3TlIxZEZadlhaTmUyR3BwbXRyRzVXWnZnOWNSWG5PVzNk?=
 =?gb2312?B?NXZZbCsvZkFzMGE3WkNLekpKWkduc2dZbmhVVFZQOXd0SVpJbm5QbFMrV0Fv?=
 =?gb2312?B?eGxpRzdlMTNWRlNaK1o2d2dTc3dvZVY4VURSNWthMkdPUDcvMGdtRlFSaWFZ?=
 =?gb2312?B?cW8reUFDOUZFc3Z6S3YrekpFVm5JL0cwb3lGc21KZ1pTd0xJdWlXdDNPSjY5?=
 =?gb2312?B?dko1TmpkV0NHWk9BcGNObUc5a3JzemVqYUorWS9TZDE4MlA0b1ZFREtScGFy?=
 =?gb2312?B?clpvKzNuZ21pYXlmQzJZMFU1NzRZL25XZUFaU2tUWVc4OGVTYmNrTTFNSnN4?=
 =?gb2312?B?Umc1V3NFbElsb1YyaVN4ZEIrdnJpODhIYlFLNXBiLzl3L1ZSbndZaTJ6TUFQ?=
 =?gb2312?B?VC9jUjJZdUZzYkdvM3dQcWZVM1AvdTN0MjlDeHNOcjhMTWlRaENSZVZ3QVJY?=
 =?gb2312?B?NkVQSW53R2dZd3Y2RHczR0VpeCt1aVJlRXdWblk0d0N5NllnRGJOcFVuYzd5?=
 =?gb2312?B?YzFQMkZXMndlb1U2Sm80K2ZZSWo5UmxTNHlkK3FVQ2JFSnQxRWQ4WWJoc1FK?=
 =?gb2312?B?QUF4NkhWT0tDU3FyczJyUm9GVUp6S2R1UmhwNStkS1BtaEhhYzRYUWVndkcx?=
 =?gb2312?B?ano2Y0Y4M0NrUk9FTzFvTEcvVU53dlN0elZEWU1vOURhRzVVbEVzNkNxNmtE?=
 =?gb2312?B?OENCL3Z4UVpseWZlbnV2WEhtNFRIekJkcE53ZVhYV2N5QnVYVmN1U21VN0dD?=
 =?gb2312?B?VDQxRUhtTHBoQTZXajBIdXExZXpZNjJ6WDc2MysvM09VZXhDRVl0Y21TN2lV?=
 =?gb2312?B?Y3BnNFlHRmhhUHYvSWVQek9MbDhJZ2I0UTIwSEI3dnRKakRYVE5mcFFKOFUy?=
 =?gb2312?B?SHFQbldUMUtleDl4UkJvdERTek9QMk1YakE4dUFZZjFlNTNiTThlT1dNTWwy?=
 =?gb2312?B?RnFINkY5MUl5SHEzU3pnKzdib0tqNWZUdzBKWndzQWwyc0hBL0NFbzdDZFl3?=
 =?gb2312?B?eHNSUnV5bDdDY3RaWk1oSStGYWpDci9FVWtwMTdkSCtIQ2V5bDVrc0w2alhH?=
 =?gb2312?B?UnFNczdteUl4c3l5SGlKZlRUMHBuNGRpcGxCQzdBNERiVm00MXFqa25pQ1Rm?=
 =?gb2312?B?TWhsU3FVbkxyRnhNWlF3UGE3c0wvOHFWYlM5SFFWUEEvWE5iRVhxNVgxcTVY?=
 =?gb2312?B?SWZhaXFuTjVNKzBjMUZjZ1p2Ry9rcFIxaUQzTzZackRmUHhsQlo0Yy9sa2VW?=
 =?gb2312?B?c0RCaFBXUUgwZWFadnlqc0Yrd0daZVlWRE51Y0VHMGdabVRWRTBxMjdqU1R2?=
 =?gb2312?B?Mi9DU3EraXN0Tk9QL0lZa2ZTU1o4bGdKbFhKdHNkVEUxdy8zQWd0ZkhRbThi?=
 =?gb2312?B?TkZsaTB3ZUtuZmdUbHZqNUcrbXE0dTB4eWxXNTg0SWRzbWtIMjhUSXBQM2JJ?=
 =?gb2312?B?dU5QUmhlUzVKSWFhd0tsQWlsNHdMaW9RRWR3cXF6TmVsRmlEN0gwMDhRN2dK?=
 =?gb2312?B?T1ZPSVVJNDhiVnJmNHhGcmM5b1NFdG9ab2c2VHpVdllSaGh1RHBRakNWazBS?=
 =?gb2312?B?RlVMZ0cvMVNKQnB5YUNYc09kNmlYQjJhUVRGa1BxcXZxcmRwNHBuU21rbU4v?=
 =?gb2312?B?ZmNsWkRqdjlOT21KZ0xkOHVEVFZWSkp3Z3B2TE5raVNVQmhRRHJ1WXI5VWpx?=
 =?gb2312?Q?Gnrk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0dcb5d7-63b9-4fd6-94f0-08dc337ef864
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 08:19:20.5949 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Qz5jCKYd/BPX34OEJAEY3Dh3fHSLNdDPopPJbxhw9SGFDYP1Zx+5abq68p0+78t+Tb/Y+cXPCUGYHed8rO45A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5697
X-Spam-Score: 2.1 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Ping...... 
 Content analysis details:   (2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain 2.0 PYZOR_CHECK            Listed in Pyzor
 (https://pyzor.readthedocs.io/en/latest/)
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 SCC_BODY_SINGLE_WORD   Message body seems like one word
 0.3 BODY_SINGLE_WORD       Message body is only one word (no spaces)
X-Headers-End: 1rd4Y3-0004im-16
Subject: [f2fs-dev] =?gb2312?b?tPC4tDogW1BBVENIXSBmMmZzOiBjb21wcmVzczog?=
 =?gb2312?b?cmVzZXJ2ZSBibG9ja3Mgb24gcmVsZWFzZWQgY29tcHJlc3MgaW5vZGUgd2hp?=
 =?gb2312?b?bGUgd3JpdGluZw==?=
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
From: =?gb2312?B?wO7R7+i6?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?gb2312?B?wO7R7+i6?= <frank.li@vivo.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ping......

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
