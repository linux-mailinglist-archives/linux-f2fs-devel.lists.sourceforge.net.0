Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 739183E23CA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Aug 2021 09:13:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBu2n-0005gs-QV; Fri, 06 Aug 2021 07:13:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <prvs=845ab97a1=Damien.LeMoal@wdc.com>)
 id 1mBu2W-0005gL-DX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 07:13:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MItu2RV6qEoS5clwfIg+1ivrJ4e9b2voI63SVjpD4Sc=; b=Ym7bqDmW9Ws3y26L7sWb85XO8+
 lzzHwZ9EVb4COY9VVe/3I/+fIKkD5iOQlEhNz7ExtTKmb5Dl2cUzAespg93jhP4VbSdztmXG6xVzG
 URUNoH6PhVmUWXpNnAZonbeKZlLzOAr9hlWoQTvIN97Ti0lQwYZ6tlLwMH8vUEMJ8ezI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MItu2RV6qEoS5clwfIg+1ivrJ4e9b2voI63SVjpD4Sc=; b=O
 uln/fpFv/4aDmR3/Lf5lJlVKUgNnz+Hw35hjHdyRqG7cvdjkAgO3rOfi5c95tEEDLA0WjL9PgePlx
 kZepZIH8FAXL6bCMD4tl76/XVbKll5TtosLNk71vRTU5dewuXLYZS4GJZ8a2NvO85W9Xk7VZw01Q4
 YZVSqLvscy5ZVGoQ=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBu2H-0004Zz-Je
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 07:13:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1628233974; x=1659769974;
 h=from:to:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=dHYXJv9MaKwYqHifuKfZtVKvkH9bD4nwkf9SX8hw95g=;
 b=h34XZyq/20KwzjYFYxkOIFcbTl8HWpum2qT11qzEjUqgN3a/TPb95/Io
 m9DwtcUJGQ9CDJAuoTQ4bMsOZ5QnAr3YXNXXPIKn1r27b8AXBR0iZAdbC
 29paIbHMSKKIhdXWkYIgq2AAwgDdq9Jcb8SJol9sU5NZAFkxb49N0yfZ3
 ME1CLMY+eI4Re7bfZaoYrSpIgorzAp0WcWBFJQYjzsaQ/TBgZy9B7hAD6
 ZPtpbnxCcCjIvSjkO2Ove9u5mA/DHTxhkLxLmQ1pAfDAmQ+ry7u+8vblc
 nHD7ndCI3WuR+FDSt0PP9BlbIIXobHTf/fVgDAptYqQ9cqUl2ovicgV3y A==;
