Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7B0507E20
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Apr 2022 03:28:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngz8S-00075Y-Go; Wed, 20 Apr 2022 01:27:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <xuyang2018.jy@fujitsu.com>) id 1ngz8R-00075S-5B
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 01:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fGvdzhGdKopQh1a7OYLriTI1e3NOhITqSKG3ZAB2tsc=; b=mtq4nH+KhAY1WxmrrBRVi4P+Zi
 SS9DpG1xyn92+hzTQkDWWlX3JeEJJngWZ/GPmD/hctjuQnukpcjKmJYCd1FGQj/TC2KmIE28qBfY7
 P1nGyN7PocRQTztvX6UZSk0ABYDYiK+767/8EMcc65iIlIMewWvHrbIpKan7uVMkmOos=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fGvdzhGdKopQh1a7OYLriTI1e3NOhITqSKG3ZAB2tsc=; b=AZ8h8aJJoPos4Qo+MmsOqGLZSA
 ie2FH4zFoWP7Sj7ufEq5oGxJRGRD2sn8VBaug6TOJ1StzyQNg5aImmJ7HyC1vfvjAZswnFp1a1CkH
 BUNJpMf6ILfLPqzOuQLlb/IezGx/zBLjSt9PCqYar5VMRN/vTBtlAE8IdgFuKjF/VoLQ=;
Received: from esa9.fujitsucc.c3s2.iphmx.com ([68.232.159.90])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngz8L-004JL9-LL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 01:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1650418074; x=1681954074;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fGvdzhGdKopQh1a7OYLriTI1e3NOhITqSKG3ZAB2tsc=;
 b=NNPqGXwD5sVmVkFpoVd4E30FqV58zhrag1XRmZEn+sEXHS2VGZeQPlUV
 x7Us17uXOue02oMSPw+PASgnaWfJKr/WOPzvPDZ+ozSvwKa+8DpgXLilQ
 gtEiEdmDXn6ZnziCyySW0PK4fvim9Sq972Ew2Y/zmlIrnLFZndy5Vv2IM
 biV6ZDsXTf+Yw0nDStmiMSpqD7/VigUVvrxY/zF3o07DFWZvlgp1wLP6X
 gpM30M+cDX9UoRSH1k4V9XLecokKaEtsj5HkpsOITnvLLz5LMyjMzucRz
 3KS7ZvsJhHDKg4moKiDZmV9n6XsVJ5VY8s3GfCAI63sUNDgYmjYEfU02r A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="54387674"
X-IronPort-AV: E=Sophos;i="5.90,274,1643641200"; d="scan'208";a="54387674"
Received: from mail-os0jpn01lp2110.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.110])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 10:27:44 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBQwRxfUuc7x9ASDjYEPXrt8K/JHPZ6zVJrEH9tnEBxzlMd/KXWrlwDcPtqKqWcVMZMw/i3KgIg3hwv6nLRgAijTVQS1UAUFHxC6Q0HV36U6aQbloWmJ7j3hQqwoEdDSWhmFfB48p4BedGzks9fKAUAjPOJvce6b1GA46izt8PeZnCVuqCbQh7eHJK2ES9a+SOtIjHH5w6+Zmt2eHXUZ+CqpJcqQzyZYi69KRQ7kkF2FikBD1F7jASHcpYrdrYE70ydRxJOScSACp7aCMVeF12/z84ubGhAFPMwMwkV/PkuEiaeWRcAfddFlbVIS7LpxpsXDtgJIFnFP8hsb5ywxRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGvdzhGdKopQh1a7OYLriTI1e3NOhITqSKG3ZAB2tsc=;
 b=Bx4fm1m87LV1tYROUy6D/m0yPKi3KwkOBCGPJOX7hZMIUzfJkI0hhv5Mf62xHBA1ubyEBPKkDleZPJZxZcxei4KAb/18+KOm48eIKt0GKyfJHqxA5XaI8BYxd7jn/wDKpAhHTIEpeZ+55JyCX/NwgBaZF/iTaRysnSIxFMbo1xgdyRwT1dYqYGV0MBZYiqhXxRz4sLPsOwj1cffdapXALCrK14xVcLTp0fYONDSoVujvM8IA0Ca2mI67VY7PQCAKUF+A2rV5xAaJ3iS1caa+1/jVDXwenL9WzvbY+vibOe/hhcAVfswBuUdZ4l5Gi5uQyQnudgGHEvYxHkJ63meQAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGvdzhGdKopQh1a7OYLriTI1e3NOhITqSKG3ZAB2tsc=;
 b=J3hu6ABqgnxq0qmhJ28ppzMHqiJJA+Uh4ISJLS9W+63vr1Nvz4VZ/ez9vlx+i0aJ/SG3xSUtOxW/i8u37bxeUgFcbGjDQbp7pHjanVYMetDQpUrfnJBZnQnYNjz4MYcP+oE5DMs3HMq6hTI6GlMC2ZLsX7McUet4gJN/8CYxDPM=
