Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 236A63AFB40
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Jun 2021 05:05:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lvWiu-00015B-8c; Tue, 22 Jun 2021 03:05:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=8000ad4dc=Aravind.Ramesh@wdc.com>)
 id 1lvWin-00014v-Rb
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Jun 2021 03:05:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R03xLRZQasT0xKgUdIeFTbDriXrXlf8BCbzTMZziVSY=; b=VDUD4E66aPsUdKFfwGaEtT3pXf
 oimMTAQ5PphxFMlp6hUF/nYtkm3go1TwtBIZ5Bc5nXdvB4dpZ3uiWtGzYBvAY+F0WcAGIQTWGm0Oe
 I14MZji1gRj0NW77jNwyHHN9rIRGsUrTS1I1pOZoZf+jilCGOqUCtus/AyhyT/dXZYI4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R03xLRZQasT0xKgUdIeFTbDriXrXlf8BCbzTMZziVSY=; b=KXZ8h7nTNkAqVebeDMUZ2wv5wf
 GYp/Nc0IeU7Ge1ad9J2nxZ/THPggcB4w85ZpJdKuScK17n2cZNPcrvwT9Rgo4DI0n17q+sg+YuEm9
 x4GIGVtgSYgzPSMDVrPy2dj62TOJT0AO1Ymcm3jA+DdwLMTje11a77sGvNjvC8joDFi8=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lvWiX-000893-LA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Jun 2021 03:05:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1624331090; x=1655867090;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R03xLRZQasT0xKgUdIeFTbDriXrXlf8BCbzTMZziVSY=;
 b=gKtnjQ/7w2ujZiAf+k1jypKYnR+dVNcZhQh1Rlqhf3CZBXCfYQiryL5g
 ySU5i1VE7/Ei1O90K80i+NON7UCdy21DIbMt71KT1eX6Xel5MKb6joDQO
 IeHwQcKTFs9WcsIrz/S/2steHyGXTjKdy4NRMreNPhepoo5jruDWToVCi
 3wzZExt7w3Acv20MNk36QCh4eJ41p9eNt4KiE/bZsEhYGXvH4JS4sD8PH
 8Oq3EGjIQdV0GIC+t/p1X1DTGz0leIRoPtlLkKMGBwmvTduiswlDBN5Xg
 ySV74agfpqdpERWF5f3OmpsLSDbS2fDlXNahG+6hTlYisz8lIn3pSn3kc g==;
IronPort-SDR: pmmNQ6k+hquW+MY51wKse84Z7XNcuWLO0u3+AfPzRgL2pfVepbVdEtM9yTAwFn1naW34OH1LkB
 RaRIXxIGYjWjgtDuRxlHgL2OoTG9N2l4i1Yum8QamwPR3GvuJy5XWc1ZliTdrVW/8VTWOn15s7
 QwJMhtdvZdInPfUBUNvnti03LwV6q/wXpf6108zowLXbuVcHGTCuDfsp4TS92BgDoI5UpW7RuQ
 0X4echtoepubwm0tc+paPwjeXPAi6pCN2JWVr7Bmyt5cLWKxxuwh/PaLES1lXUxu+aUH8bgVfG
 6k4=
X-IronPort-AV: E=Sophos;i="5.83,291,1616428800"; d="scan'208";a="172543291"
Received: from mail-bn8nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.173])
 by ob1.hgst.iphmx.com with ESMTP; 22 Jun 2021 10:49:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tvn3NWmX2ofPbHctvWbAOx/bGc4vlVKBeNOg2vP42N7mNAy70slHjJ+JYFC30T+EVA2FLfqr51MVfo2HBLAlvJt1kpkH8fwJOyuj0/yFSZTYm2bwLKgubFo7zqP+I+jAJpg/lEDsibTVy7Bo3fh9boE51zVUhITGRa2ZR976+yVSeQjsmQSEWjkKYTJfMPBrWr1ewipwGgE2ykCby/MFslNZTlAO+yD4qwmo+4mWDjmjJOteD1prC/QyjVBMxckYPw5P9CTPw/jJ1hmGkgbG7IJkVKObmZDgSVFkP6Z1Upw4dxSvMhjsb2phKEbY9pOQ3R+KvvwBTUleYdxuJ0jmhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R03xLRZQasT0xKgUdIeFTbDriXrXlf8BCbzTMZziVSY=;
 b=P9Iwj5Fmr8AsfLyfU5d/n5YIoIqAfY0i0qzJTIOmWWx/kQFUriic/nz91hqrNEhpHn38Z1r5eznpVlzaPkN57xAnxfoC9EFYu4hhw1rTsv/c1aGNeADZ2oRNcYbuqtGrQJd45b9kfjBqKkeo4sTMxLM311Pp1Pn8NZbQXuViQUYzux822T0IS7ijXYUTDZ20pgxkpFThkvngdpQvEa8uRN4tVQYaJywqZdQ/UjeJ8wRPOtMk76500wNkK3ueST0F5JSQntUkFLYwMJd5BgF4oOrpv7lcmr9fDqtVJ9r8as8Ijb0pgxZsAwtDzdf8XmBJquesfSzDFsdnnX2EZW+55w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R03xLRZQasT0xKgUdIeFTbDriXrXlf8BCbzTMZziVSY=;
 b=XNqR+qgd7QY46v16CdJgIivObfjM+V+0L3b8YLzN2LlRhyjnMTXBkGIESgzmtchrOpNAkTELzdhrXxfi1AQ2UyQi1Hr8d1P+GT3pSF3R7Xzgmu5KccjwoEwpyafsGXb3UBKwFqju0R/Vqa/gLHDdDHndZP6gVIgpmHxaHdAR4wA=