X-IronPort-AV: E=Sophos;i="5.84,299,1620662400"; d="scan'208";a="177038675"
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hgst.iphmx.com with ESMTP; 06 Aug 2021 14:57:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVaoG+UZ/C5qFtyDBa/A5bM5pwgrV1uLgjoQj0bMzKK/odnzGEOd/T35VIpjq/D8hQGCFDIJRBz6Pjl4+fXwa6SnzczDz9xg57FPdxzY/D3jaD2Ge+VYpQmz7YMjxcEHLFsSZHzehBz+O9VYG+4aJtxzaa1W8ueYWfYJxXKGNZbjX79zk1YuEvDybmEqa5b3R+3aNvDRBKWbqzmi3y4mYZP18Ndn2uZvLsBSuzKFufd2lzhdasPQVpbRxz1Jh4+W54eK+QP5fO7EkC24mi9wGr3DqOe5Qv+aifNmPfpcky9i8NAFHjb7XWHVCVdeXcbUDzO3Nx9MCyoZ4GAVLqoL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MItu2RV6qEoS5clwfIg+1ivrJ4e9b2voI63SVjpD4Sc=;
 b=Y733RTxpu5vfn+TlCsTiXaAy897hRVwItdDMCSuhiQm3MaXJfyi0XePDgBEjsFFejWk0UiN7OSzSUBk7Nl78BSPsgHatGwxW+X/cpvagHFMzGP7V0oPBqQtFjtxD+VtgVf7HfQEQ52Nfq7I9W0+enLy4OMzTjRgZ/na1BtINQ/DMu/DW/EmnrngHey1rnBpBn3JEgFz1b44gO/gyfuajzutgmVgO51cElxT+DAh798tD+hgtIzX81VkMgtNNKnheoJd9X/JstMork7cIf7ffQH56kU2RGswxdKBP6+yEay6Xrk8lykF37NnENB5xg71j2bVMVbSirMS0Y1HUuNNMqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MItu2RV6qEoS5clwfIg+1ivrJ4e9b2voI63SVjpD4Sc=;
 b=HjaFrRVmdi7kqKiUD1Es226uZDaX8nBVsTDU128bylBW1cGPYz4lpyNyrj3CVRlfvphKqseYRNFDq/gww2O5gQ+PB6ifffQdBK+4U9b/r6Yk60WVSzpBmGsppZASQe6mNp4PD6xVmHByik3m5nOIWsiFzajkS9v+Mu4+NIDmYck=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM5PR04MB0445.namprd04.prod.outlook.com (2603:10b6:3:9e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 06:57:04 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::e521:352:1d70:31c]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::e521:352:1d70:31c%7]) with mapi id 15.20.4394.018; Fri, 6 Aug 2021
 06:57:04 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, Paolo Valente
 <paolo.valente@linaro.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v2 2/4] block: fix ioprio interface
Thread-Index: AQHXioGTfTnhIFrRQ0G1e/BGt4xSlQ==
Date: Fri, 6 Aug 2021 06:57:04 +0000
Message-ID: <DM6PR04MB70818B00518B40E671481E76E7F39@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <20210806051140.301127-1-damien.lemoal@wdc.com>
 <20210806051140.301127-3-damien.lemoal@wdc.com>
 <6fdc9b02-d03f-a63f-cefb-1d00ac42b885@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ccb00f6-4521-4ded-5d51-08d958a76645
