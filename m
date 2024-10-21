Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBE59A594C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Oct 2024 05:43:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t2jKI-00076T-NC;
	Mon, 21 Oct 2024 03:43:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hanqi@vivo.com>) id 1t2jKF-00076J-UX
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Oct 2024 03:43:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Do219L7eqeuoIxF/on6+vtahehP2a2LJSVjm2dMbkI0=; b=ZAGjB99Ps9ybUn5DGc0nnqL+yU
 u3jXMqtcXswAnvyJXGbqvXDLDNhHE+a7j9yGm9F+MLdF5bPA6+f4lO+c+vLNUe60//YNAgzi3Dge4
 XUD7PDldwbSk9JjQSe+UGsWPhUU/MOHXF37ckRs7UeKUCr/xwyuuiDAMMA0XkEXkcpQw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Do219L7eqeuoIxF/on6+vtahehP2a2LJSVjm2dMbkI0=; b=MICsD1gc2CgxX4dfXjofADvYfi
 qr+ZLgIINXGyWWQazq0swtwAcsWZPS+KKK219rR1f3zN+tiMody5CSG2f7mJfLnAIZmbVCd1uxjj+
 F53JEovJk4ml23a94RlhPU7KqIFWHuoKJnua4v5keVZbfGmLm9XalwM8l6vOwasTjoLQ=;
Received: from mail-eastasiaazon11010018.outbound.protection.outlook.com
 ([52.101.128.18] helo=HK2PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t2jKE-0001tw-6k for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Oct 2024 03:43:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k444ZwjiUsuXQ8vCYT9f5eULRR12JgTkzWogi+Znl1hF0lTKKW0rdGa0OjvABReXedzjAF36NyFPb+HU+mgpMggSmD+ZBN+XbtYC9e9iYhwMfwhIf6Ua2KiP8OzuKfcN64NqQdB1Kyxqpd823JBt6kRLj42u/qxadmwDQOOc116TrYqto5+QDxdVXt/tDv6i89NZFDfSiAe77I/LN9E9gUiGT1t/aq9ac4POxANXsxOy0xmHKy/arUaemPnqgMcjmZoT44yZqqPPCIM7E9/e3C8ki3kIoO4cjNS8OyqWdYWh1mrZ6EYXadsJ6/8SQA6YGym8Zj+3NkQKcXrE5rksgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Do219L7eqeuoIxF/on6+vtahehP2a2LJSVjm2dMbkI0=;
 b=SjHew6NA8YMfUy1GYEWqsT9olgT0Ph3m2dqp4xjXlQr19k1Q9JS1kolRnCp9Y8wYPTVYwBvUcR2MFAGXUd4eVdyz7AjqJ9Pxi+VBR0ehQs3NT6iTaJo9LvShwREKGqCquNCiOJeY2Jf6UojBA7r/ajHKpwPaeoYFccMHt5p4lcesxq0t5lBgSeND6tGBizUBcFSV7/HI31cdTEjBZDvWgXVh20Ea7jDoZe8K+4rivc2BOkpkC2TkbNpX3Zf7mkWLT9RcPtltaUIju+I8g6nrUXc4HKRklKbtiDD1npj0r1dx0tcvz9JfOMPu85jbbiWikPzdDtWamCiblHDu9BW3JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Do219L7eqeuoIxF/on6+vtahehP2a2LJSVjm2dMbkI0=;
 b=R9ea4glUwLRN81s1QeP66yn/dkmODPuJpjVy82zL0e1PrZQ0DLeOIZsYUC7p1CrAvcE4KUZg8XwTHoD8Jb6afi0AH7+pw/wwOjzNhaMPLQFTwC8JRIb/ZhsryLIHl8J+ZjyQjgjjKlfPHBqYgJ2AwdoN+WVDUbcH+QEz81ulGPRf6LGxo4XoHOz4ZAKbUqMpzr0BB/2CNIYEUJa8mb2cFdigMYfLk/Ie0Lmhf/mq5QB2HO2Xw2vqE1Zwma/knGDEThDW4onEGsNHSJoxh0RtGwdXKIERczuW0gTjY4oxQC99BASLj1by0QScv5lbQP5oQoT3EgxhFvSeluws4ZLYSA==
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com (2603:1096:101:228::14)
 by SEYPR06MB5326.apcprd06.prod.outlook.com (2603:1096:101:6b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.15; Mon, 21 Oct
 2024 03:43:06 +0000
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0]) by SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0%6]) with mapi id 15.20.8093.014; Mon, 21 Oct 2024
 03:43:06 +0000
