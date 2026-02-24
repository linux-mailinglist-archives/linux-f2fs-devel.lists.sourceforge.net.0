Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKl+CkJFnWmoOAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Feb 2026 07:29:22 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9781826C7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Feb 2026 07:29:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TkwLGEqM4lcO9AnaxiBYsurZks2GkIJdEx+w0O/epCk=; b=aIPlKf8wX7FPaUmLwabzNBvdj7
	YcdMO5gmde0A80haBRpWa1YdmbVJbJO5ToE5544k7ORcWgh5/dupNKxokf2zVOCh1HY0DXfhiDCCS
	Boj7gjLxSDhTOQi1dGB7tSqnJqrc8JBLzoXHdOqnvNTTVDWb2p+2c4kO0vEFjntZX7NU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vuluy-000359-Ab;
	Tue, 24 Feb 2026 06:29:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=508c22374=shinichiro.kawasaki@wdc.com>)
 id 1vuluw-00034t-Is for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Feb 2026 06:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h9cxqcncNgLoXUh6fVZLA5g0D9s408EZMnuubWtBjRU=; b=BlXFet/eBuEE8ND7lmJlZpJ7Tf
 EzEc1Te0hS8HsSE1iQgEaqQ8uxU5nwnG/uDdzYeIJUiw6OPugdnXpdiN7qpb8ii2njR0ueNt4qBLu
 yF4Z1myk4VRyUUVugFMH4lu7xFnViHoGoJVvWZB/b60+pbaWx2+CQSHY2YxPvyXsRTKg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h9cxqcncNgLoXUh6fVZLA5g0D9s408EZMnuubWtBjRU=; b=i5u+xqRm9p0gQc9HS9vRakvsnX
 thHfzlCOd+DA2oRcTXWfRhmut83ffxokvs5dN4tUiU95RLLW3+x0OrtBm5f++u8/tCzVWKrbhBVO2
 5CeuAxqNVFCJfrvYu0/GIkg/gD1FqPBXQ6vskHKwgxBHKKnSZEp7Abd4m6Xzmms6sh1M=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vuluw-0006ry-Mh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Feb 2026 06:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1771914550; x=1803450550;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ALlpvMXa+Ac0zNdVIWdtSCV2x9R3ku8tcqhxmG7gs6w=;
 b=YgJG+DEWslzCYvA4tZl5iFDqLJdlMhTN4yrDbu48Ho7pZSjMiiudbdi6
 HD2PKKZkfv+oSgiPrPaOJ8tPshEObdQFZakvgTsecDl3D49TkvLyOeoAA
 2TajbRunnW6Pgflg1BH0j1QiMF31m4aei6HKQBiJvoo/l8s+jeoL/5OAN
 yCre5zGi9NWufxbU7CQCVvRBImXzGhNi4mtLgOxbnVuENuHM0RixqxwnZ
 CkyOXiiE+6XvVFI8TqdxB10bH8jnfTvGdLNnV1DdkBOmPnzRHpl3LLzRu
 dB1VIZL/Ef+rtyKxK7vy3St7ve17UWE/FIuieVwl2fZd7j6sAol8N0U+L g==;
