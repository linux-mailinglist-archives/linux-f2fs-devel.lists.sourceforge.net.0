Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D861D3E8C86
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 10:52:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDjxs-0003ey-QY; Wed, 11 Aug 2021 08:51:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=850e59ff9=Damien.LeMoal@wdc.com>)
 id 1mDjxg-0003ej-D1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 08:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4gHy46ueO90qKJnA/7zSgu0z/TtCi02b8fMaVzYsZ6s=; b=IPYrrux21dN8B113OFiaKFYbFj
 I3sIIUIJ6gEs0ZKK86Z9cRUoTzzsPVvGvaDHqZHuY05CJ14AKi3lHDoLlvqjl9ea5iKCLd2nd0zA6
 zgk0GjRsl42i446NQ6J/MYo9/z8RIuHH/RNJV1LlC+m7qCSGzqFm6xppee+dnHdZ5E8U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4gHy46ueO90qKJnA/7zSgu0z/TtCi02b8fMaVzYsZ6s=; b=K
 GMrqkC6mbA5TNNpyuzp8tK/XMFcQo7SsO+muFcgJayH4easgHvC4ribR8syoEq7Ts+AW/TE5OLzgy
 +Ucy91ABqGuKK++965haaXZWOCP4zMNevjqzJxLROdxHSaRK8UwOZxNrj+CTPnQOGliReIfehC4Zn
 2Nlh4IBqwkNbW/D4=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDjxa-0004UE-6B
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 08:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1628671897; x=1660207897;
 h=from:to:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=GdwPMu7tKkGTZp9556MQNDy05kVUNKJWreCfVUpLMCc=;
 b=dhqulNq5mPtMQ1yrW9e8DzQoBklSkPyO5y9X5C3/g8EUeaPv3ylKG7U1
 Hyog01o2IRP662q+UyAShynezcYkc2Y2WzP4c2nBxNPgW8w03QcOYRbsO
 u9y5c/2o1Gt7AHK+BGVVd9P4HHTw99GE09sVNPBJj5DPBVfXvJqXIFetg
 /ZdW7GNOJ/hDSTt313J/cMpSd8g9Kbx5uaUrRtclxtdoRGuKiHqkbrpPJ
 CFTMOnaj4T0SpL8/LSv890Lc39F/tJA24paCvdpbCqvV6zrPRPUob9sGj
 q7UI7sTDsMvi5pfhFQbOxyoo7VkYUy+5A4ANAdV5nP0661UXUApdTBL8N A==;
X-IronPort-AV: E=Sophos;i="5.84,311,1620662400"; d="scan'208";a="181717033"
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2021 16:51:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HSNUrSAkSd+Bkrok0VlCgb0WOieswDn7yyFG48UCiQkQ84ymJjeZ0sNbxehuIs6QM8LVPnEwsZzOnOR7bdePjPizL/s+UXTLsErBCO6ZRZTBMGXAVi7CQL5K/xXb08p6Sap46iUIWhU+ZtSboAAo9W6KD0qOcoP4+FHVHG4izuLwiA9OLeFBsMBF4LT8weNdBdQp5v+L1MyjtSPgC5zfxPXgIv6VCCCMUo/Shn9QSGsQczaOqQGmleJU8Oa2pzPZVS0wykN+UAd6b/g/PRzqUeFth6vStzhnjy5jNfI1i4hWwMilpHwGET5Cw/tfs0f9w/hCjMzDr1lucj9fiEbK2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gHy46ueO90qKJnA/7zSgu0z/TtCi02b8fMaVzYsZ6s=;
 b=HUls0fFLwCGt6FH3gyvDFwj5W+lIcZcHM6nUmNJaYVoSO2IXA/3SomjWdDW58/0A6G4eDcOfAr1JR0OkHTljv6zhLC6ctqqmY4eh/Zy+bBA7xJL71FbOz6Un5QVD+9XHT9RbwDap4Ae5aqdciV6HnTnc3r2tJ6qsJHlo9TLt6qX3I6Cst+Cvqt7PG3mp/Yc7umnTm1wcm8qsSNs780vtQ0YNVAIVm+BnpagMAvnm/ertxXKkSEZAX8USEywkHUs1jibhOS/zrhoe0pFfnsOpHCi4q4Vdu7/yzmAj8lYvFDfkuhuIhW/ogb6YLib89pg02r22O/NAG+gv9JtmgZ/bFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gHy46ueO90qKJnA/7zSgu0z/TtCi02b8fMaVzYsZ6s=;
 b=frHbm/7JyOLygR0jRPU9/ve1GX5Jd3nZ2qAh9ML4Yoj7HkplmJkyeqt7lk8FRw43qiDqD0AU5E6zYq49Iw4j2//l7EujpSrzJxYkZCvO+SrtEKF1QqxUHEwOfmjN481dt52HthrmTrMHDanmNKBG0daazVhNPg0eqHj5Nz4W/7g=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM6PR04MB6622.namprd04.prod.outlook.com (2603:10b6:5:20e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Wed, 11 Aug
 2021 08:51:31 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::e521:352:1d70:31c]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::e521:352:1d70:31c%9]) with mapi id 15.20.4415.016; Wed, 11 Aug 2021
 08:51:31 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>, Jens Axboe
 <axboe@kernel.dk>, "linux-block@vger.kernel.org"
 <linux-block@vger.kernel.org>, Paolo Valente <paolo.valente@linaro.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v4 3/6] block: change ioprio_valid() to an inline function