Received: from BYAPR04MB4056.namprd04.prod.outlook.com (2603:10b6:a02:b4::22)
 by BYAPR04MB5559.namprd04.prod.outlook.com (2603:10b6:a03:ed::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 02:49:11 +0000
Received: from BYAPR04MB4056.namprd04.prod.outlook.com
 ([fe80::fc71:bcb6:e18d:6973]) by BYAPR04MB4056.namprd04.prod.outlook.com
 ([fe80::fc71:bcb6:e18d:6973%5]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 02:49:11 +0000
From: Aravind Ramesh <Aravind.Ramesh@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [f2fs-dev] [PATCH] f2fs-tools: fix metadata region overlap with
 zoned block device zones
Thread-Index: AQHXYuWEBwnGsNzOBUCqy1RKV/gfXKsewbwwgAB384CAACI8sA==
Date: Tue, 22 Jun 2021 02:49:11 +0000
Message-ID: <BYAPR04MB4056D1DDEA9E79ECA3A2568D8C099@BYAPR04MB4056.namprd04.prod.outlook.com>
References: <20210616192558.1655258-1-aravind.ramesh@wdc.com>
 <BYAPR04MB405637307829953851645A098C0A9@BYAPR04MB4056.namprd04.prod.outlook.com>
 <YNEyZcqB69Tkuu5Q@google.com>
In-Reply-To: <YNEyZcqB69Tkuu5Q@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.184.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f3018a0-4450-4305-a5e9-08d935285068
x-ms-traffictypediagnostic: BYAPR04MB5559:
x-microsoft-antispam-prvs: <BYAPR04MB555991F7D22D330C0A8D66488C099@BYAPR04MB5559.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:525;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vnQBW53PXjrH0dRu62luu0LJcbo5Rn0abD9A76yZtMDtqCFowrcx3+52ivvfU8Xl5+d1Y1Ic/BVeUeW0wj/EFM81IXUQP7aIVRn8GazGHd7/GMPlL2M1ZaJCoqgF2cigtMrBc4AXsGHpuqhTD36ypnnFxEvQq6vhBMALiGpaHbC2EO+4trpaN1SQ94H4p4m5VYIJsfNabFMMMrTZyHyqwvHLzHZUs4w8t5S/cDXtP4HUdACL4jSrvnLHXYh8vdCru/v31slTVIeyq9YTZYlR3CyT+lUBpDypK2K99QATUFu7S1vw5879iU0EpAKgpWIlrEBmDAAatz29jjEpYixu0PTeoIYkZjai9zqiubJwMvsJSZ6vXsNYSdHkPstUCYSWPLhucvyhFHJrxVo7pYncpvgHhws3xi6PdUTRxo72AajdHfIDxkh9efis3Yp55vhNBtUohbeyPZmbllLREHKlFX5hcwzqwJ/JEr/HW4H8H3wPqB+Nmw7JXPg4x79SHeVX7dWqTpXgz4gmwmlipeOjULo5v39DdiDZ9D1/fLr3eiNTbVLaFlQHjFLctqOxHMSlIV1ygPtYxWuRFbyRujYaQ3olf6vT6eJPpHmRfEhpP5iRcys2iCeb8Co2ujGCaaOVGYH6YIzd/KnBT6MlBhhuxRXRCViLlGMC/s2ke/XQxvwUhF19r7wrIVKdLuprgRToAmXSUp0ij90Um/sbUmxEcw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR04MB4056.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(4326008)(76116006)(26005)(52536014)(2906002)(7696005)(6506007)(316002)(54906003)(966005)(478600001)(558084003)(33656002)(5660300002)(122000001)(6916009)(66946007)(38100700002)(8936002)(55016002)(186003)(9686003)(71200400001)(8676002)(66446008)(64756008)(66556008)(66476007)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jGcNrNZQdONBGvKcQpOu5PWQH6loQreE6BEwWsz6T/r2T+HnCaiDB4vPiJXn?=
 =?us-ascii?Q?ku4YRvZMqKBaokBldvOgFb/ae6Bwo8OzBQ8VTdCwdQ7cvDa+XfmZUnA0jyz3?=
 =?us-ascii?Q?gzJOW82oeR9A27OGm2Z3SSiLb5YuLdOLjW7djiA94fcEyDU7Uv+OFGb8vjqM?=
 =?us-ascii?Q?K5nsLf26pkgFZD6OJfYMy9J1TVI1g4NeRpljh2syz0+hgFXhVXd2oC1cQ6Ew?=
 =?us-ascii?Q?Fi7JtE+SOZPFyiBzrrL8/cwB3XCwUpNAF1dnfCYiy6rFjaGUKJO3xUGCQISx?=
 =?us-ascii?Q?SjwkdI4/kDBWznrask8LJgGdF4wh5t92/ioJ8e1WnBzVKcrK1dTTUVBJHFX2?=
 =?us-ascii?Q?vryzpX6mFIkuetkPG0WMH2L+8LeK8pHUrIphPYBLQuJAPS1vVvI6kQ4CyNwh?=
 =?us-ascii?Q?8sj5AIHnmsvmzKIqyveEIoQPiov+Y6BBmFVw1+kCBBHbBTmp4ZYP/eeNaex1?=
 =?us-ascii?Q?HTSH5oKx0iSMrKSg1gS6LpbVZAC9Xr0XEkP5VBJ5VtqIBEiC0WU1KdfjDmRy?=
 =?us-ascii?Q?YozRHtlqB1LzCudyhUIY4rELVMLZD7sQIMOMx0mKsQA39/0UMBcxQrvDDY5H?=
 =?us-ascii?Q?1Jsmt9UhNqqpTlQzjWJPE7egbQJve3t/cacoPx4+BcyigOM7PuKw5IiZnJAF?=
 =?us-ascii?Q?9Iox9HJrnwET5K0et4Eo4ETMFlyiMZuqHDRytCHK3v3La1/tLD39QvVOobnR?=
 =?us-ascii?Q?lqUaNTqJmnx6/SYzerY3CyGqb3tzH8Q0Yg2w3qHxaCw0zT6HcwtplRwVkzTM?=
 =?us-ascii?Q?8C8VfmSW/OnUjLg8qDSGY7wTlp8XZmuB5qQ+WKiFaWtd0bAHmPvPwHdeNtTI?=
 =?us-ascii?Q?TN7iTvPh9eTkTa86bjTheixg9xY6MzlX4kAbBgur5xji0SLymCmKHb7Um7lH?=
 =?us-ascii?Q?eX/BQoPDpVUgUkkQo0PySZOvWtevFzJIe5iuzq9VRWHlyq3yayJyx8faEI9V?=
 =?us-ascii?Q?I/4g+GmDH9ItgV6yFxJ5HESZg04N5Hx4bvnuE4RGf/m5jjikk4GUosGYpUZ0?=
 =?us-ascii?Q?qZseQj6lMNzUyEftiHO0oG23gATjPID2ZMZVfvE8oaOpQTo3i6elcWk6DgRX?=
 =?us-ascii?Q?mOeulbEo+A6V95fA1ewUMUthFDh+NGQIBhg1fbGuP/SkHgF7K0OZLJTDHwcX?=
 =?us-ascii?Q?TVQnst5ujAUz1FLyMW1rY+Rk/3FoHQWqY7AQyX1mrcfDjl6RlAJqbyvbAFBW?=
 =?us-ascii?Q?STixn9uHtyhrbhR9wYtI7yV1DX6Vwja73RQdPFLXuQLmtOZ6RAWc4gf4KZgh?=
 =?us-ascii?Q?xBhS9hc786sjTecQmI8leHubG7zDriKiB39qIx7xjx7CPU5Ge5Hzme24KLJg?=
 =?us-ascii?Q?rO1gVPdgMCK+m9Lev+DITNSm?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4056.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3018a0-4450-4305-a5e9-08d935285068
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2021 02:49:11.1306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fbMSFmSOQOkwUq6fP20w85FAGSe85mbDJAe8gffXYxE1doWWnbZ3hg3BfeQeZ9lENEhrpHZexL3pjlIxCwkrqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5559
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1lvWiX-000893-LA
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: fix metadata region overlap with
 zoned block device zones
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> 
> I queued this in -dev which will go into -master later.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-
> tools.git/commit/?h=dev&id=b750268dafec5a59716b9aec606dc18a9cbdae70
> 

Thank you.
Aravind

> Thanks,
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