X-CSE-ConnectionGUID: 7/DEFktPSzaaSNs15PT8oA==
X-CSE-MsgGUID: l8WXFSJYQNuEr5qBIrQsMA==
X-IronPort-AV: E=Sophos;i="6.21,308,1763395200"; d="scan'208";a="137716834"
Received: from mail-westus3azon11011016.outbound.protection.outlook.com (HELO
 PH0PR06CU001.outbound.protection.outlook.com) ([40.107.208.16])
 by ob1.hgst.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Feb 2026 14:29:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RlLZFLZ0ch8r8jOVOdrRk4qTvvpTf0W4Ur1OoLLc+ohWT/xaim2+4GQLs69LW3EL3SaxEDCG2At8Sfv2ijbZc/NPz3eVikggPZ47CcqYD7ImYtHqcMTkInc5v9dgHjv2rufrxLRrFdcN/GjAX3O6UKMJDqjDIAChguDsApq6z24N8Oo549Lgj6V0BHMx+waY+3JOigkpixPc6dMYW5uJaiiVKHGazmba5PvA4WP3pTe6A+skIil4mwTBQ858RnYeW9Srx6YVbbh6jYifErPL6EkWTVNT9UDtmarv1k1eEKo390zodkjbtqiQKpVbbZfLu5jBW4QB4z2nGiLb2VALpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9cxqcncNgLoXUh6fVZLA5g0D9s408EZMnuubWtBjRU=;
 b=A8Nog31SexAqzVtd+nxktzGJD6NsGJBwEfei/HlJXwcC/dGBbK8Wzx07dCYRZQiViy7bgqZq5PBaopCdo4oh6vfxi0d5QJjrv3jGqzz9qM3kLHy5h0+mdIqY/c+d2CzwAyBpPPX7dlyJyMgY6veNxUyAmYIBaZk790CP/iJ+ur0A7JDT0huRh/Kj5r5itsR4vbKQeYnH0t7E3s2hFJTCmryAgvRXcgg4Wnze2grxj6/ZJXJ/h3k6Vmx8HUdmV1GmTlDK1idliAeOC4zSM9wfLNaOEzacAMaPYpZ1TqF37E4wrljjYD0XmNuTL4iu5XsJGx/Ioh6OxIXJWmN227F80g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9cxqcncNgLoXUh6fVZLA5g0D9s408EZMnuubWtBjRU=;
 b=gIHmbZorv8AgfgQWnoG41WJGNIRB1iNCGOpfY2nibCEe83GJ30hx4EO0+bjIhNcyqm33/Z3CrxEEr1Gr/TY1StB6eo1s5+mHrKyI9+SJhjrQy0yDpec8Y4H2/oa1+Qv1AzyM0kxgtZnkZFb+34SUh3riEOuKnNVf0z8WKGKavck=