Thread-Index: AQHXjmI7ygio9AazPkSFhGtRAF0BTQ==
Date: Wed, 11 Aug 2021 08:51:30 +0000
Message-ID: <DM6PR04MB708110464CF08693EE8BFEABE7F89@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <20210811033702.368488-1-damien.lemoal@wdc.com>
 <20210811033702.368488-4-damien.lemoal@wdc.com>
 <PH0PR04MB7416DCAE9D84B4ED25E4C2ED9BF89@PH0PR04MB7416.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e703673-db42-42ab-56fe-08d95ca536ec
x-ms-traffictypediagnostic: DM6PR04MB6622:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR04MB6622B2FB1DD0DF1AD3ECEE0DE7F89@DM6PR04MB6622.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xacg7fDRNBAxFj41dUCyFOWRJ+s7UL0kn1biPqNRedlNqp62U0AMnri46Cryf3hBh+yUv1Do0aCJydj8o9DYR1+KZsPwbc06zOfy3X5ONx+zWUgWMhxeGElRduMqfuD6CKyKH2gzL0Qjm4/pfYKo8fCU+OoMIM0csNE69oBDZUpJhziWGfInwdkHEXt5IBS1PgAlZKfmMuVATka/0CIqotxABYhJ3Ga7E7uYThrs+Lk1w/sPjAcBp2vJ1y3KpqNZFj6dmr70UOUv1jWRMiFsc+wEyPrxgCxYdevzV1YV5CwK3a96jwHsBb3uwIZfGwBrbbbdgJt4mjMH4jgO+8axiEd/PY37mwA1S3gAYP5U6i+mObEt41600O0HJbxXeYbu/HAsFmFmpWjbqIP2PGq9pog3zbSchrzxhmeLrK7PqnGZKdwZ40ZT89fP6XkVjQ3L+GgPwiTNaMM11h0X2+d+sOU/MIW5ySuntMATc52JXIj3PpZslBN40np0Z9tfJVBJA1WF+WNrJzyo7RIEVu8yh1NmZgdFdhaEpuLGrxKVstGBXss2iW1NXVipA4kuI9pSVdD2URdXTSj+Ox11jjSYpvMSAHjssLfpbbwp4CPpAGrHJY0IhinxzUJ8/XbjVMRI23LFQ0Sili8tVd/nzxER2SKWKYMVXoV+XLstKYlPgfUltdfq/uIaz+iL7A1IxWUuSpjS9ON8PGd2/eXN3OK3yQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(8936002)(52536014)(122000001)(478600001)(8676002)(66446008)(66946007)(33656002)(66556008)(38100700002)(110136005)(316002)(53546011)(6506007)(38070700005)(64756008)(55016002)(9686003)(2906002)(186003)(7696005)(71200400001)(4744005)(86362001)(76116006)(5660300002)(66476007)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tBZF56SvaLDJ2TqPhrrXXCjkPy/zP7x2tI+S1gLfsfYTWuk+iOmp7kG2sDQf?=
 =?us-ascii?Q?Cy6x8TMOQ5ze4JwOltLzmldtKCmHNKFJucpFHeAgaCptXY1luP7J2Ag5uuBy?=
 =?us-ascii?Q?pHnfyRgg0uG+MH8JAdKx4DePVjU3MQTZLaYM009T1Czth1ATrOvFbcsSVJkX?=
 =?us-ascii?Q?tKckAV8quik0gWC9C0azAw0eQhyG8aM0UqzLP9vqLHC7UVmFLg/YnKmDcam1?=
 =?us-ascii?Q?WArytNkIe6WbwLNfUnBZiIa4tNWbh0I1ICxMaFR19KZ5brty4FTYnkoYbe80?=
 =?us-ascii?Q?0OQlMJBPXhlCaiIxVGQGC/nFdpOipZ5/gmJvflJWBfn9PgcVSE+c6qvhALz3?=
 =?us-ascii?Q?SlrAMmpcFtkZYYkBI/oYBHEGYGsPtr/8P0DyysYFv8prxYiSSeUl1+8WtNPq?=
 =?us-ascii?Q?JNZM+4d//XaqjH5IVUm2T7jYfN095TrqwFadDqyaVFaLyL83nWOIskT4YflG?=
 =?us-ascii?Q?qVJ1hZf6te+9nzhp1c5aeAf+rCT/5r7gZDsObfPG69rpIQt8uv6AtxO9oCJh?=
 =?us-ascii?Q?yA8mFw+j0vIExWvf9HaywE+RsoTCal3l4L7RXU6j3weBY+aHRqbh1C2eUqID?=
 =?us-ascii?Q?kALfR+E0JPCpjeJujWKXpoBgJDK/iipEyBQmPy2k0Q3CeIgT/f/PIwXzZ92u?=
 =?us-ascii?Q?SVcxJlYKlctdGDIClGfM8zBZYJRHX6SOyGijpvKSDRo7yVjREUnb+ESk8eQk?=
 =?us-ascii?Q?VmmJqvNmvgGaNe5LNSzu3ZnR/6SBY4EEtsmu0L/sdyupCoD7NknrgJbhMV27?=
 =?us-ascii?Q?h2fwH7klHXZVVNulNc7/AhNFMYenYeEKEicj7PJDbg4AF5ejbq5XDT8ga24Z?=
 =?us-ascii?Q?GAtYXkw5uy6KfSnh/y1bc8hkcLLH5LLIFbGp5QNjZs2PO8Qpi3eZTQaluvJa?=
 =?us-ascii?Q?S1AT5OQU0/k/XEw3btJB0SlnIxJaYmpLPDElUzoD2lRwYAMRzJS9ydaKwgDe?=
 =?us-ascii?Q?9gSGqryp2RIuS771tSL1y4S1GZSikhtybYwQEfYy2U5g41dbmfcfvwgRnMOr?=
 =?us-ascii?Q?fhm6MOc7SHidBBhDAsb6UQTONIPuRLENl6rsdSTOUyKnNujrP/1DBPUZ2yCZ?=
 =?us-ascii?Q?i/g6QAX8gFW9zbXkhh1lgLCSRF4sPjxe0MTUTBjFBLLx+gsRlTklEbSt8AxT?=
 =?us-ascii?Q?NZ2d6x1LSsYTy/e+/XtjFimFdovutfJNtHJVoksIOJ/va8Lq6W7VN3ng3S3b?=
 =?us-ascii?Q?w/kkh4QdultqBhWAkW434ZOIPJPI5Je1z6nrvG2TEO972a+2cHb29YckcSlV?=
 =?us-ascii?Q?xZN7hs1fmuq5o6An/hm0taX47hY6kF/nvJgdKuL9zRLf8EVxDXy52RiUz6Iq?=
 =?us-ascii?Q?1eiB9Sud8aeMnnZzLDUFsna3a/+UEpasha4qiRhScH1rJRLt74f5+xn+3PZ4?=
 =?us-ascii?Q?lUbXUu8wXHW+pDl8acmhd2fcMHhsEPKs9HQ++x4MBtqOFi9ciA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e703673-db42-42ab-56fe-08d95ca536ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 08:51:30.8830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D+5wSO28+s8M9LeXRtsLxjnHl6wbLutpZ/gpdLna2Iy+xaDcAy/lMv70dv98OwYCLBpqbj5HJuedg6k6DIKkMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6622
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [216.71.153.141 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mDjxa-0004UE-6B
Subject: Re: [f2fs-dev] [PATCH v4 3/6] block: change ioprio_valid() to an
 inline function
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

On 2021/08/11 16:56, Johannes Thumshirn wrote:
> On 11/08/2021 05:37, Damien Le Moal wrote:
>> Change the ioprio_valid() macro in include/usapi/linux/ioprio.h to an                                        uapi ~^
> 
>> inline function declared on the kernel side in include/linux/ioprio.h.
>> Also improve checks on the class value by checking the upper bound
>> value.
> 
> But I think it needs to stay in include/uapi/linux/ioprio.h as it's there
> since the 2.6.x days (I've checked back to v2.6.39.4) so the chance of
> user-space using it is quite high.

include/uapi/linux/ioprio.h is being introduced with kernel 5.15. This user
header did not exist now and in previous kernels. include/linux/ioprio.h has
been around for a while though, but that is a kernel header, not an application
header.


-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