To: Zhiguo Niu <niuzhiguo84@gmail.com>, Chao Yu <chao@kernel.org>
Thread-Topic: [f2fs-dev] [PATCH] f2fs: modify f2fs_is_checkpoint_ready logic
 to allow more data to be written with the CP disable
Thread-Index: AQHbGjOl9uPnM3AaYEqxY543nx+w4bKKwLqAgAELyACABNXEAA==
Date: Mon, 21 Oct 2024 03:43:06 +0000
Message-ID: <44e62c9f-8f11-461e-99cf-bfeb81ca4984@vivo.com>
References: <20241009102745.1390935-1-hanqi@vivo.com>
 <bdd890de-4794-4133-bca1-9c7e067e6e5c@kernel.org>
 <CAHJ8P3KhfuCSNwyc16QYQQYMNzjVKc4ey5CTZ2XK4893aW4mCQ@mail.gmail.com>
In-Reply-To: <CAHJ8P3KhfuCSNwyc16QYQQYMNzjVKc4ey5CTZ2XK4893aW4mCQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB7140:EE_|SEYPR06MB5326:EE_
x-ms-office365-filtering-correlation-id: ffbd915a-ba15-4ca9-7964-08dcf182798c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Z2h2ZmRQc1JsWnI1T0EyNTljQ1hvcFUyS2JKQ3VjdkpPMHgvUlFtS0dadnJC?=
 =?utf-8?B?Sk9xZThpQlI2cFZKNlVGcitNeWVxSWtBVkVpd3NSVEhadkw5S3FZSVBJNXJL?=
 =?utf-8?B?NUwxckRFbDBpcVBOdWlpbkFPeE9qd2ttblA0WjR2Sk5TUHZ4UEJadXViZTA3?=
 =?utf-8?B?Ykpxa3FHSUFETFVOdkV0VTRGRDY5ZTRPSjFSVDRSaEUrOHozOFZRcVlFdU1z?=
 =?utf-8?B?RUVWd2QyeTRFQ3VoRE5yMEFRTGxhdCtjYkN4L1RpMWg5S0krUWhUSVFOK05i?=
 =?utf-8?B?MDV4eDlnSHYwWWwzSDhNWkdVSDBzbFRDUE9kMkRzcmEyTm9VbW42V0Zvc1hU?=
 =?utf-8?B?NWtaNzRzaFNjcVB0VU1xNzVuT0FsOElTbjM3c3dQVjlxTUFTeExEWDB0WjQr?=
 =?utf-8?B?bWJqUlN2cVFIZDJPZGVhajRMQkFaaEt1YUdhSDdJNGZXbkczcXJDbWc4bGZC?=
 =?utf-8?B?ZVNQeEI0VEZVNEpNU2NUb3RoUHJEOHhMM1lxT1ppLzhvL1NWU3lJYndYRlMx?=
 =?utf-8?B?MXJXNklJclRKQnRoanZIeHVvLzFPeTFzbHAzRGFmSXRDMmhVUTRnZEVTQ2No?=
 =?utf-8?B?eHhQZU4zWmRLTGczaUlmV1hCeENWeEhYZHJPSTRBcXY3d0VTVXcwbll1S2d5?=
 =?utf-8?B?b0hBaDJGNlVlbnpNT0QxdXd3YUFoYmpvWEEyZ3czZFBHbWhXd05xampnQ0hr?=
 =?utf-8?B?U3BpUjZINkJaUThzRjlBbHNYK1FTRmtNMWdRZzJYRHZraFZJdTFJS2FJcmVV?=
 =?utf-8?B?SXhQSEY3bGdodHBkY1RMVTZtU1Q0Q1lWV3dySVNsWFNHbWlGdjVuWTZIQ0JB?=
 =?utf-8?B?WGdSVDl2aTJNTkU2a2pIMDZYZi9rcmltdHdEYTlQbG1QRzRXRnNoRTVrQkcz?=
 =?utf-8?B?eGVGVG54ZzlQYmd5dTgxb1ZsREY0YlF4V3JGeDJkMUI0NWRIOTVkaFhGSU02?=
 =?utf-8?B?d0xZd3VCUEJXR3BLb09BaEdaejFNTmlhY2VuM0ZLSllxRi9HVCtKb2R3cVh6?=
 =?utf-8?B?NSt0LzRjaFkwdC96VzZ2RGtqWlJSZHFXRmRxN1Z3NUpEVEloNnBjSllzWE9o?=
 =?utf-8?B?bjBTbG1TQU42OEdBdmI0U2NCMWJvcjBodjg5d0k3RDhod3FmVjhiNjNyMFhq?=
 =?utf-8?B?N0tEcHJSc1FmN21uQlNMbEU3UDlGQ29abytVSDByN2hlUWxhUFpLU0xtdFU1?=
 =?utf-8?B?eGovUjc4a2VKSTcveGNGR01LR2NxQ0JqOVNHQ3RFelJhOVpabVlpWC9QNTh2?=
 =?utf-8?B?U0FFd2x2NS9Iekd5dVcxdWFDY2piTGl0SW9Qa2hxcW1XUUFSNGhUalZTT1Ew?=
 =?utf-8?B?QzBJUGFMcU41QUZNV0w2VG85dEZQVDNtcERZOTNnUUV5ZjlGUU1lK3hsOG51?=
 =?utf-8?B?N3d6czh6blFVbVAyN2srM0dBQVVxQ2o3Z3JNci96ZXYvM1JidlpScDRjUVVP?=
 =?utf-8?B?V2RPTTZUcVZVYmdISlNGNFR5L1A4TncxQVlnVHBBd2c0aGFWQ25lZ3RjbkR3?=
 =?utf-8?B?R3ZZQmpzWERSUEF1aE1SbW92eHBFbURoMmIvNjh2YlR1YmtuWlU1Q1hDVU5T?=
 =?utf-8?B?UWlZdHhSdkpUUmxsUEk1RHlCSlI5ejFyY0Q0NnFFZGw2YWtWWlc2VndiY0dH?=
 =?utf-8?B?U1k4TG9oNVZZd3ZiRFlKU0wrSEd4RUNCQVZRUytyVGZvVTFURFdScXRQbWpp?=
 =?utf-8?B?TFZrd2x2d01hM0cyUVJ4Vmp6eGJXaGNjZjVlbTdnMEl3R3dJTGxIZDU5UHA1?=
 =?utf-8?B?SHF4b0ExL2xGSkt2aVllOGp4eEw5Q2JHeXhhN3BuVGs2cjZKa0JDdlpNUGJj?=
 =?utf-8?B?V3lFaEozM0U1NFNGY0NjM2dlQ1RSL1FWQmdST3U5MFdnQy9PaVZxMk4raEw1?=
 =?utf-8?Q?VW6bC6dOg1iFt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:SEZPR06MB7140.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzZoQjhvbE94Zktqak5vQXNJQVUwelExdHVaSGREck5iSE9hV05rQkFvSzBw?=
 =?utf-8?B?VFBOV2N5Z3N3eStLZ0tWNk40STVScUdhdkJKZEZMdG9CSWZOY3I0dk9RaXZp?=
 =?utf-8?B?TGE1WitwTVd5b3lEN2gyTnFrdTQxd1ZmenFZZlN4RFdvUWlFaU9vcmo3U1Yz?=
 =?utf-8?B?TlRuWGcvTnFSRWVPbzEvYzVFREt1L3gzRVUzTmtjNlBZd0ZHZjlBQnlvN0ND?=
 =?utf-8?B?bERiYWZVais1WlJxTWQ4TFhmdk1LSVp6b2FnZGtmek1vSlBkdGtLNkdVSDJC?=
 =?utf-8?B?MWJvZ3VLS3FhMW1Ic1JzcGNRdm53VnNDbENLeEFCV1AwdjRub3U5Ym9xbm9p?=
 =?utf-8?B?ellPRE5IblFsZEtBWHdJQk5WcnE4aDV3TWhSSkdsV2M2Zi9PSTI4Q2VrWXNz?=
 =?utf-8?B?QThxNXlXR2Q1K2lKR3BZY01OaGtJNUZObXhGdm8vWXRDc3lhY0pCS2M1aExh?=
 =?utf-8?B?R1VGZ3l1MkRuZGNyLy9RTmZBcWNJSWRuRXRyMG9oc0tMNlV2L2U4d2ZWM1dz?=
 =?utf-8?B?ZG9RV0RON1E3QUhrN3l1MjRYY2ZZTW81WXpCcjdpNnRlVSs1Y0UxajNFQmVQ?=
 =?utf-8?B?dE5jY085ZkwrRjJsRUFyRVYxSWtWVzRXL0Y4d3BqNFRxbEZWOTN5UTRlTHdx?=
 =?utf-8?B?czd0OEVCWFYzSUhyWDhNOTJuemc5ZURLRWFPZE9GeFJzRW5hVE9IK2M4Vlkx?=
 =?utf-8?B?ZTBMbDFYN0RibmM4SkppcFBnTElnbVBzNXZEWVRMakNUOExGRkZKRGNCRTk1?=
 =?utf-8?B?aHJuWHV6QVdjL3Z2emg2cmJ6VnlhTFZSQ2lkUUc2MEpoQ3RLRVNTMlRoM0Ez?=
 =?utf-8?B?WUtQKy9FZWhWaXRyYVdUOTN6M3hUajNzUTZMdXZrcHpWdEtmWWE3aWRhRndB?=
 =?utf-8?B?RW5EL2YvQlczemczTjlUY1Q1V1FWVUdIekNQcS9xVFFoTUxQR1A3Rnh1UTVY?=
 =?utf-8?B?QiswWWpyeDRmUXROZ2grRlFaNDltL1JFNkY3SkhYeUo2THp1SEJTcFdkcW9v?=
 =?utf-8?B?cDRQT2xwZnIyTFVYSmZac0FGdkxqWEdLU3dQdlVYbUVvWjlPbkszMndLZXdY?=
 =?utf-8?B?ajVKMWJtMjljVzlERFhoWWpXeEFoTEYwc0RlRi85aFcxc0Jnc0lZODRSNlJP?=
 =?utf-8?B?TDZmTkxITUROMGFhZnVkNjlyclByQkxyS3pqNVZRZUJNSTJRTWI2WVR1Tjh3?=
 =?utf-8?B?SmJMZUQ4d3o4NDZhN0FuME1aRS9rbFBPYzJZUStmVWVKOUliQU40MXRqWnhq?=
 =?utf-8?B?bzdqMHRUejlZL0ZoWWx5Y3VlQWtCaExnZC9Gb3BOYmUzbU5TTUsrRXpnckU2?=
 =?utf-8?B?SFJyemczazlIUWtvZmxCWmFGMVJmQUZXN2Z2TzJDTkJUcmZLblJad2xtOEty?=
 =?utf-8?B?S0JVZnB4NjVxWjR5NUVFajN6bldzZGRjMCtDWkZZeFR1MmFaUWEzR09JaDhz?=
 =?utf-8?B?LzlBSGpvOG9udHJEaDRSRUlMWEIrbmNDbmQ0M040cHlkbTdXSi82S2pGVU1B?=
 =?utf-8?B?dTJqYkRnbTJOT0FWVWhIa2oyNTBPQ1phVnY3cEpkK2pLQ3BXOXJjMTdLRE1T?=
 =?utf-8?B?TWw1a291Z2U1V1dCTVRWSmJwdmNBT05IczNrWUtBV3MwNVlLYlFkcHZWVVNO?=
 =?utf-8?B?amVqVHRmaFVsY2VmdUJIYVYwQnNuUUY5Q1RUMlc5NkI2bWh5QVBGdnhwR0o4?=
 =?utf-8?B?RVowNWhTRllKY0lNbFBGcWVKSVB6ZTI5Zm9heXJWSlU1M1granNpbVIrNkp1?=
 =?utf-8?B?MFhXWitaTXZpTkF6L2JCY1dYTXlNMlpMM2NjelFuVnhzc2RrUitIUUhUc2lT?=
 =?utf-8?B?OGFvdStnTmRsTHI2ZVlJN01WTXd4VHBXSE9KeCtmS2h1M2J4eWtxSGxqZjRy?=
 =?utf-8?B?WWxjN1k2NkdPMHZJSitCajRKeXZUR2NHM0Z5SThFL01VRENIYmk0VlJuSjU0?=
 =?utf-8?B?NGVxcVlES2o1dUZnUUxDRGlDZ3RCWHFCSDdsMU9qZkEzbC8wSFhvWHViUm1Y?=
 =?utf-8?B?OStrdXp5TnBwUzc5dnVpL2prOUpjVytXNjJjdG83YUtpc3VpTmo1RHBYbEJB?=
 =?utf-8?B?SU5GdnZTRk5TWVcvbGUwM2t3Qzl6U1NwOFhPQUQyTk1ZclVXSEROR255V2FU?=
 =?utf-8?Q?4wlA=3D?=