Received: from SN7PR04MB8532.namprd04.prod.outlook.com (2603:10b6:806:350::6)
 by PH0PR04MB7286.namprd04.prod.outlook.com (2603:10b6:510:1d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Tue, 24 Feb
 2026 06:28:58 +0000
Received: from SN7PR04MB8532.namprd04.prod.outlook.com
 ([fe80::4e14:94e7:a9b3:a4d4]) by SN7PR04MB8532.namprd04.prod.outlook.com
 ([fe80::4e14:94e7:a9b3:a4d4%5]) with mapi id 15.20.9632.015; Tue, 24 Feb 2026
 06:28:56 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [PATCH v2 1/1] f2fs: fix lockdep WARN of sbi->cp_global_sem and
 q->q_usage_counter
Thread-Index: AQHcoNWEWBcPYygC7EirE0kirNCd/LWROPsAgAAzDYA=
Date: Tue, 24 Feb 2026 06:28:56 +0000
Message-ID: <aZ1C-Cdrwoxp0VCJ@shinmob>
References: <20260218125237.3340441-1-shinichiro.kawasaki@wdc.com>
 <20260218125237.3340441-2-shinichiro.kawasaki@wdc.com>
 <aZ0aVDSWpRRqFwl9@google.com>
In-Reply-To: <aZ0aVDSWpRRqFwl9@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR04MB8532:EE_|PH0PR04MB7286:EE_
x-ms-office365-filtering-correlation-id: 25ac6a05-bc17-43b3-31cd-08de736dfcf2
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|19092799006|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?p0ImIlTVYxJXa+WyuddlXakGfQfEK9s5ILjg2+G1DPr/sXT/o/FxpV8EK41w?=
 =?us-ascii?Q?sG/HaR0L7fzImVI+rdxDfLGy3fZyH/2vlE2eHcvdg99rypGkwVXhL3/oYVal?=
 =?us-ascii?Q?KeD0CEyYDc7B+xjpJOThwC0+sMCQT0Nt3kA16/wMxYUcLcGYPU9uDG/2VQu0?=
 =?us-ascii?Q?xBhfrtMru/v+vhw4wXUxihfYbQypx+mBIKSjnBhn5JYiDC77PftIWMtVsXzs?=
 =?us-ascii?Q?vBMP/Cxy8Z1T9IrFdhDakS1K4X4J+iJ818QGS4tOIj4LjSFa4J3zyWQurxaQ?=
 =?us-ascii?Q?mrT7cEfJGUGUUrQ0J0Pz3RpHBFtql7vYlL4Ydcxm9Marm9XQW9ZWj9Vpo/Q/?=
 =?us-ascii?Q?RQQ1t/3hMVdlVHyYIP9Qb+WREOqCQwt7oQaCXQ+UdXNhyhH3SJUHBIq7TRJK?=
 =?us-ascii?Q?9vqG7lyzLCxSAF9Z58BpFnSAYrRYy0tHhgOwPYF6fmnNpiijC9LpFtSEIQ0m?=
 =?us-ascii?Q?Bn2I0hGPTsV/pmjL9GpiIt5QCmuFd2EA8GuPhfzJ2gcTKHs486Hp7qiG50JN?=
 =?us-ascii?Q?14b81ZE4LEVBDVYu46XIyeXY32QzjSwpccliVtDpxrFvnorobh4Idvd3TPRp?=
 =?us-ascii?Q?35UIKY3vCsO2FOTqH4GWEQrIMiYavt024cwsF2UD4zmJt2cgZz4ZhCwU0h/Q?=
 =?us-ascii?Q?48Y9g/jzrOJ8udoAqGyUAxbLLzNLZ08UZlGppE0kY5D3ZQXZQO06S6nea3oD?=
 =?us-ascii?Q?PQ2Vhbg7iVDzFzkiibEKnlBW8hG/yapZfdOuEvHPw5Sj1ILhWCcTN7yV6sEa?=
 =?us-ascii?Q?5FaukDCZa08JGBL7HuVkhdi/3r47RAWwD0+hC6BH1aJ86OoEXdrGfPL8KNm4?=
 =?us-ascii?Q?VJmvK7SvrR1Vspi9boD29lUjWwj6c5C3Q7OZNuuqYUx5rimlQWxKptYPL4bs?=
 =?us-ascii?Q?1cXTHFULtOsblWCqErLoH6ougqvndX1VTN3cP2xIlv4NtKXBpQhcB4EN4P1j?=
 =?us-ascii?Q?FArd80SgDUuwxyMekRlKZyNv5txJdC+q0dJRQ2OdmyJJpbQq3zgMjBw3HMo4?=
 =?us-ascii?Q?2fd07ln5dpXvpXPalqNtsf6Q26jC5ANmJtuEYs4Zbieu8auVBOR0Z+sln5Fm?=
 =?us-ascii?Q?RESIoDRL17QNk0HZnqo7GpigPCcrZycpP0xnxMnA5OX+g6VMdBselcL8Ctpu?=
 =?us-ascii?Q?Y+hXe28c+pyQwp3DeDbblXG3w1AadxfIqhX2uie/CQqendNOo0+lA8Sgw+bh?=
 =?us-ascii?Q?C4JzfDTJBmK+olz2Uq9UGcX/Ip92OT8wau4//MyucGGTfDnfx7CyC8xPm7Ib?=
 =?us-ascii?Q?DqituuLuPQ8Cb4VrCW243nvj2DCb4N1ws+YflTXEt2/2L1qqZGbKs47ePBLZ?=
 =?us-ascii?Q?bqkUI1fniK2WnmwAgwa9CLwXv87k9f1Xvube4zvZyiO+cZ6eoEml98ecaG3j?=
 =?us-ascii?Q?nAIr8u4k93P+ypZTk7GjofLJfubodveAFhiNLAhUFn1rZ6gkbSJAik4NwBqi?=
 =?us-ascii?Q?+naWpxh0nEpNn/XK4QH/Vd96hxQUBeDBlzohLKkDX2P1hxAMG8tuDirZjFsj?=
 =?us-ascii?Q?UZ04kKSWE46la690lneyGD5SVU0URNGJ8AbVVCeqCWSqA1gyqGfCShmWn1pi?=
 =?us-ascii?Q?nakK4O/xjjW3a57CBI9j/XRLrrjuXY9+91saMnAfv7iok7WByX1zzTQP7fLD?=
 =?us-ascii?Q?knZWcqvr9UGBmLFpTN8GmZg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR04MB8532.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kg3KMcbeZlocBv/LlTVZgPnDUm0QMo5HCXQ8LOFKFzndsDu9WdhhBnV9eJZn?=
 =?us-ascii?Q?rJ1REZhNS9XfmgsLeE5IDr4hyJWoGcB0ddyD3LXeLcsNbex+jT2Q46ItwQ0k?=
 =?us-ascii?Q?RBquKziFUtujL52GVrCN0GlhS8w56Je9R9Q+It4SuEl4Mj+pmJ1chDPoleMI?=
 =?us-ascii?Q?0oKTSnOzKD7+3nuye+0v/hvD06FSPZIn2feCOe0WuSMr/ZGmennaGdm096FE?=
 =?us-ascii?Q?NG0RREt3L1o6I3W3h0l2GSKctUD8VDBxw1nRuxV3sDsE5WRt39sMtj2En5wC?=
 =?us-ascii?Q?okR+yKG9iY2RyJpiLR89yXL+TKCupFOWW4nDLGyhbsyHZkSlsKAVTmxTCByt?=
 =?us-ascii?Q?wTNdxx87vdH15DX/x1qRcx3JP5Cnr6S17uHn+guhPnC3+3qkOibM6UUdL9BJ?=
 =?us-ascii?Q?8aXHMUWUGnB/JB3pDR93E9yHbLxFtOcyByUTW9DRhqAKznU8wcYWYEaWN+hb?=
 =?us-ascii?Q?g8GnHwOAOn5ijQ6kdhlYbgNtz0vXGC4GB45jTrS/Y8/BgLZphHhYGm6hq5Gc?=
 =?us-ascii?Q?kn65Hc3c2jfasJPKpdMwLuk3O518fz+TseYYMV4Q3aBZujcqiH+ivATj+UFP?=
 =?us-ascii?Q?IUvCrFb4Z3cKItohFYaCt4VYHpm9lLSiU5wl/kQhMZr+6vZ1HJYHDzA1Shlz?=
 =?us-ascii?Q?tLya2or/MFjqscZMqMHKatK1lRMq39e8yVu4ocz73enIuid5R0H2QKG9JV6U?=
 =?us-ascii?Q?NMdBRESl3dyKfOmu+HDEsxmzQLaXti4i8bEAvpBS1yKKPPkMOnhaQB7PrJbC?=
 =?us-ascii?Q?hHcN7mnO67trwNRsuwBkmHCRYlouZjqI1QRfkLCUwl7yg+3sUCk7OnC3WXy8?=
 =?us-ascii?Q?JRJKroLJEuSspLoAXklUu3ENKLYw8V9p7EOTZiFJlebPaIkf2kAPn5T9ROyG?=
 =?us-ascii?Q?3awM1SyM4i1uNPSHnvItW89tw7Bny9zcs5o0rGpstxVDucRp/mKI4xCS3X2n?=
 =?us-ascii?Q?xKSscV62Zu3snDjFNrrwjHQS3TGfJXcaHJc+75MwBE/oAlftXOrQlk3I4EUo?=
 =?us-ascii?Q?5IVyGeWOo2HTywQ0MzAJp9cjJH9aTH8JdE7iyZkhiJUmu/hT45rmmo9iMdHt?=
 =?us-ascii?Q?sD5Gl52rQcP9iTxRs4o/E5aGnZ9vf0PJ1OfHplqYLdHDcivNoM0RAR9MBZEY?=
 =?us-ascii?Q?R7ACgaMGELQ2ScZYNznKuP9ZCqzgK1EnnSxJIDt2C63QkH4lWwFfonOsHDAQ?=
 =?us-ascii?Q?XhI6ScvhYPC9QuBxmpbn4E9AqMIH6Wx2zDYSfASJGKtaVVtKlCSv/NJUAuoZ?=
 =?us-ascii?Q?KHrUl2a8VmQ18QehoNCY1pP8qNV5AYcn7RFbz7n6LK+r5vGXhG5ZyD/w2APH?=
 =?us-ascii?Q?+FBdnI0Rx9mBqsGXnakWCogz0GHajZh16Mq4sFZ1hDHzOyVz8896c8xhdQ5k?=
 =?us-ascii?Q?nkyw3PnxcoHi1wy5gte8IXdfmrIgiXGMAOFArAu+ScctxjOnrJR0FCxqhCJ5?=
 =?us-ascii?Q?UF3NKF8zZ/XvSeMQD3XC7Bkb8BajCUETavn/KWaZn6MOAOks0octSc3U/OoO?=
 =?us-ascii?Q?td18kxYRv+H8D5bjBglw+uFwfSYM86kgpJmEKQ4yeLnTYxnPyXT9M700+6ku?=
 =?us-ascii?Q?0E0sVaodQGpblUwscev6o/nOgpT0xpp9GFxWkZ0FHvnzQdkKgvupocF/iMN0?=
 =?us-ascii?Q?ewoa1gVQSTorvA9Scn3XkGQ+k69NEsdqvl/bomZ04ipujQwf+RWFW1pKAhZC?=
 =?us-ascii?Q?+MM9vJ6hESCC+U1ZkjVjZ7hMRN6bH9QCrvLVV8yyH9Nj3/Z5IEg8KmdD65I9?=
 =?us-ascii?Q?OINcAFHX9sZOWiy7emeFQ3Xa/ria8H8=3D?=
Content-ID: <005A551A1EF48B45A4F680DAD5C66D4A@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: tEf62jEx9nmb/2xv7ojaB2bObf7Bqe13R9hDP/FOO9BzSU711lOlyd9r9GFqj9Tr0FKITr2JhJNWupyex/3Coqa0Tl2/ERw15xsQaU5IpBVAzD0Vg4pNIHBxDUS6PGycJ79aaYlTinEvoex2HjeE/NH9z//uegwIkEPSh2U01Y/KfUlMWUw/5fy2MGjvNnJaOUrXnUN5PFCHS5r9WYit49Lm3gCqPnKHtbZmcNaANa82qSgPCkO7RRneCMhzgAIYR5F9Mpz0fIyVx/Frs4WbZcbszKudV/oZHCi06jvuC/ojDWmqyNxLbbgYumFFjw2d3m2FifrYL+UT1Z9r2uXR1YSxm9nIv+E3hbqY84TilqH1pM4/AiwFdgBi+q1prtoURwwLTwliJe4G/1S6iuhGfsZnre0mjaYEDyrSeZqP3Kt/rzB5U5lJCtdN/E84ur0APNoCkQ/UoSc5hbe7P5MomgGFa2JCM9LbdnbpH+fxApKZsAQs6cP+NOKiYjVuXHxYlqJgAJLkDSKynbvBtauBRjuL42bIQnJXeoh8hO+VFjnZ0BvRhebcmqfDwJaTpNHYZPalFPVDLYvE6V0mhSfNeF8UWjbRmeSwp22aPiCAE4cTSjcgBD1va8YlHLwyQ/ig
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR04MB8532.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ac6a05-bc17-43b3-31cd-08de736dfcf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 06:28:56.5023 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y0hi48y49D7mVVwvjykGltnTLKA+Sen/th6DmQ4BTaOK3eWezes3H+WfvGtp+aq6uEVbew4XM+x0Jw2Zb3vicXCa1qsCD7GjoJJnjzSEKeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7286
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Feb 24, 2026 / 03:26, Jaegeuk Kim wrote: > On 02/18,
 Shin'ichiro
 Kawasaki wrote: > > From: Shin'ichiro Kawasaki via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
 > > > > A lockdep WARN [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 ARC_VALID              Message has a valid ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1vuluw-0006ry-Mh
Subject: Re: [f2fs-dev] [PATCH v2 1/1] f2fs: fix lockdep WARN of
 sbi->cp_global_sem and q->q_usage_counter
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
From: Shinichiro Kawasaki via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: Damien Le Moal <dlemoal@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:dlemoal@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,wdc.com:s=dkim.wdc.com,sharedspace.onmicrosoft.com:s=selector2-sharedspace-onmicrosoft-com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[shinichiro.kawasaki@wdc.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,wdc.com:-,sharedspace.onmicrosoft.com:-];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wdc.com:replyto,wdc.com:email]
X-Rspamd-Queue-Id: 1F9781826C7
X-Rspamd-Action: no action

On Feb 24, 2026 / 03:26, Jaegeuk Kim wrote:
> On 02/18, Shin'ichiro Kawasaki wrote:
> > From: Shin'ichiro Kawasaki via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
> > 
> > A lockdep WARN is observed recently under the following steps:
> > 
> > 1) Create a zoned TCMU device
> > 2) Create a f2fs filesystem on the zoned TCMU device and mount it
> > 3) Fill the filesystem with files and trigger GC
> > 4) Unmout the filesystem
> > 5) Remove the zoned TCMU device
> > 
> > The lockdep WARN indicates that a circular lock depedency formed by four
> > contexts, as described below.
> > 
> > a) TCMU device removal context:
> >  - call del_gendisk() to get q->q_usage_counter
> >  - call start_flush_work() to get work_completion of wb->dwork
> > b) f2fs writeback context:
> >  - in wb_workfn(), which holds work_completion of wb->dwork
> >  - call f2fs_balance_fs() to get sbi->gc_lock
> > c) f2fs vfs_write context:
> >  - call f2fs_gc() to get sbi->gc_lock
> >  - call f2fs_write_checkpoint() to get sbi->cp_global_sem
> > d) f2fs mount context:
> >  - call recover_fsync_data() to get sbi->cp_global_sem
> >  - call f2fs_check_and_fix_write_pointer() to call blkdev_report_zones()
> >    that goes down to blk_mq_alloc_request and get q->q_usage_counter
> > 
> > To suppress the WARN, cut the dependency d) between sbi->cp_global_sem
> > and q->q_usage_counter. For that purpose, move the
> > f2fs_check_and_fix_write_pointer() call outside of the critical section
> > of sbi->cp_global_sem in f2fs_recovery_fsync_data(). This change is fine
> > because the write pointer fix operation only affects the main segments
> > and does not interact with the check point metadata. Furthermore,
> > conflicts between the write pointer fix operation and data/node flush
> > operations remain protected by SBI_POR_DOING.
> > 
> > Fixes: c426d99127b1 ("f2fs: Check write pointer consistency of open zones")
> > Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> > Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> > ---
> >  fs/f2fs/recovery.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> > index a26071f2b0bc..87fd6cd436fe 100644
> > --- a/fs/f2fs/recovery.c
> > +++ b/fs/f2fs/recovery.c
> > @@ -922,6 +922,8 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
> >  		truncate_inode_pages_final(META_MAPPING(sbi));
> >  	}
> >  
> > +	f2fs_up_write_trace(&sbi->cp_global_sem, &lc);
> > +
> >  	/*
> >  	 * If fsync data succeeds or there is no fsync data to recover,
> >  	 * and the f2fs is not read only, check and fix zoned block devices'
> > @@ -933,8 +935,6 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
> >  	if (!err)
> >  		clear_sbi_flag(sbi, SBI_POR_DOING);
> >  
> > -	f2fs_up_write_trace(&sbi->cp_global_sem, &lc);
> > -
> 
> This was a guard to prevent checkpoint during f2fs_check_and_fix_write_pointer()
> where it changes the checkpoint as well?

I checked f2fs_check_and_fix_write_pointer() again, and it does not look
changing the checkpoint to me. FYI, here I show the rough function call chain
from f2fs_check_and_fix_write_pointer() as below. I guess this call chain does
not change the checkpoint, but if I misunderstand anything, please let me know.

 f2fs_check_and_fix_write_pointer()
  fix_curseg_write_pointer()
   do_fix_curseg_write_pointer()
    blkdev_report_zones()
     report_one_zone_cb()
    f2fs_allocate_new_section()
     __allocate_new_segment()
      new_curseg()
      locate_dirty_segment()
       __locate_dirty_segment()
       __remove_dirty_segment()
    check_zone_write_pointer()
     __f2fs_issue_discard_zone()
     blkdev_zone_mgmt()
     blkdev_issue_zeroout()
    __f2fs_issue_discard_zone()
  check_write_pointer(sbi)
   blkdev_report_zones()
    check_zone_writer_pointer_cb()
     check_zone_write_pointer()
      __f2fs_issue_discard_zone()
      blkdev_zone_mgmt()
      blkdev_issue_zeroout()

> 
> >  	/* let's drop all the directory inodes for clean checkpoint */
> >  	destroy_fsync_dnodes(&dir_list, err);
> >  
> > -- 
> > 2.49.0

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