Received: from TY2PR01MB4427.jpnprd01.prod.outlook.com (2603:1096:404:10d::20)
 by OSAPR01MB2689.jpnprd01.prod.outlook.com (2603:1096:604:1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 01:27:39 +0000
Received: from TY2PR01MB4427.jpnprd01.prod.outlook.com
 ([fe80::fca9:dcb9:88b4:40fd]) by TY2PR01MB4427.jpnprd01.prod.outlook.com
 ([fe80::fca9:dcb9:88b4:40fd%7]) with mapi id 15.20.5164.026; Wed, 20 Apr 2022
 01:27:39 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Christian Brauner <brauner@kernel.org>
Thread-Topic: [PATCH v4 1/8] fs: move sgid strip operation from
 inode_init_owner into inode_sgid_strip
Thread-Index: AQHYU9rGMcoXoXAhFUC0+s6Sqe+NAqz3RT4AgADPzgA=
Date: Wed, 20 Apr 2022 01:27:39 +0000
Message-ID: <625F6FE6.4010305@fujitsu.com>
References: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <20220419140508.b6c4uit3u5hmdql4@wittgenstein>
In-Reply-To: <20220419140508.b6c4uit3u5hmdql4@wittgenstein>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 435481f6-8261-4f1a-1758-08da226cf575
x-ms-traffictypediagnostic: OSAPR01MB2689:EE_
x-microsoft-antispam-prvs: <OSAPR01MB268903EDE05D2131C76484E5FDF59@OSAPR01MB2689.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7+0fD1+GQW1OSEc1HsHRR76qffGIVob8vPsHyR2nHrY2WIcRbOOmYS4z5RuUUgFCMDKoyHc5na2BtSuVLUk2jRuLNDIctHOpAK+6EJsXTXz2T2H0S2+50BjpBENoeyAMdDE0m9uE0tY2SpfQspTmOIH6LYTdpoSEGcjMq9ql8UR0iiJ0CKbc3euuVb+Sj3xZ0YEnuThLS/SiOCxXyB2kra158UWiXVqzFm1gDk3Lr64oUwQLZzJB8GueA3eIMqmU3WhKVIor9rsSTubzO2XwmVT39CpRcvTm0x4h4D7aDvigubgiSrxd/oHFGl+zvdzkYy85OqXKGOUUUoKTJPfz2kDj8GTuYDACrkG3RTXWEKsA5oNpdgJyT9lVHvInMAaZW+QYAlfjCxcvhK8K+SGLaD9zpNDz3he3gp4PtR1X2TUEcQmEObkcNhrwm/i5ck+2cEBrGkl0PCxmOysfQjZ+ZBv1q0KOmSXqllX+G+1MMPn5ehSQxw0P6RsFqcWg9w1EO+fM1Peh13ydsRZt3EI1duNmvpYArzUkgZlaUNCxoVj3hTs+9SHmjEjSVNgtzt119HKqI/iFBmx3Qi4a3ZbvXf4N/OuHRZ4m7fnnu1a165lfFmW16GyMHvNzx6bVKFObV6T+S/kFU6RP3Z6GRuTutVAjpCq9UpWh+dnte5erexIEKWPeJleEitqfRff/dxEREm5Gb1Yq4dyinJbCZAnygw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB4427.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(82960400001)(26005)(87266011)(4326008)(6506007)(6486002)(5660300002)(508600001)(38100700002)(7416002)(38070700005)(2906002)(8936002)(33656002)(122000001)(45080400002)(186003)(86362001)(6512007)(83380400001)(2616005)(316002)(85182001)(8676002)(54906003)(64756008)(66446008)(91956017)(6916009)(71200400001)(66946007)(76116006)(36756003)(66556008)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGQ3cVBPY3VSVTFQZjBQME5manl3ZklkZDBJejBKK3AzamxtNGdrQ2xjU2R3?=
 =?utf-8?B?SVVKZ0tVNEZZNHd2M0lpR2ZVUmZRazhGL3VNUncwR0lJQTdlbG9SbStxdG85?=
 =?utf-8?B?WHN4VkxyZmxsczhtTTI0WkQxVnBRcnN3TG1pL0ZmQ3NzbEhwUzdQc3krbkFv?=
 =?utf-8?B?bll6Wk5ENEJvQnZ6M2xNNWZteVlyZUxGZ05GL1RjaXBYeFhqU1dTTHp3UDQ5?=
 =?utf-8?B?OXpPcHZIMEg5YVdvM2M5ZEdGODZleVhpOEVLUktJUkNPSzFtd0JvMnZ1YTJT?=
 =?utf-8?B?ZVZ2Q3RaLzJiWFl1eUlSOG1ZekdCSFJoN3BtZmlnZTgzYmF4S2JVTnBpMVZU?=
 =?utf-8?B?bUQvZmdyNWZ6ejJVTXlySjBneVpBYXBMQlljVC9TU0xTTENZNUxOd1dGL1BT?=
 =?utf-8?B?MFpxcUc4TmVqazdDOGRRQXgzSVdVOXQrQ3FBbDV4OUxyTzdyZzhlc3IySHBD?=
 =?utf-8?B?SmR0UmxLaGhIYmp5anRGcGNNVE5xRENMb1pBS085b2hQcllReXpNellPdFVq?=
 =?utf-8?B?UjN3cTVlV1V0Q2VYWlFhcnBQWU5KTU4yZ3BhanA2Ykt6Sm13RVRVWDhiRHo0?=
 =?utf-8?B?SHBEWmN3YnFLaXdnUUZhdFpZcE1sZW1oZXFSWDkzb1JoSnhka2lIMlByaEVL?=
 =?utf-8?B?dDh4QnpLdHdZVlVlZzJPVGJ6YlJEdGxEdTgzMTNLWEcxYXpSbk9CVDErQ1c3?=
 =?utf-8?B?Y0s0YzR4SWlKeW1jVXpwWHVVcXo2c1JvN1BDNkpFMWZucUxwbXdReDYraGFK?=
 =?utf-8?B?WDNSWldXMzBYczdjWnM0SGFlQWxzMGRRQUVPQ013VlM3OVg2ZmpEYU4zTmNk?=
 =?utf-8?B?WUd0TVlCRUUxRzcyYzdWNktlWkU2ajlvUWtUWUZFZ3FmbGRjNWxCa3hpZStZ?=
 =?utf-8?B?d1NmU09mSFpjazJnODRld1BjVlMyeWdXeEpnOVdKYW9DSWpnNUNoWFp6MjE5?=
 =?utf-8?B?WHdJQ1A5WEpIUnNyYkRZQ05XTEN0akEvbXQwdmJnazVTT00zVUdtL1FqYWl6?=
 =?utf-8?B?OGc0VlVER2FGK1pyZFcydTE2ZCtydTV3NnlkVUhGaUdqbVFmL3FZenhCTEV6?=
 =?utf-8?B?UHcvZDNsVGxrVk13RHZtVWFaQXF0QU1XUVl0ZkNQZ0tkSVIvbmEzK3lpWU5k?=
 =?utf-8?B?NE41YW96RjlGb2gyak1VbFZZanZFZ3FJV0NISnZBdlJlYUV6bjRKN2REVENw?=
 =?utf-8?B?VGFObTdWcDBsbUdORmFOWGVVUk95ODQ3b0JscnZlTDZybVl0bjRNQk5sY0s3?=
 =?utf-8?B?bHprRXZqQ3JKb1lOenJ2YkhpcXUwcDVWeFpmcnFjRlhLR043OG5WNHlrWFNr?=
 =?utf-8?B?czBEdzhPS0lRUFpDVS9MNmtnYjlsTUVLaGYyL0M4Sm5ZZ2dQSVRlVG1uMFg1?=
 =?utf-8?B?WHZCOTBWU1FiT3loNzZDamRXSDhFZFF6NEZGc1h4U3oya3VBOW9KekFiOTF2?=
 =?utf-8?B?S0xwNTU0R0JzekZ4TUJXL2VGTWlkQ0crbWhKN1ZqY1NoVExDMldZNXllSjFz?=
 =?utf-8?B?MjVROVEzTklrcEJJU1hqZk9icGdGVkpIZzAvVDg5Rk1CQW5yUFRtdCtyeFZr?=
 =?utf-8?B?cFJJNlY1LzFQR3N2TnphYXpFNlh3OHFPV2dqblhrSkFmd3grWjc1WVVaR2pk?=
 =?utf-8?B?dVVRTU52bmUyTnVxU2dnV3BldHhOYXE4akFyUzNhT1NOcERIWlZNdkg1SW4w?=
 =?utf-8?B?M1FGaVRJZDVWU2hGd1Fvc2xvSnBITCtxbm5ZSTVyYjVTeWRwenFyZmtCaGwy?=
 =?utf-8?B?TWRsM3Q0YVR2bysxN1U0UDFTeWZNSkx4M29NUzRYMWpCa21ybjE0ZldLa0dD?=
 =?utf-8?B?RTAvZUxxbkVycHFCSW8wcjNZemtpVnJJMXJ3Mm1hekkzYlpjWVpQQ2NqVWpR?=
 =?utf-8?B?bVVZUDFXcmN6NUo2ckFWcFc0TmRUUkRPZW5zRUdUTjkwbktMNjI1Y2paNmo5?=
 =?utf-8?B?KzdqSDVwSEM3MTRZUE9KcnV2ZXBpVVZyRGJrQit4bzJ5YlVNbnZySEJKZXVw?=
 =?utf-8?B?YkZCNDJUTTNpSHZJNDZmZGsyM2dVODBLS2pUSXlFeXJONmduQ044OE9lOTI4?=
 =?utf-8?B?RTNnTmJWZWlTVlI0MEgzVzFmMDd3Vk1lTDA2RTVqQ2xXM3dYcXVWN01iT0Ju?=
 =?utf-8?B?QVQzTmZJMzVzalhLK1ppTUlSTnlJcDZwM0VmUlZzZEFnemZKTm9lK0pFV2dt?=
 =?utf-8?B?a0c0TDA1UStFcUVnN0pZUXBpS0tHT0pKSmJNQmVCQmdHQm5Hczgxdk1IT1RG?=
 =?utf-8?B?TDJJTVJaM3FQZFcrajFtQytGd1lNbHA0TXdwanNZRFE1YnkyelcxVTh6SDRv?=
 =?utf-8?B?TEJGMlFXRFRPZlJ5NHRRRmZsZFAwU3dWTjNoZHl0RzlNZy9xOEl6ZTZxOURu?=
 =?utf-8?Q?cQxMLZPP/LEyoR3InHaurQSq4IKs5ANe4sXET?=
Content-ID: <4BDC29D4A3266544A4D1B5506A11F6AD@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB4427.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 435481f6-8261-4f1a-1758-08da226cf575
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 01:27:39.5469 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0JqUUgRldlvTuP8/VQ6r9PuDJkz3psCXhuazGIrsdXkPdMcgYvqRYAZw+oRw8EL/3Heza1FbsAgH4bZwHd6L9VSHry4SPtlz5Emzc+5BEpo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2689
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  on 2022/4/19 22:05, Christian Brauner wrote: > On Tue, Apr
 19, 2022 at 07:47:07PM +0800, Yang Xu wrote: >> This has no functional change.
 Just create and export inode_sgid_strip api for >> the subsequ [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [68.232.159.90 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1ngz8L-004JL9-LL
Subject: Re: [f2fs-dev] [PATCH v4 1/8] fs: move sgid strip operation from
 inode_init_owner into inode_sgid_strip
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
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "djwong@kernel.org" <djwong@kernel.org>,
 "david@fromorbit.com" <david@fromorbit.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "jlayton@kernel.org" <jlayton@kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

on 2022/4/19 22:05, Christian Brauner wrote:
> On Tue, Apr 19, 2022 at 07:47:07PM +0800, Yang Xu wrote:
>> This has no functional change. Just create and export inode_sgid_strip api for
>> the subsequent patch. This function is used to strip S_ISGID mode when init
>> a new inode.
>>
>> Acked-by: Christian Brauner (Microsoft)<brauner@kernel.org>
>> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
>> ---
>>   fs/inode.c         | 22 ++++++++++++++++++----
>>   include/linux/fs.h |  3 ++-
>>   2 files changed, 20 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/inode.c b/fs/inode.c
>> index 9d9b422504d1..3215e61a0021 100644
>> --- a/fs/inode.c
>> +++ b/fs/inode.c
>> @@ -2246,10 +2246,8 @@ void inode_init_owner(struct user_namespace *mnt_userns, struct inode *inode,
>>   		/* Directories are special, and always inherit S_ISGID */
>>   		if (S_ISDIR(mode))
>>   			mode |= S_ISGID;
>> -		else if ((mode&  (S_ISGID | S_IXGRP)) == (S_ISGID | S_IXGRP)&&
>> -			 !in_group_p(i_gid_into_mnt(mnt_userns, dir))&&
>> -			 !capable_wrt_inode_uidgid(mnt_userns, dir, CAP_FSETID))
>> -			mode&= ~S_ISGID;
>> +		else
>> +			inode_sgid_strip(mnt_userns, dir,&mode);
>>   	} else
>>   		inode_fsgid_set(inode, mnt_userns);
>>   	inode->i_mode = mode;
>> @@ -2405,3 +2403,19 @@ struct timespec64 current_time(struct inode *inode)
>>   	return timestamp_truncate(now, inode);
>>   }
>>   EXPORT_SYMBOL(current_time);
>> +
>> +void inode_sgid_strip(struct user_namespace *mnt_userns,
>> +		      const struct inode *dir, umode_t *mode)
>> +{
>
> I think with Willy agreeing in an earlier version with me and you
> needing to resend anyway I'd say have this return umode_t instead of
> passing a pointer.

IMO, I am fine with your and Willy way. But I need a reason otherwise
I can't convince myself why not use mode pointer directly.

I have asked you and Willy before why return umode_t value is better, 
why not modify mode pointer directly? Since we have use mode as 
argument, why not modify mode pointer directly in function?

Also the function name(inode_sgid_strip and prepare_mode) has  expressed 
their function clearly.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