Content-ID: <A37D10FA3C500F44997B44F014597116@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffbd915a-ba15-4ca9-7964-08dcf182798c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2024 03:43:06.6638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XVSOVClc9Udiw9ue7HwOVoOhnZ9NcKvZuAGok6ENTAAQep+GN90h2/n88baO890mW9Anx6eOpWvn9pL/EMwCEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5326
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2024/10/18 9:52, Zhiguo Niu 写道: > Chao Yu via Linux-f2fs-devel
    <linux-f2fs-devel@lists.sourceforge.net> > 于2024年10月17日周四 17:57写道：
    >> On 2024/10/9 18:27, Qi Han wrote: >>> Whe [...] 
 
 Content analysis details:   (-1.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [52.101.128.18 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [52.101.128.18 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1t2jKE-0001tw-6k
Subject: Re: [f2fs-dev] [PATCH] f2fs: modify f2fs_is_checkpoint_ready logic
 to allow more data to be written with the CP disable
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
From: =?utf-8?B?6Z+p5qOL?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?utf-8?B?6Z+p5qOL?= <hanqi@vivo.com>
Cc: "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

5ZyoIDIwMjQvMTAvMTggOTo1MiwgWmhpZ3VvIE5pdSDlhpnpgZM6DQo+IENoYW8gWXUgdmlhIExp
bnV4LWYyZnMtZGV2ZWwgPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Pg0K
PiDkuo4yMDI05bm0MTDmnIgxN+aXpeWRqOWbmyAxNzo1N+WGmemBk++8mg0KPj4gT24gMjAyNC8x
MC85IDE4OjI3LCBRaSBIYW4gd3JvdGU6DQo+Pj4gV2hlbiB0aGUgZnJlZSBzZWdtZW50IGlzIHVz
ZWQgdXAgZHVyaW5nIENQIGRpc2FibGUsIG1hbnkgd3JpdGUgb3INCj4+PiBpb2N0bCBvcGVyYXRp
b25zIHdpbGwgZ2V0IEVOT1NQQyBlcnJvciBjb2RlcywgZXZlbiBpZiB0aGVyZSBhcmUNCj4+PiBz
dGlsbCBtYW55IGJsb2NrcyBhdmFpbGFibGUuIFdlIGNhbiByZXByb2R1Y2UgaXQgaW4gdGhlIGZv
bGxvd2luZw0KPj4+IHN0ZXBzOg0KPj4+DQo+Pj4gZGQgaWY9L2Rldi96ZXJvIG9mPWYyZnMuaW1n
IGJzPTFNIGNvdW50PTU1DQo+Pj4gbWtmcy5mMmZzIC1mIGYyZnMuaW1nDQo+Pj4gbW91bnQgZjJm
cy5pbWcgZjJmc19kaXIgLW8gY2hlY2twb2ludD1kaXNhYmxlOjEwJQ0KPj4+IGNkIGYyZnNfZGly
DQo+Pj4gZGQgaWY9L2Rldi96ZXJvIG9mPWJpZ2ZpbGUgYnM9MU0gY291bnQ9NTANCj4+PiBzeW5j
DQo+Pj4gcm0gYmlnZmlsZQ0KPj4+IGk9MTsgd2hpbGUgW1sgJGkgLWx0IDEwMDAwMDAwIF1dOyBk
byAoZmlsZV9uYW1lPS4vZmlsZSRpOyBkZCBcDQo+Pj4gaWY9L2Rldi9yYW5kb20gb2Y9JGZpbGVf
bmFtZSBicz0xTSBjb3VudD0wKTsgaT0kKChpKzEpKTsgZG9uZQ0KPj4+IHN0YXQgLWYgLi8NCj4+
Pg0KPj4+IEluIGYyZnNfbmVlZF9TU1IoKSBmdW5jdGlvbiwgaXQgaXMgYWxsb3dlZCB0byB1c2Ug
U1NSIHRvIGFsbG9jYXRlDQo+Pj4gYmxvY2tzIHdoZW4gQ1AgaXMgZGlzYWJsZWQsIHNvIGluIGYy
ZnNfaXNfY2hlY2twb2ludF9yZWFkeSBmdW5jdGlvbiwNCj4gSGkgQ2hhbyBhbmQgUWksDQo+IGJh
c2VkIG9uIHRoaXMgY29tbWVudCAgYW5kIGNvZGVzLCBJIGhhdmUgc29tZSBkb3VidHM6DQo+IHVu
dXNhYmxlIGJsb2NrcyBhcmUgY2FsY3VsYXRlZCAgZnJvbSAgaW52YWxpZCBibG9ja3Mgb2YgRGly
dHkgc2VnbWVudA0KPiBpbiBmMmZzX2dldF91bnN1YWJsZV9ibG9ja3MgdGhlbiBtaW51cyBvdnBf
aG9sZSwNCj4gYnV0IFNTUiBpcyBhbGxvd2VkIHdoZW4gdGhlIGNoZWNrcG9pbnQgaXMgZGlzYWJs
ZWQuDQo+IFNvIGFjdHVhbGx5IFNTUiBjYW4gbm90IHVzZSBtb3N0IGludmFsaWQgYmxvY2tzIG9m
IERpcnR5IHNlZ21lbnRzPw0KPiBJcyB0aGlzIGEgY29udHJhZGljdGlvbj8NCj4gVGhhbmtzIQ0K
DQpJIHRoaW5rIHRoYXQgaW4gdGhlIGNhc2Ugb2YgYSBkaXNhYmxlIENQLCBpbiBvcmRlciB0byBy
ZXN0b3JlIHRoZSBkYXRhIHRvDQp0aGUgc3RhdGUgYmVmb3JlIHRoZSBkaXNhYmxlIENQLCBTU1Ig
Y2Fubm90IHJldXNlIGFsbCB0aGUgaW52YWxpZCBibG9ja3MsDQpmb3IgZXhhbXBsZSwgc3VwcG9z
ZSB0aGVyZSBpcyBhIGZpbGVBIHdoaWNoIG9jY3VwaWVzIDEwIGRhdGEgYmxvY2tzIHdoZW4NCnRo
ZSBDUCBlbmFibGUsIGFuZCB0aGVuIHdlIGRlbGV0ZSB0aGUgZmlsZUEgYWZ0ZXIgdGhlIENQIGRp
c2FibGUsIHRoZSAxMA0KYmxvY2tzIGNhbm5vdCBiZSByZXVzZWQgYnkgU1NSLg0KDQo+Pj4gY2Fu
IHdlIGp1ZGdlIHRoZSBudW1iZXIgb2YgaW52YWxpZCBibG9ja3Mgd2hlbiBmcmVlIHNlZ21lbnQg
aXMgbm90DQo+Pj4gZW5vdWdoLCBhbmQgcmV0dXJuIEVOT1NQQyBvbmx5IGlmIHRoZSBudW1iZXIg
b2YgaW52YWxpZCBibG9ja3MgaXMNCj4+PiBhbHNvIG5vdCBlbm91Z2g/DQo+PiBDYW4geW91IHBs
ZWFzZSB0cnkgYmVsb3cgcGF0Y2g/DQo+Pg0KPj4gICBGcm9tIDM4YjdjOTdkY2M1NWJhODNkZTQy
MjBjM2RjNTRjMmViNjYxNDhkZDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxDQo+PiBGcm9tOiBD
aGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+DQo+PiBEYXRlOiBUaHUsIDE3IE9jdCAyMDI0IDE3OjA3
OjA1ICswODAwDQo+PiBTdWJqZWN0OiBbUEFUQ0hdIGYyZnM6IHJldmFsaWRhdGUgZW1wdHkgc2Vn
bWVudCB3aGVuIGNoZWNrcG9pbnQgaXMgZGlzYWJsZWQNCj4+DQo+PiBJZiBjaGVja3BvaW50IGlz
IG9mZiwgbGV0J3Mgc2V0IHNlZ21lbnQgYXMgZnJlZSBvbmNlIGFsbCBuZXdseQ0KPj4gd3JpdHRl
biBkYXRhcyB3ZXJlIHJlbW92ZWQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hh
b0BrZXJuZWwub3JnPg0KPj4gLS0tDQo+PiAgICBmcy9mMmZzL3NlZ21lbnQuYyB8IDEzICsrKysr
KysrKysrKy0NCj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9z
ZWdtZW50LmMNCj4+IGluZGV4IGY4ZDZlNjAxZTA4NC4uOWJhZDEzZDcwYWZiIDEwMDY0NA0KPj4g
LS0tIGEvZnMvZjJmcy9zZWdtZW50LmMNCj4+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5jDQo+PiBA
QCAtODUzLDYgKzg1MywxNyBAQCBzdGF0aWMgdm9pZCBsb2NhdGVfZGlydHlfc2VnbWVudChzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmksIHVuc2lnbmVkIGludCBzZWdubykNCj4+ICAgICAgICAgIHZh
bGlkX2Jsb2NrcyA9IGdldF92YWxpZF9ibG9ja3Moc2JpLCBzZWdubywgZmFsc2UpOw0KPj4gICAg
ICAgICAgY2twdF92YWxpZF9ibG9ja3MgPSBnZXRfY2twdF92YWxpZF9ibG9ja3Moc2JpLCBzZWdu
bywgZmFsc2UpOw0KPj4NCj4+ICsgICAgICAgLyoNCj4+ICsgICAgICAgICogSWYgY2hlY2twb2lu
dCBpcyBvZmYsIGxldCdzIHNldCBzZWdtZW50IGFzIGZyZWUgb25jZSBhbGwgbmV3bHkNCj4+ICsg
ICAgICAgICogd3JpdHRlbiBkYXRhcyB3ZXJlIHJlbW92ZWQuDQo+PiArICAgICAgICAqLw0KPj4g
KyAgICAgICBpZiAoaXNfc2JpX2ZsYWdfc2V0KHNiaSwgU0JJX0NQX0RJU0FCTEVEKSAmJg0KPj4g
KyAgICAgICAgICAgICAgIHZhbGlkX2Jsb2NrcyA9PSAwICYmIGNrcHRfdmFsaWRfYmxvY2tzID09
IDApIHsNCj4+ICsgICAgICAgICAgICAgICBfX3JlbW92ZV9kaXJ0eV9zZWdtZW50KHNiaSwgc2Vn
bm8sIERJUlRZKTsNCj4+ICsgICAgICAgICAgICAgICBfX3NldF90ZXN0X2FuZF9mcmVlKHNiaSwg
c2Vnbm8sIGZhbHNlKTsNCj4+ICsgICAgICAgICAgICAgICBnb3RvIG91dF9sb2NrOw0KPj4gKyAg
ICAgICB9DQo+PiArDQo+PiAgICAgICAgICBpZiAodmFsaWRfYmxvY2tzID09IDAgJiYgKCFpc19z
YmlfZmxhZ19zZXQoc2JpLCBTQklfQ1BfRElTQUJMRUQpIHx8DQo+PiAgICAgICAgICAgICAgICAg
IGNrcHRfdmFsaWRfYmxvY2tzID09IHVzYWJsZV9ibG9ja3MpKSB7DQo+PiAgICAgICAgICAgICAg
ICAgIF9fbG9jYXRlX2RpcnR5X3NlZ21lbnQoc2JpLCBzZWdubywgUFJFKTsNCj4+IEBAIC04NjMs
NyArODc0LDcgQEAgc3RhdGljIHZvaWQgbG9jYXRlX2RpcnR5X3NlZ21lbnQoc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpLCB1bnNpZ25lZCBpbnQgc2Vnbm8pDQo+PiAgICAgICAgICAgICAgICAgIC8q
IFJlY292ZXJ5IHJvdXRpbmUgd2l0aCBTU1IgbmVlZHMgdGhpcyAqLw0KPj4gICAgICAgICAgICAg
ICAgICBfX3JlbW92ZV9kaXJ0eV9zZWdtZW50KHNiaSwgc2Vnbm8sIERJUlRZKTsNCj4+ICAgICAg
ICAgIH0NCj4+IC0NCj4+ICtvdXRfbG9jazoNCj4+ICAgICAgICAgIG11dGV4X3VubG9jaygmZGly
dHlfaS0+c2VnbGlzdF9sb2NrKTsNCj4+ICAgIH0NCj4+DQo+PiAtLQ0KPj4gMi40MC4xDQo+Pg0K
Pj4+IFNpZ25lZC1vZmYtYnk6IFFpIEhhbiA8aGFucWlAdml2by5jb20+DQo+Pj4gLS0tDQo+Pj4g
ICAgZnMvZjJmcy9zZWdtZW50LmggfCAyMSArKysrKysrKysrKysrKysrKysrKysNCj4+PiAgICAx
IGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvc2VnbWVudC5oIGIvZnMvZjJmcy9zZWdtZW50LmgNCj4+PiBpbmRleCA3MWFkYjRhNDNi
ZWMuLjliZjBjZjNhNmEzMSAxMDA2NDQNCj4+PiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuaA0KPj4+
ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5oDQo+Pj4gQEAgLTYzNywxMiArNjM3LDMzIEBAIHN0YXRp
YyBpbmxpbmUgYm9vbCBoYXNfZW5vdWdoX2ZyZWVfc2VjcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpz
YmksDQo+Pj4gICAgICAgIHJldHVybiAhaGFzX25vdF9lbm91Z2hfZnJlZV9zZWNzKHNiaSwgZnJl
ZWQsIG5lZWRlZCk7DQo+Pj4gICAgfQ0KPj4+DQo+Pj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBoYXNf
ZW5vdWdoX2F2YWlsYWJsZV9ibG9ja3Moc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQ0KPj4+ICt7
DQo+Pj4gKyAgICAgdW5zaWduZWQgaW50IHRvdGFsX2ZyZWVfYmxvY2tzID0gc2JpLT51c2VyX2Js
b2NrX2NvdW50IC0NCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZh
bGlkX3VzZXJfYmxvY2tzKHNiaSkgLQ0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc2JpLT5jdXJyZW50X3Jlc2VydmVkX2Jsb2NrczsNCj4+PiArDQo+Pj4gKyAgICAg
aWYgKHRvdGFsX2ZyZWVfYmxvY2tzIDw9IHNiaS0+dW51c2FibGVfYmxvY2tfY291bnQpDQo+Pj4g
KyAgICAgICAgICAgICB0b3RhbF9mcmVlX2Jsb2NrcyA9IDA7DQo+Pj4gKyAgICAgZWxzZQ0KPj4+
ICsgICAgICAgICAgICAgdG90YWxfZnJlZV9ibG9ja3MgLT0gc2JpLT51bnVzYWJsZV9ibG9ja19j
b3VudDsNCj4+PiArDQo+Pj4gKyAgICAgaWYgKHRvdGFsX2ZyZWVfYmxvY2tzID4gRjJGU19PUFRJ
T04oc2JpKS5yb290X3Jlc2VydmVkX2Jsb2NrcykNCj4+PiArICAgICAgICAgICAgIHRvdGFsX2Zy
ZWVfYmxvY2tzIC09IEYyRlNfT1BUSU9OKHNiaSkucm9vdF9yZXNlcnZlZF9ibG9ja3M7DQo+Pj4g
KyAgICAgZWxzZQ0KPj4+ICsgICAgICAgICAgICAgdG90YWxfZnJlZV9ibG9ja3MgPSAwOw0KPj4+
ICsNCj4+PiArICAgICByZXR1cm4gKHRvdGFsX2ZyZWVfYmxvY2tzID4gMCkgPyB0cnVlIDogZmFs
c2U7DQo+Pj4gK30NCj4+PiArDQo+Pj4gICAgc3RhdGljIGlubGluZSBib29sIGYyZnNfaXNfY2hl
Y2twb2ludF9yZWFkeShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpDQo+Pj4gICAgew0KPj4+ICAg
ICAgICBpZiAobGlrZWx5KCFpc19zYmlfZmxhZ19zZXQoc2JpLCBTQklfQ1BfRElTQUJMRUQpKSkN
Cj4+PiAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsNCj4+PiAgICAgICAgaWYgKGxpa2VseSho
YXNfZW5vdWdoX2ZyZWVfc2VjcyhzYmksIDAsIDApKSkNCj4+PiAgICAgICAgICAgICAgICByZXR1
cm4gdHJ1ZTsNCj4+PiArICAgICBpZiAobGlrZWx5KGhhc19lbm91Z2hfYXZhaWxhYmxlX2Jsb2Nr
cyhzYmkpKSkNCj4+PiArICAgICAgICAgICAgIHJldHVybiB0cnVlOw0KPj4+ICAgICAgICByZXR1
cm4gZmFsc2U7DQo+Pj4gICAgfQ0KPj4+DQo+Pg0KPj4NCj4+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdA0KPj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQNCj4+IGh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwN
Cg0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