x-ms-traffictypediagnostic: DM5PR04MB0445:
x-microsoft-antispam-prvs: <DM5PR04MB0445B11C78703A060BBDD069E7F39@DM5PR04MB0445.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2sqK/mc7Z0xEep4iqjMvV/i82yTddl9h0WDHyRwC7mEDa+m1qpqH2GmnWI13j1UjMXhWI87l7yHp5Mlul8YCHjRQ3LQ0lfdnIEgHrpBkQKVqQ4apyBr1jNkHRakB7mqMDzEn/KrkAKOpc9tfX577ZcS1quFKN+klna2mwWULuLuL06T02Zz53nLHu8dPUQOahvRTf6qq63Bt0XK6VLscYTr+y1acRuokzXLcyPj4zi0EUrWCnzatlyzWEciIr4RQBVrVX3TY02IjDxZ9gb6DLPm5j7nxGmR0pL4RA7WWNrcj/GzCbXoXDkLYlCU2xpZDbB/fuUvfr0rDvnEbi2i1Zyyxtne6Ty6mUObJw312Xci0Bby5hfNmbvQe2ZmaqpF7ysoKUdXaVeE/ff5OpgaSlWWOxeK5P7s/1uskwIcggbF3tDJQXkliN/xIaJmZIfRc8PvE3e7s9RJipqYCPd2XIABoOcn9U9lW4f/M/kiZYJ6ZiPJMVKChFAfFN0WP3QKHF7gEysCELq2ASBLa4FsgwRatvfqXuzPuvzI157rY4ytgf2uStETOCg5dauNIP9WNYeSX2rNFiRh/1EN4GX1Cqyu7/AqXuTCmbeUiRzH+5Bwt22E/jSvOkV+IcFmd0imXxdfmiFO5M1wIlFAErAK9L3q6yG2J9td4gDJ535332Qv+MNoOI+dqANY12VfcMMxImmMF4v1pQRXVahn5eu8R/g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(76116006)(478600001)(91956017)(186003)(2906002)(53546011)(6506007)(66556008)(33656002)(71200400001)(8676002)(122000001)(64756008)(38070700005)(66476007)(38100700002)(5660300002)(110136005)(8936002)(9686003)(55016002)(86362001)(66446008)(66946007)(316002)(7696005)(83380400001)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jKiHTnFXNLdyBCP9nmky7o+Bxqkh7ecFQOgufjNTOz5EYRw8DxjU0cTKgvNs?=
 =?us-ascii?Q?tAT1x1YHXaImMXfbkKT6f1MKVx+MayPFKHjeSvOXV+HlboQGuc1J/TOKZWWT?=
 =?us-ascii?Q?Srfnmm9pcj9Tum1LE3wQuL97s9b2w8LVwYtQFcnbv/qssrY/FT+6YG70FJF4?=
 =?us-ascii?Q?64VDNYZ8LtutLOqvQAKJRV/Yh8AiS929Bp1cK2pqQLm942uHMT1Mv6Zs8374?=
 =?us-ascii?Q?+IbmtUar9wkVwRs0DkO0iSKOWRRhPWnVV0kLaa1hOccqfo5TYG08+Ysui3sB?=
 =?us-ascii?Q?0r4+6eMNcElw7DO1ycfpyR6f/5d+yUsSNznmDmcQBUwfwiTtmMJzmkEkipD3?=
 =?us-ascii?Q?3V/gsjX/aX8lwo2dy314BrQvEX45z3R4+cU7vRWm3XPOyNkEWOSHlRuv8OM+?=
 =?us-ascii?Q?d+CumdXZ+lnGo9N8aiPzYdpGb3l57i56JwqzK/xK5WqQO80ywjgPvu4q8g6J?=
 =?us-ascii?Q?3mYFKJvXAhFW7b3qBkpc1kQ4mLVZRhHCL7oFjhQ2wvT/DeMuUmEeCyLYs8DD?=
 =?us-ascii?Q?kaPiOgdD+qY0KiAXAy4fvQqF5ysRv3onEZ4xLOJMoDTk8vFkUX+zqdlhaebw?=
 =?us-ascii?Q?lI3ZFMbriLiYtxEiiFlIkQIH2O+5AO+JvEp6ENuiddeG69zG2hN4fh34pDdc?=
 =?us-ascii?Q?aZV+h9m7MplivgvjAujyEs1oqNxihlN0X28UFerhqw31AX/hw4r8vCi++BMo?=
 =?us-ascii?Q?wr0yTDEo/M1RZSwzgYdSY5LErQpHpn9H/3WpGu8FAVCIhYaCoxS+RcmKPvjf?=
 =?us-ascii?Q?pGVYLYP423xAiJJjEhHwM/HnPQ+a0voqA1XkkiL7SenJS0m7cE1ZTB23HIeU?=
 =?us-ascii?Q?LmFF08zo0zyJTcvBKNyPAqoaZomi9EAZY82WzCmlpPcYMeLGza947qbWrmsb?=
 =?us-ascii?Q?XtHZF/sIEYVDQrXD90ObzqFIW4tywP0xoX3AONsJNXR+D3a8ClBBPbLNCa7U?=
 =?us-ascii?Q?2Gq9Kiwtcm+3QSy0/GbuKd3SF5w+NOZk0JlfqNDx55zbYpiOUb6XnAcGEFq8?=
 =?us-ascii?Q?i+x+nLswzoKTn3W3vaEcvaTDl63fEnEolU6GxawOdEo8HLP2oFfrICpgfZzB?=
 =?us-ascii?Q?zc+cAzastICEOrMuVCuUSxeD6fA0hIiTiQE7QxR+x0B5OzPEXQbbTD8MYWAL?=
 =?us-ascii?Q?K/GK0+5u192Nxu6mBXUd0rBk5Oalq8ljr74dQPoUETWFtUPa+RyYML9j9tNS?=
 =?us-ascii?Q?aERdBvLZhyd2K314d0cJuVySIksSdJftMMzkLMhcHzU6GKHh+SmYrxsaqApN?=
 =?us-ascii?Q?Vfd/38nuQuBYn7339F2w/1rBw9lGwMs7oPccTRogfeZMCIP/hTZD8SE7e3++?=
 =?us-ascii?Q?ufySNFutekIAYNikIU7ST/cuLCzH/ue9a2oLiAmm/ejjKOal4zZnKBQDz3pt?=
 =?us-ascii?Q?ilqS7FI0PTLth4iDVReBIiDp3SKx3CUlmr0NOYXpK9QPZ2vYEg=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ccb00f6-4521-4ded-5d51-08d958a76645
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2021 06:57:04.7802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ibYV+a7ht7bUOmToWePuFmSs0MP2XGUwI6AaFwxS+XWUspmfXLMt8eOyJglnhDVk1dYH9iAB4ajXStWUqrtXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0445
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [216.71.154.45 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mBu2H-0004Zz-Je
Subject: Re: [f2fs-dev] [PATCH v2 2/4] block: fix ioprio interface
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/08/06 15:35, Hannes Reinecke wrote:
> On 8/6/21 7:11 AM, Damien Le Moal wrote:
>> An iocb aio_reqprio field is 16-bits (u16) but often handled as an int
>> in the block layer. E.g. ioprio_check_cap() takes an int as argument.
>> With such implicit int casting function calls, the upper 16-bits of the
>> int argument may be left uninitialized by the compiler, resulting in
>> invalid values for the IOPRIO_PRIO_CLASS() macro (garbage upper bits)
>> and in an error return for functions such as ioprio_check_cap().
>>
>> Fix this by masking the result of the shift by IOPRIO_CLASS_SHIFT bits
>> in the IOPRIO_PRIO_CLASS() macro. The new macro IOPRIO_CLASS_MASK
>> defines the 3-bits mask for the priority class.
>>
>> While at it, cleanup the following:
>> * Apply the mask IOPRIO_PRIO_MASK to the data argument of the
>>    IOPRIO_PRIO_VALUE() macro to ignore upper bits of the data value.
>> * Remove unnecessary parenthesis around fixed values in the macro
>>    definitions in include/uapi/linux/ioprio.h.
>> * Update the outdated mention of CFQ in the comment describing priority
>>    classes and instead mention BFQ and mq-deadline.
>> * Change the argument name of the IOPRIO_PRIO_CLASS() and
>>    IOPRIO_PRIO_DATA() macros from "mask" to "ioprio" to reflect the fact
>>    that an IO priority value should be passed rather than a mask.
>> * Change the ioprio_valid() macro into an inline function, adding a
>>    check on the maximum value of the class of a priority value as
>>    defined by the IOPRIO_CLASS_MAX enum value. Move this function to
>>    the kernel side in include/linux/ioprio.h.
>> * Remove the unnecessary "else" after the return statements in
>>    task_nice_ioclass().
>>
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> ---
>>   include/linux/ioprio.h      | 15 ++++++++++++---
>>   include/uapi/linux/ioprio.h | 19 +++++++++++--------
>>   2 files changed, 23 insertions(+), 11 deletions(-)
>>
>> diff --git a/include/linux/ioprio.h b/include/linux/ioprio.h
>> index ef9ad4fb245f..9b3a6d8172b4 100644
>> --- a/include/linux/ioprio.h
>> +++ b/include/linux/ioprio.h
>> @@ -8,6 +8,16 @@
>>   
>>   #include <uapi/linux/ioprio.h>
>>   
>> +/*
>> + * Check that a priority value has a valid class.
>> + */
>> +static inline bool ioprio_valid(unsigned short ioprio)
> 
> Wouldn't it be better to use 'u16' here as type, as we're relying on the 
> number of bits?

Other functions in block/ioprio.c and in include/linux/ioprio.h use "unsigned
short", so I followed. But many functions, if not most, use "int". This is all a
bit of a mess. I think we need a "typedef ioprio_t u16;" to clean things up. But
there are a lot of places to fix. I can add such patch... Worth it ?

> 
>> +{
>> +	unsigned short class = IOPRIO_PRIO_CLASS(ioprio);
>> +
>> +	return class > IOPRIO_CLASS_NONE && class < IOPRIO_CLASS_MAX;
>> +}
>> +
>>   /*
>>    * if process has set io priority explicitly, use that. if not, convert
>>    * the cpu scheduler nice value to an io priority
>> @@ -25,10 +35,9 @@ static inline int task_nice_ioclass(struct task_struct *task)
>>   {
>>   	if (task->policy == SCHED_IDLE)
>>   		return IOPRIO_CLASS_IDLE;
>> -	else if (task_is_realtime(task))
>> +	if (task_is_realtime(task))
>>   		return IOPRIO_CLASS_RT;
>> -	else
>> -		return IOPRIO_CLASS_BE;
>> +	return IOPRIO_CLASS_BE;
>>   }
>>   
>>   /*
>> diff --git a/include/uapi/linux/ioprio.h b/include/uapi/linux/ioprio.h
>> index 77b17e08b0da..abc40965aa96 100644
>> --- a/include/uapi/linux/ioprio.h
>> +++ b/include/uapi/linux/ioprio.h
>> @@ -5,12 +5,15 @@
>>   /*
>>    * Gives us 8 prio classes with 13-bits of data for each class
>>    */
>> -#define IOPRIO_CLASS_SHIFT	(13)
>> +#define IOPRIO_CLASS_SHIFT	13
>> +#define IOPRIO_CLASS_MASK	0x07
>>   #define IOPRIO_PRIO_MASK	((1UL << IOPRIO_CLASS_SHIFT) - 1)
>>   
>> -#define IOPRIO_PRIO_CLASS(mask)	((mask) >> IOPRIO_CLASS_SHIFT)
>> -#define IOPRIO_PRIO_DATA(mask)	((mask) & IOPRIO_PRIO_MASK)
>> -#define IOPRIO_PRIO_VALUE(class, data)	(((class) << IOPRIO_CLASS_SHIFT) | data)
>> +#define IOPRIO_PRIO_CLASS(ioprio)	\
>> +	(((ioprio) >> IOPRIO_CLASS_SHIFT) & IOPRIO_CLASS_MASK)
>> +#define IOPRIO_PRIO_DATA(ioprio)	((ioprio) & IOPRIO_PRIO_MASK)
>> +#define IOPRIO_PRIO_VALUE(class, data)	\
>> +	(((class) << IOPRIO_CLASS_SHIFT) | ((data) & IOPRIO_PRIO_MASK))
>>   
>>   /*
>>    * These are the io priority groups as implemented by CFQ. RT is the realtime
>> @@ -23,14 +26,14 @@ enum {
>>   	IOPRIO_CLASS_RT,
>>   	IOPRIO_CLASS_BE,
>>   	IOPRIO_CLASS_IDLE,
>> -};
>>   
>> -#define ioprio_valid(mask)	(IOPRIO_PRIO_CLASS((mask)) != IOPRIO_CLASS_NONE)
>> +	IOPRIO_CLASS_MAX,
>> +};
>>   
>>   /*
>>    * 8 best effort priority levels are supported
>>    */
>> -#define IOPRIO_BE_NR	(8)
>> +#define IOPRIO_BE_NR	8
>>   
>>   enum {
>>   	IOPRIO_WHO_PROCESS = 1,
>> @@ -41,6 +44,6 @@ enum {
>>   /*
>>    * Fallback BE prioritye@su
>>    */
>> -#define IOPRIO_NORM	(4)
>> +#define IOPRIO_NORM	4
>>   
>>   #endif /* _UAPI_LINUX_IOPRIO_H */
>>
> Other than that:
> 
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> 
> Cheers,
> 
> Hannes
> 


-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
