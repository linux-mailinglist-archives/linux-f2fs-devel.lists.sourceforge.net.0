Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC2921F99E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jul 2020 20:40:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jvPqv-00029P-4V; Tue, 14 Jul 2020 18:40:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=4575183b6=Aravind.Ramesh@wdc.com>)
 id 1jvPqt-00029B-Fe
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jul 2020 18:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kn7lkr4z/F9ZThPklFtW2J26D8KIYZ1snYsAUn/v2TQ=; b=j8GggcExYf7WBJNnwIVichY9O3
 i1w0/NtlUzigvdBsW7MxeW4BXyl2MKJE8LqVmtDCy6HamXUCkF05lnLQefbmCFNfH6RP9YjlVh8y8
 sYRZAkEEEwCMNTHkyEce3nFoBrdrB8fYxtGeiWNZNA2cI7m4BbJdoMaewcg4rPmIkAT0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kn7lkr4z/F9ZThPklFtW2J26D8KIYZ1snYsAUn/v2TQ=; b=HCiQfjuYDxE1V+VeF7XSxqvTs/
 OXunzdxyQoMV7bTNlIe63GM6/ifK26LQHjmW9NYLxVYBHFnNzNoEl7KmPvPYlJCKCaXHxIrjt7EHC
 +NISyoJRSGY+udweQY+qJe8ieuvLDaf0BB7N8BE9iKj9MK7r7pgmGO6hM4cJNkCt31p8=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jvPql-003BGi-QN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jul 2020 18:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594752020; x=1626288020;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ln6gEDISySHENlDYsYlWNdWXPZCEQ/wJil94ox+Rtak=;
 b=FeOf+7HcJ7G5acfM7q6gL+Wbe9JB//KK8hYA1weus3pjrQUFRTQC3nPF
 2gVVR+oarfur/iliZowqywMnVfqvVwb5YbPPR+bkIKg1fnVljFzonj7u7
 Ri3GOXxR9TMLk9ho45jc2GD9f7JJAM2T/isszvlHchqMSzE/nEoFn50yz
 puzSZo13s27POtG8sBl+3Zw2Ksf0uiHLHdSZVpKdRp3FHos3e9peegLFH
 AH5iH1KrhOLfTJqVXLbfy8W4gIUK4Nn0fkzd+BErjLJRfb3ae4FEzug/W
 nS2Duq2sIDMOzcB2ef3Xgjg3YX3C/k+MIV6nPqIWg/iJUXECZDEzJr3Ez g==;
IronPort-SDR: CA+MN1X6Fz0Ktp1/AHHWMYuOrmnrTc60akNv4R18LrmyRfg51615bG04MZHV5jchRZ9kFABjVs
 +zY8o5OM3OKGBLvjb2bFlHYpb+xCGLXYS0Zp4vJcO+o/Zm2D/GRWYM0gKyI8bPuUStXPSoE7mU
 Ct+p1xx5v8YxkyzPsAUeiYhLJnHKKNAQIJ2sJN15BNzbu1IERaQXkM3jKfWlHhDtgxHxFQFE8k
 VnrYUjzQA4rj7QqE9m6OFCjSyuUhLetVLj05J5uydraraJnXz5sYKAVmBm+3rQpF0uOHdD25tV
 9Sk=
X-IronPort-AV: E=Sophos;i="5.75,352,1589212800"; d="scan'208";a="143758856"
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2020 02:40:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxtG6E7EWxrdZaXn0WdYT6/lSEOkkL6/smpXUfLX4silUHRbws/6pvhEU54qulI1cfWT8epwguF0tteFdhlwBpCp9hlL3W0YLQ7w5WJY6k8qLJ9huEOBJmCBKj8mFh+6y4djwknAYj7ITxYK5WL0NVldp98DkKzCmOn0KALMRoCb2XXbl1DrN/QX0ozMajSLGycpefSvn6kS8bgQy/R6t7R+IbDhdoK99bXLjTsFbLXxbKj+IpRY/kJbz78cXZBdBDueIo/RqFprVcnkd6mFelD5LL6gVpf6rYk63D0KagI+xcDc2NwLj5PBGS0S7o3VhX01BZVUeGgeyRajQlu51g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kn7lkr4z/F9ZThPklFtW2J26D8KIYZ1snYsAUn/v2TQ=;
 b=EcPJvlHeOF/m0L8PPXBRubfJAXZB/SBFiEjBJHHLB1nqPX6u/XwlzBQLgSs4NWmiUjIXMxEhpzVKZfWp2t8oplmU3YoZtH/QTbLcmxpaL1RaZL1PZGjd5fQ9hSCWxoCqfxjNHo32PhTPInXPiy1q/EO/RnyX0LwgtT30y/gffJdMOH2koZ91mN1Jo/gDlkXb/SAYJKRoS8zBeiyWYbsfJL/mlfelLq3JKYEI2/fLnu9lI08MfeVlsDK8Vr+LK1LS//DxRiLu0utUBpCid0d9aaB+9a0/GZjGcdLKPzCfaGln/8L+y3gWptMVYjxCG+O+BUwi18BkmzkoXVs745qczA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kn7lkr4z/F9ZThPklFtW2J26D8KIYZ1snYsAUn/v2TQ=;
 b=r68vqqd/8bXrB/Q9FZuCdAa0MD6kpd4LCVpqDfR2GzxvM2bXX2DdvQlI1ugGD0HUgsGOkbTlFp1o6bQcVNYdqhMyBN3Mo7YqFn7rTmfZRGlvsycxwqv08h4YuTRYw0L7odOW3IjH21htzMJ85aG20m9PgmrKkn/xR+aDvYzVfSY=
Received: from BY5PR04MB6995.namprd04.prod.outlook.com (2603:10b6:a03:22c::12)
 by BYAPR04MB5063.namprd04.prod.outlook.com (2603:10b6:a03:44::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Tue, 14 Jul
 2020 18:40:02 +0000
Received: from BY5PR04MB6995.namprd04.prod.outlook.com
 ([fe80::f813:2bba:2c5c:a63b]) by BY5PR04MB6995.namprd04.prod.outlook.com
 ([fe80::f813:2bba:2c5c:a63b%7]) with mapi id 15.20.3174.026; Tue, 14 Jul 2020
 18:40:02 +0000
From: Aravind Ramesh <Aravind.Ramesh@wdc.com>
To: Chao Yu <yuchao0@huawei.com>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "hch@lst.de" <hch@lst.de>
Thread-Topic: [PATCH v2 1/1] f2fs: support zone capacity less than zone size
Thread-Index: AQHWVuG8df1cHLlYCEqjMFhbHkjwLakG/kWAgABix9A=
Date: Tue, 14 Jul 2020 18:40:02 +0000
Message-ID: <BY5PR04MB69955AA241F77C37D6020CCE8C610@BY5PR04MB6995.namprd04.prod.outlook.com>
References: <20200710174353.21988-1-aravind.ramesh@wdc.com>
 <20200710174353.21988-2-aravind.ramesh@wdc.com>
 <c9d121e3-294d-189f-9314-01dc0b0b7ab5@huawei.com>
In-Reply-To: <c9d121e3-294d-189f-9314-01dc0b0b7ab5@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.179.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a578f7e8-cc46-4e08-a90c-08d8282551c8
x-ms-traffictypediagnostic: BYAPR04MB5063:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB50638F272EAFEF3BDFA52B018C610@BYAPR04MB5063.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tEquve5xeW0sZVoiRZexT+j2qFf9aKMrEDlmBiq2IMZfRAkPBgb4AsfC1vTQCMMVhV4jqZR4jzpynv0ATJG2sqGgrIkyuLdO0CoPriF1sErURrG7Qho2ZZ2Fr11AZdpWflOyqIXCagVj6gI0H58qGiDHvr+Y9VyAbwuBskg7Ma3av/XI6PoFSIGUaYjpxNUx6VfIVLNDEJzgk+lfKRhY4RNCiDM1jzNXCurygAom7+OUUxCaQZXQBWG6y/A1KSSFMbdylY4rgN+z6f8vPlo1jMTw5PjEocG1ObFEkMmqK7/H01AbCot2nmZ3dbnzwcarL8Lh/QUcRQbHAq7Pq5jmvf0YJf9mbUDQaG/qoIOt91bYKKoWzjf7sZhH9E3HpzHZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6995.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(366004)(136003)(39850400004)(396003)(66476007)(66556008)(64756008)(66446008)(76116006)(9686003)(54906003)(55016002)(66946007)(316002)(26005)(186003)(53546011)(6506007)(110136005)(5660300002)(478600001)(2906002)(33656002)(30864003)(7696005)(8936002)(52536014)(4326008)(8676002)(86362001)(71200400001)(83380400001)(21314003)(579004)(559001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: WMQduXT2V8lqv4RcPu+8IjmoT8QpcS6frP0zz/kENBYuqvveloce3QiIUTHyacT6ovNY94RO4WxnT1z083YYx8Tuh7qxw4zthGaRgjtzRcnna3vf07TSMKGDqi7+xlyigFwf+LZs2vNtR98BzJCB054Yxo8VoXS6qKASnIAHjVZ9+ZINuwiksDQEuq+fMFlV6unfHjgwrNv0Fgrv1OXpx9sHVuaD4pjEJorRwAkTLsEZbDLeftI4CVe6d8y4HkPm0c+Zhjns6BE4F0TN7Iia9i9fGbwzA/OUwxZj5uz5z0k051hUL41FpRIjfjU4xQH21AA3OU3HTrHuwhj4Xwhcs/BRPn6q7QUPY9PTxPBtcemaM9Z1MPnSeqx6a1FhCDTNakx2K/fbDUL5OmnXMg30NFKZSddOp8Fv23uNIlMd8OrJ1KB9AcsqphLpov2vJjt2NHXhLm3UgGoLc1FVp8VGdM5bvOCpiDFgM9vHd51QZhW2oTbf6wlCn/85BVgzGxXE
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6995.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a578f7e8-cc46-4e08-a90c-08d8282551c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2020 18:40:02.2606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0r6xrmIeN2SNXK+1BuZumn4Sx2qu3QlOCPl87ec/cxke4KtJZGUjxEwd4TqcSk4qetk1v2k9RU+ehH/ugibsmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5063
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jvPql-003BGi-QN
Subject: Re: [f2fs-dev] [PATCH v2 1/1] f2fs: support zone capacity less than
 zone size
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
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 Matias Bjorling <Matias.Bjorling@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Thanks for the valuable feedback.
My comments are inline.
Will send the V3 with the feedback incorporated.

Regards,
Aravind

> -----Original Message-----
> From: Chao Yu <yuchao0@huawei.com>
> Sent: Tuesday, July 14, 2020 5:28 PM
> To: Aravind Ramesh <Aravind.Ramesh@wdc.com>; jaegeuk@kernel.org; linux-
> fsdevel@vger.kernel.org; linux-f2fs-devel@lists.sourceforge.net; hch@lst.de
> Cc: Damien Le Moal <Damien.LeMoal@wdc.com>; Niklas Cassel
> <Niklas.Cassel@wdc.com>; Matias Bjorling <Matias.Bjorling@wdc.com>
> Subject: Re: [PATCH v2 1/1] f2fs: support zone capacity less than zone size
> 
> On 2020/7/11 1:43, Aravind Ramesh wrote:
> > NVMe Zoned Namespace devices can have zone-capacity less than zone-size.
> > Zone-capacity indicates the maximum number of sectors that are usable
> > in a zone beginning from the first sector of the zone. This makes the
> > sectors sectors after the zone-capacity till zone-size to be unusable.
> > This patch set tracks zone-size and zone-capacity in zoned devices and
> > calculate the usable blocks per segment and usable segments per section.
> >
> > If zone-capacity is less than zone-size mark only those segments which
> > start before zone-capacity as free segments. All segments at and
> > beyond zone-capacity are treated as permanently used segments. In
> > cases where zone-capacity does not align with segment size the last
> > segment will start before zone-capacity and end beyond the
> > zone-capacity of the zone. For such spanning segments only sectors within the
> zone-capacity are used.
> >
> > During writes and GC manage the usable segments in a section and
> > usable blocks per segment. Segments which are beyond zone-capacity are
> > never allocated, and do not need to be garbage collected, only the
> > segments which are before zone-capacity needs to garbage collected.
> > For spanning segments based on the number of usable blocks in that
> > segment, write to blocks only up to zone-capacity.
> >
> > Zone-capacity is device specific and cannot be configured by the user.
> > Since NVMe ZNS device zones are sequentially write only, a block
> > device with conventional zones or any normal block device is needed
> > along with the ZNS device for the metadata operations of F2fs.
> >
> > A typical nvme-cli output of a zoned device shows zone start and
> > capacity and write pointer as below:
> >
> > SLBA: 0x0     WP: 0x0     Cap: 0x18800 State: EMPTY Type: SEQWRITE_REQ
> > SLBA: 0x20000 WP: 0x20000 Cap: 0x18800 State: EMPTY Type: SEQWRITE_REQ
> > SLBA: 0x40000 WP: 0x40000 Cap: 0x18800 State: EMPTY Type: SEQWRITE_REQ
> >
> > Here zone size is 64MB, capacity is 49MB, WP is at zone start as the
> > zones are in EMPTY state. For each zone, only zone start + 49MB is
> > usable area, any lba/sector after 49MB cannot be read or written to,
> > the drive will fail any attempts to read/write. So, the second zone
> > starts at 64MB and is usable till 113MB (64 + 49) and the range
> > between 113 and 128MB is again unusable. The next zone starts at 128MB, and so
> on.
> >
> > Signed-off-by: Aravind Ramesh <aravind.ramesh@wdc.com>
> > Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> > ---
> >  Documentation/filesystems/f2fs.rst |  15 +++
> >  fs/f2fs/f2fs.h                     |   5 +
> >  fs/f2fs/gc.c                       |  27 +++--
> >  fs/f2fs/gc.h                       |  42 +++++++-
> >  fs/f2fs/segment.c                  | 154 ++++++++++++++++++++++++++---
> >  fs/f2fs/segment.h                  |  21 ++--
> >  fs/f2fs/super.c                    |  41 ++++++--
> >  7 files changed, 267 insertions(+), 38 deletions(-)
> >
> > diff --git a/Documentation/filesystems/f2fs.rst
> > b/Documentation/filesystems/f2fs.rst
> > index 535021c46260..cec2167a31db 100644
> > --- a/Documentation/filesystems/f2fs.rst
> > +++ b/Documentation/filesystems/f2fs.rst
> > @@ -766,3 +766,18 @@ Compress metadata layout::
> >  	+-------------+-------------+----------+----------------------------+
> >  	| data length | data chksum | reserved |      compressed data       |
> >
> > +-------------+-------------+----------+----------------------------+
> > +
> > +NVMe Zoned Namespace devices
> > +----------------------------
> > +
> > +- ZNS defines a per-zone capacity which can be equal or less than the
> > +  zone-size. Zone-capacity is the number of usable blocks in the zone.
> > +  F2fs checks if zone-capacity is less than zone-size, if it is, then
> > +any
> > +  segment which starts after the zone-capacity is marked as not-free
> > +in
> > +  the free segment bitmap at initial mount time. These segments are
> > +marked
> > +  as permanently used so they are not allocated for writes and
> > +  consequently are not needed to be garbage collected. In case the
> > +  zone-capacity is not aligned to default segment size(2MB), then a
> > +segment
> > +  can start before the zone-capacity and span across zone-capacity boundary.
> > +  Such spanning segments are also considered as usable segments. All
> > +blocks
> > +  past the zone-capacity are considered unusable in these segments.
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h index
> > e6e47618a357..73219e4e1ba4 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -1232,6 +1232,7 @@ struct f2fs_dev_info {  #ifdef
> > CONFIG_BLK_DEV_ZONED
> >  	unsigned int nr_blkz;		/* Total number of zones */
> >  	unsigned long *blkz_seq;	/* Bitmap indicating sequential zones */
> > +	block_t *zone_capacity_blocks;  /* Array of zone capacity in blks */
> >  #endif
> >  };
> >
> > @@ -3395,6 +3396,10 @@ void f2fs_destroy_segment_manager_caches(void);
> >  int f2fs_rw_hint_to_seg_type(enum rw_hint hint);  enum rw_hint
> > f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
> >  			enum page_type type, enum temp_type temp);
> > +unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
> > +			unsigned int segno);
> > +unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
> > +			unsigned int segno);
> >
> >  /*
> >   * checkpoint.c
> > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c index
> > 9a40761445d3..dfa6d91cffcb 100644
> > --- a/fs/f2fs/gc.c
> > +++ b/fs/f2fs/gc.c
> > @@ -266,13 +266,14 @@ static unsigned int get_cb_cost(struct f2fs_sb_info
> *sbi, unsigned int segno)
> >  	unsigned char age = 0;
> >  	unsigned char u;
> >  	unsigned int i;
> > +	unsigned int usable_segs_per_sec = f2fs_usable_segs_in_sec(sbi,
> > +segno);
> >
> > -	for (i = 0; i < sbi->segs_per_sec; i++)
> > +	for (i = 0; i < usable_segs_per_sec; i++)
> >  		mtime += get_seg_entry(sbi, start + i)->mtime;
> >  	vblocks = get_valid_blocks(sbi, segno, true);
> >
> > -	mtime = div_u64(mtime, sbi->segs_per_sec);
> > -	vblocks = div_u64(vblocks, sbi->segs_per_sec);
> > +	mtime = div_u64(mtime, usable_segs_per_sec);
> > +	vblocks = div_u64(vblocks, usable_segs_per_sec);
> >
> >  	u = (vblocks * 100) >> sbi->log_blocks_per_seg;
> >
> > @@ -536,6 +537,7 @@ static int gc_node_segment(struct f2fs_sb_info *sbi,
> >  	int phase = 0;
> >  	bool fggc = (gc_type == FG_GC);
> >  	int submitted = 0;
> > +	unsigned int usable_blks_in_seg = f2fs_usable_blks_in_seg(sbi,
> > +segno);
> >
> >  	start_addr = START_BLOCK(sbi, segno);
> >
> > @@ -545,7 +547,7 @@ static int gc_node_segment(struct f2fs_sb_info *sbi,
> >  	if (fggc && phase == 2)
> >  		atomic_inc(&sbi->wb_sync_req[NODE]);
> >
> > -	for (off = 0; off < sbi->blocks_per_seg; off++, entry++) {
> > +	for (off = 0; off < usable_blks_in_seg; off++, entry++) {
> >  		nid_t nid = le32_to_cpu(entry->nid);
> >  		struct page *node_page;
> >  		struct node_info ni;
> > @@ -1033,13 +1035,14 @@ static int gc_data_segment(struct f2fs_sb_info *sbi,
> struct f2fs_summary *sum,
> >  	int off;
> >  	int phase = 0;
> >  	int submitted = 0;
> > +	unsigned int usable_blks_in_seg = f2fs_usable_blks_in_seg(sbi,
> > +segno);
> >
> >  	start_addr = START_BLOCK(sbi, segno);
> >
> >  next_step:
> >  	entry = sum;
> >
> > -	for (off = 0; off < sbi->blocks_per_seg; off++, entry++) {
> > +	for (off = 0; off < usable_blks_in_seg; off++, entry++) {
> >  		struct page *data_page;
> >  		struct inode *inode;
> >  		struct node_info dni; /* dnode info for the data */ @@ -1201,7
> > +1204,16 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
> >  						SUM_TYPE_DATA :
> SUM_TYPE_NODE;
> >  	int submitted = 0;
> >
> > -	if (__is_large_section(sbi))
> > +       /*
> > +	* zone-capacity can be less than zone-size in zoned devices,
> > +	* resulting in less than expected usable segments in the zone,
> > +	* calculate the end segno in the zone which can be garbage collected
> > +	*/
> > +	if (f2fs_sb_has_blkzoned(sbi))
> > +		end_segno -= sbi->segs_per_sec -
> > +					f2fs_usable_segs_in_sec(sbi, segno);
> > +
> > +	else if (__is_large_section(sbi))
> >  		end_segno = rounddown(end_segno, sbi->segs_per_sec);
> 
> end_segno could be beyond end of section, so below calculation could adjust it to
> the end of section first, then adjust to zone-capacity boundary.
> 
> 	if (__is_large_section(sbi))
> 		end_segno = rounddown(end_segno, sbi->segs_per_sec);
> 
> 	if (f2fs_sb_has_blkzoned(sbi))
> 		end_segno -= sbi->segs_per_sec -
> 				f2fs_usable_segs_in_sec(sbi, segno);
Ok, will change it.
> 
> >
> >  	/* readahead multi ssa blocks those have contiguous address */ @@
> > -1356,7 +1368,8 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
> >  		goto stop;
> >
> >  	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type);
> > -	if (gc_type == FG_GC && seg_freed == sbi->segs_per_sec)
> > +	if (gc_type == FG_GC &&
> > +		seg_freed == f2fs_usable_segs_in_sec(sbi, segno))
> >  		sec_freed++;
> >  	total_freed += seg_freed;
> >
> > diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h index
> > db3c61046aa4..463b4e38b864 100644
> > --- a/fs/f2fs/gc.h
> > +++ b/fs/f2fs/gc.h
> > @@ -44,13 +44,47 @@ struct gc_inode_list {
> >  /*
> >   * inline functions
> >   */
> > +
> > +/*
> > + * On a Zoned device zone-capacity can be less than zone-size and if
> > + * zone-capacity is not aligned to f2fs segment size(2MB), then the
> > +segment
> > + * starting just before zone-capacity has some blocks spanning across
> > +the
> > + * zone-capacity, these blocks are not usable.
> > + * Such spanning segments can be in free list so calculate the sum of
> > +usable
> > + * blocks in currently free segments including normal and spanning segments.
> > + */
> > +static inline block_t free_segs_blk_count_zoned(struct f2fs_sb_info
> > +*sbi) {
> > +	block_t free_seg_blks = 0;
> > +	struct free_segmap_info *free_i = FREE_I(sbi);
> > +	int j;
> > +
> 
> spin_lock(&free_i->segmap_lock);
Ok
> 
> > +	for (j = 0; j < MAIN_SEGS(sbi); j++)
> > +		if (!test_bit(j, free_i->free_segmap))
> > +			free_seg_blks += f2fs_usable_blks_in_seg(sbi, j);
> 
> spin_unlock(&free_i->segmap_lock);
Ok
> 
> > +
> > +	return free_seg_blks;
> > +}
> > +
> > +static inline block_t free_segs_blk_count(struct f2fs_sb_info *sbi) {
> > +	if (f2fs_sb_has_blkzoned(sbi))
> > +		return free_segs_blk_count_zoned(sbi);
> > +
> > +	return free_segments(sbi) << sbi->log_blocks_per_seg; }
> > +
> >  static inline block_t free_user_blocks(struct f2fs_sb_info *sbi)  {
> > -	if (free_segments(sbi) < overprovision_segments(sbi))
> > +	block_t free_blks, ovp_blks;
> > +
> > +	free_blks = free_segs_blk_count(sbi);
> > +	ovp_blks = overprovision_segments(sbi) << sbi->log_blocks_per_seg;
> > +
> > +	if (free_blks < ovp_blks)
> >  		return 0;
> > -	else
> > -		return (free_segments(sbi) - overprovision_segments(sbi))
> > -			<< sbi->log_blocks_per_seg;
> > +
> > +	return free_blks - ovp_blks;
> >  }
> >
> >  static inline block_t limit_invalid_user_blocks(struct f2fs_sb_info
> > *sbi) diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c index
> > c35614d255e1..d75c1849dc83 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -869,10 +869,10 @@ static void locate_dirty_segment(struct f2fs_sb_info
> *sbi, unsigned int segno)
> >  	ckpt_valid_blocks = get_ckpt_valid_blocks(sbi, segno);
> 
> unsigned int usable_blocks = f2fs_usable_blks_in_seg(sbi, segno);
> 
> >
> >  	if (valid_blocks == 0 && (!is_sbi_flag_set(sbi, SBI_CP_DISABLED) ||
> > -				ckpt_valid_blocks == sbi->blocks_per_seg)) {
> 
> ckpt_valid_blocks == usable_blocks
> 
> > +		ckpt_valid_blocks == f2fs_usable_blks_in_seg(sbi, segno))) {
> >  		__locate_dirty_segment(sbi, segno, PRE);
> >  		__remove_dirty_segment(sbi, segno, DIRTY);
> > -	} else if (valid_blocks < sbi->blocks_per_seg) {
> > +	} else if (valid_blocks < f2fs_usable_blks_in_seg(sbi, segno)) {
> 
> } else if (valid_blocks < usable_blocks) {
> 
Ok.
> 
> BTW, would you consider to add a field as below to avoid calculation whenever we
> want to get usable_blocks in segment:

The reason to do it like this is that f2fs supports using multiple devices to create a volume. 
So, if 2 ZNS devices are used where both have same zone-size but different zone capacity, 
then having this single field to indicate usable blocks will not work, as usable blocks of zones 
from different devices are not same. In such a scenario, we would need to maintain an array, 
which stores the usable blocks of each zone based on its zone-capacity.
This approach can eliminate the calculation.

So we actually implemented this approach with a buffer and at mount time this buffer would be 
allocated and populated with all the zone's usable_blocks information and would be read from 
this buffer subsequently. But we did not see any performance difference when compared to 
current approach and concluded that the overhead of calculation was negligible and also 
current approach does not need to modify core data structure, as this field will be used 
only when using a ZNS drive and if that drive has zone capacity less than zone size. 
And for all other cases, the function f2fs_usable_blks_in_seg() just returns sbi->blocks_per_seg 
without any calculation.

If you think, like the calculation overhead is more, then we need to add a pointer and allocate memory
to it to accommodate all zone's zone-capacity info. In my opinion, the gain is very less because of the 
reasons stated above. However, I am open to change it based on your feedback. 

> 
> struct seg_entry {
> 	unsigned long long type:6;		/* segment type like
> CURSEG_XXX_TYPE */
> 	unsigned long long valid_blocks:10;	/* # of valid blocks */
> 	unsigned long long ckpt_valid_blocks:10;	/* # of valid blocks last cp
> */
> 	unsigned long long usable_blocks:10;	/* usable block count in segment
> */
> 	unsigned long long padding:28;		/* padding */
> ...
> 
> For non-zns device, usable_blocks equals to blks_per_seg, otherwise it depends on
> where it locates, we can initialize it in build_sit_entries(), thoughts?
> 
> >  		__locate_dirty_segment(sbi, segno, DIRTY);
> >  	} else {
> >  		/* Recovery routine with SSR needs this */ @@ -915,9 +915,11
> @@
> > block_t f2fs_get_unusable_blocks(struct f2fs_sb_info *sbi)
> >  	for_each_set_bit(segno, dirty_i->dirty_segmap[DIRTY], MAIN_SEGS(sbi)) {
> >  		se = get_seg_entry(sbi, segno);
> >  		if (IS_NODESEG(se->type))
> > -			holes[NODE] += sbi->blocks_per_seg - se->valid_blocks;
> > +			holes[NODE] += f2fs_usable_blks_in_seg(sbi, segno) -
> > +							se->valid_blocks;
> >  		else
> > -			holes[DATA] += sbi->blocks_per_seg - se->valid_blocks;
> > +			holes[DATA] += f2fs_usable_blks_in_seg(sbi, segno) -
> > +							se->valid_blocks;
> >  	}
> >  	mutex_unlock(&dirty_i->seglist_lock);
> >
> > @@ -2167,7 +2169,7 @@ static void update_sit_entry(struct f2fs_sb_info *sbi,
> block_t blkaddr, int del)
> >  	offset = GET_BLKOFF_FROM_SEG0(sbi, blkaddr);
> >
> >  	f2fs_bug_on(sbi, (new_vblocks >> (sizeof(unsigned short) << 3) ||
> > -				(new_vblocks > sbi->blocks_per_seg)));
> > +			(new_vblocks > f2fs_usable_blks_in_seg(sbi, segno))));
> >
> >  	se->valid_blocks = new_vblocks;
> >  	se->mtime = get_mtime(sbi, false);
> > @@ -2933,9 +2935,9 @@ int f2fs_trim_fs(struct f2fs_sb_info *sbi,
> > struct fstrim_range *range)  static bool __has_curseg_space(struct
> > f2fs_sb_info *sbi, int type)  {
> >  	struct curseg_info *curseg = CURSEG_I(sbi, type);
> > -	if (curseg->next_blkoff < sbi->blocks_per_seg)
> > -		return true;
> > -	return false;
> > +
> > +	return curseg->next_blkoff < f2fs_usable_blks_in_seg(sbi,
> > +							curseg->segno);
> >  }
> >
> >  int f2fs_rw_hint_to_seg_type(enum rw_hint hint) @@ -4294,9 +4296,12
> > @@ static void init_free_segmap(struct f2fs_sb_info *sbi)  {
> >  	unsigned int start;
> >  	int type;
> > +	struct seg_entry *sentry;
> >
> >  	for (start = 0; start < MAIN_SEGS(sbi); start++) {
> > -		struct seg_entry *sentry = get_seg_entry(sbi, start);
> > +		if (f2fs_usable_blks_in_seg(sbi, start) == 0)
> > +			continue;
> > +		sentry = get_seg_entry(sbi, start);
> >  		if (!sentry->valid_blocks)
> >  			__set_free(sbi, start);
> >  		else
> > @@ -4316,7 +4321,7 @@ static void init_dirty_segmap(struct f2fs_sb_info *sbi)
> >  	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
> >  	struct free_segmap_info *free_i = FREE_I(sbi);
> >  	unsigned int segno = 0, offset = 0, secno;
> > -	unsigned short valid_blocks;
> > +	unsigned short valid_blocks, usable_blks_in_seg;
> >  	unsigned short blks_per_sec = BLKS_PER_SEC(sbi);
> >
> >  	while (1) {
> > @@ -4326,9 +4331,10 @@ static void init_dirty_segmap(struct f2fs_sb_info *sbi)
> >  			break;
> >  		offset = segno + 1;
> >  		valid_blocks = get_valid_blocks(sbi, segno, false);
> > -		if (valid_blocks == sbi->blocks_per_seg || !valid_blocks)
> > +		usable_blks_in_seg = f2fs_usable_blks_in_seg(sbi, segno);
> > +		if (valid_blocks == usable_blks_in_seg || !valid_blocks)
> >  			continue;
> > -		if (valid_blocks > sbi->blocks_per_seg) {
> > +		if (valid_blocks > usable_blks_in_seg) {
> >  			f2fs_bug_on(sbi, 1);
> >  			continue;
> >  		}
> > @@ -4678,6 +4684,101 @@ int f2fs_check_write_pointer(struct
> > f2fs_sb_info *sbi)
> >
> >  	return 0;
> >  }
> > +
> > +static bool is_conv_zone(struct f2fs_sb_info *sbi, unsigned int zone_idx,
> > +						unsigned int dev_idx)
> > +{
> > +	if (!bdev_is_zoned(FDEV(dev_idx).bdev))
> > +		return true;
> > +	return !test_bit(zone_idx, FDEV(dev_idx).blkz_seq); }
> > +
> > +/* Return the zone index in the given device */ static unsigned int
> > +get_zone_idx(struct f2fs_sb_info *sbi, unsigned int secno,
> > +					int dev_idx)
> > +{
> > +	block_t sec_start_blkaddr = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi,
> > +secno));
> > +
> > +	return (sec_start_blkaddr - FDEV(dev_idx).start_blk) >>
> > +						sbi->log_blocks_per_blkz;
> > +}
> > +
> > +/*
> > + * Return the usable segments in a section based on the zone's
> > + * corresponding zone capacity. Zone is equal to a section.
> > + */
> > +static inline unsigned int f2fs_usable_zone_segs_in_sec(
> > +		struct f2fs_sb_info *sbi, unsigned int segno) {
> > +	unsigned int dev_idx, zone_idx, unusable_segs_in_sec;
> > +
> > +	dev_idx = f2fs_target_device_index(sbi, START_BLOCK(sbi, segno));
> > +	zone_idx = get_zone_idx(sbi, GET_SEC_FROM_SEG(sbi, segno), dev_idx);
> > +
> > +	/* Conventional zone's capacity is always equal to zone size */
> > +	if (is_conv_zone(sbi, zone_idx, dev_idx))
> > +		return sbi->segs_per_sec;
> > +
> > +	/*
> > +	 * If the zone_capacity_blocks array is NULL, then zone capacity
> > +	 * is equal to the zone size for all zones
> > +	 */
> > +	if (!FDEV(dev_idx).zone_capacity_blocks)
> > +		return sbi->segs_per_sec;
> > +
> > +	/* Get the segment count beyond zone capacity block */
> > +	unusable_segs_in_sec = (sbi->blocks_per_blkz -
> > +				FDEV(dev_idx).zone_capacity_blocks[zone_idx])
> >>
> > +				sbi->log_blocks_per_seg;
> > +	return sbi->segs_per_sec - unusable_segs_in_sec; }
> > +
> > +/*
> > + * Return the number of usable blocks in a segment. The number of
> > +blocks
> > + * returned is always equal to the number of blocks in a segment for
> > + * segments fully contained within a sequential zone capacity or a
> > + * conventional zone. For segments partially contained in a
> > +sequential
> > + * zone capacity, the number of usable blocks up to the zone capacity
> > + * is returned. 0 is returned in all other cases.
> > + */
> > +static inline unsigned int f2fs_usable_zone_blks_in_seg(
> > +			struct f2fs_sb_info *sbi, unsigned int segno) {
> > +	block_t seg_start, sec_start_blkaddr, sec_cap_blkaddr;
> > +	unsigned int zone_idx, dev_idx, secno;
> > +
> > +	secno = GET_SEC_FROM_SEG(sbi, segno);
> > +	seg_start = START_BLOCK(sbi, segno);
> > +	dev_idx = f2fs_target_device_index(sbi, seg_start);
> > +	zone_idx = get_zone_idx(sbi, secno, dev_idx);
> > +
> > +	/*
> > +	 * Conventional zone's capacity is always equal to zone size,
> > +	 * so, blocks per segment is unchanged.
> > +	 */
> > +	if (is_conv_zone(sbi, zone_idx, dev_idx))
> > +		return sbi->blocks_per_seg;
> > +
> > +	if (!FDEV(dev_idx).zone_capacity_blocks)
> > +		return sbi->blocks_per_seg;
> > +
> > +	sec_start_blkaddr = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, secno));
> > +	sec_cap_blkaddr = sec_start_blkaddr +
> > +				FDEV(dev_idx).zone_capacity_blocks[zone_idx];
> > +
> > +	/*
> > +	 * If segment starts before zone capacity and spans beyond
> > +	 * zone capacity, then usable blocks are from seg start to
> > +	 * zone capacity. If the segment starts after the zone capacity,
> > +	 * then there are no usable blocks.
> > +	 */
> > +	if (seg_start >= sec_cap_blkaddr)
> > +		return 0;
> > +	if (seg_start + sbi->blocks_per_seg > sec_cap_blkaddr)
> > +		return sec_cap_blkaddr - seg_start;
> > +
> > +	return sbi->blocks_per_seg;
> > +}
> >  #else
> >  int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)  { @@
> > -4688,7 +4789,36 @@ int f2fs_check_write_pointer(struct f2fs_sb_info
> > *sbi)  {
> >  	return 0;
> >  }
> > +
> > +static inline unsigned int f2fs_usable_zone_blks_in_seg(struct f2fs_sb_info *sbi,
> > +							unsigned int segno)
> > +{
> > +	return 0;
> > +}
> > +
> > +static inline unsigned int f2fs_usable_zone_segs_in_sec(struct f2fs_sb_info *sbi,
> > +							unsigned int segno)
> > +{
> > +	return 0;
> > +}
> >  #endif
> > +unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
> > +					unsigned int segno)
> > +{
> > +	if (f2fs_sb_has_blkzoned(sbi))
> > +		return f2fs_usable_zone_blks_in_seg(sbi, segno);
> > +
> > +	return sbi->blocks_per_seg;
> > +}
> > +
> > +unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
> > +					unsigned int segno)
> > +{
> > +	if (f2fs_sb_has_blkzoned(sbi))
> > +		return f2fs_usable_zone_segs_in_sec(sbi, segno);
> > +
> > +	return sbi->segs_per_sec;
> > +}
> >
> >  /*
> >   * Update min, max modified time for cost-benefit GC algorithm diff
> > --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h index
> > f261e3e6a69b..41bc08013160 100644
> > --- a/fs/f2fs/segment.h
> > +++ b/fs/f2fs/segment.h
> > @@ -411,6 +411,7 @@ static inline void __set_free(struct f2fs_sb_info *sbi,
> unsigned int segno)
> >  	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
> >  	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
> >  	unsigned int next;
> > +	unsigned int usable_segs = f2fs_usable_segs_in_sec(sbi, segno);
> >
> >  	spin_lock(&free_i->segmap_lock);
> >  	clear_bit(segno, free_i->free_segmap); @@ -418,7 +419,7 @@ static
> > inline void __set_free(struct f2fs_sb_info *sbi, unsigned int segno)
> >
> >  	next = find_next_bit(free_i->free_segmap,
> >  			start_segno + sbi->segs_per_sec, start_segno);
> > -	if (next >= start_segno + sbi->segs_per_sec) {
> > +	if (next >= start_segno + usable_segs) {
> >  		clear_bit(secno, free_i->free_secmap);
> >  		free_i->free_sections++;
> >  	}
> > @@ -444,6 +445,7 @@ static inline void __set_test_and_free(struct f2fs_sb_info
> *sbi,
> >  	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
> >  	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
> >  	unsigned int next;
> > +	unsigned int usable_segs = f2fs_usable_segs_in_sec(sbi, segno);
> >
> >  	spin_lock(&free_i->segmap_lock);
> >  	if (test_and_clear_bit(segno, free_i->free_segmap)) { @@ -453,7
> > +455,7 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
> >  			goto skip_free;
> >  		next = find_next_bit(free_i->free_segmap,
> >  				start_segno + sbi->segs_per_sec, start_segno);
> > -		if (next >= start_segno + sbi->segs_per_sec) {
> > +		if (next >= start_segno + usable_segs) {
> >  			if (test_and_clear_bit(secno, free_i->free_secmap))
> >  				free_i->free_sections++;
> >  		}
> > @@ -546,8 +548,8 @@ static inline bool has_curseg_enough_space(struct
> f2fs_sb_info *sbi)
> >  	/* check current node segment */
> >  	for (i = CURSEG_HOT_NODE; i <= CURSEG_COLD_NODE; i++) {
> >  		segno = CURSEG_I(sbi, i)->segno;
> > -		left_blocks = sbi->blocks_per_seg -
> > -			get_seg_entry(sbi, segno)->ckpt_valid_blocks;
> > +		left_blocks = f2fs_usable_blks_in_seg(sbi, segno) -
> > +				get_seg_entry(sbi, segno)->ckpt_valid_blocks;
> >
> >  		if (node_blocks > left_blocks)
> >  			return false;
> > @@ -555,7 +557,7 @@ static inline bool has_curseg_enough_space(struct
> > f2fs_sb_info *sbi)
> >
> >  	/* check current data segment */
> >  	segno = CURSEG_I(sbi, CURSEG_HOT_DATA)->segno;
> > -	left_blocks = sbi->blocks_per_seg -
> > +	left_blocks = f2fs_usable_blks_in_seg(sbi, segno) -
> >  			get_seg_entry(sbi, segno)->ckpt_valid_blocks;
> >  	if (dent_blocks > left_blocks)
> >  		return false;
> > @@ -677,21 +679,22 @@ static inline int check_block_count(struct f2fs_sb_info
> *sbi,
> >  	bool is_valid  = test_bit_le(0, raw_sit->valid_map) ? true : false;
> >  	int valid_blocks = 0;
> >  	int cur_pos = 0, next_pos;
> > +	unsigned int usable_blks_per_seg = f2fs_usable_blks_in_seg(sbi,
> > +segno);
> >
> >  	/* check bitmap with valid block count */
> >  	do {
> >  		if (is_valid) {
> >  			next_pos = find_next_zero_bit_le(&raw_sit->valid_map,
> > -					sbi->blocks_per_seg,
> > +					usable_blks_per_seg,
> >  					cur_pos);
> >  			valid_blocks += next_pos - cur_pos;
> >  		} else
> >  			next_pos = find_next_bit_le(&raw_sit->valid_map,
> > -					sbi->blocks_per_seg,
> > +					usable_blks_per_seg,
> >  					cur_pos);
> >  		cur_pos = next_pos;
> >  		is_valid = !is_valid;
> > -	} while (cur_pos < sbi->blocks_per_seg);
> > +	} while (cur_pos < usable_blks_per_seg);
> 
> I meant we need to check that there should be no valid slot locates beyond zone-
> capacity in bitmap:
Ahh, ok. Got it. Will change.
> 
> if (usable_blks_per_seg < sbi->blocks_per_seg)
> 	f2fs_bug_on(
> 		find_next_bit_le(&raw_sit->valid_map,
> 				sbi->blocks_per_seg,
> 				usable_blks_per_seg) != sbi->blocks_per_seg)
> 
> >
> >  	if (unlikely(GET_SIT_VBLOCKS(raw_sit) != valid_blocks)) {
> >  		f2fs_err(sbi, "Mismatch valid blocks %d vs. %d", @@ -701,7 +704,7
> > @@ static inline int check_block_count(struct f2fs_sb_info *sbi,
> >  	}
> >
> >  	/* check segment usage, and check boundary of a given segment number */
> > -	if (unlikely(GET_SIT_VBLOCKS(raw_sit) > sbi->blocks_per_seg
> > +	if (unlikely(GET_SIT_VBLOCKS(raw_sit) > usable_blks_per_seg
> >  					|| segno > TOTAL_SEGS(sbi) - 1)) {
> >  		f2fs_err(sbi, "Wrong valid blocks %d or segno %u",
> >  			 GET_SIT_VBLOCKS(raw_sit), segno); diff --git
> a/fs/f2fs/super.c
> > b/fs/f2fs/super.c index 80cb7cd358f8..7ced425dc102 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -1164,6 +1164,7 @@ static void destroy_device_list(struct f2fs_sb_info *sbi)
> >  		blkdev_put(FDEV(i).bdev, FMODE_EXCL);  #ifdef
> CONFIG_BLK_DEV_ZONED
> >  		kvfree(FDEV(i).blkz_seq);
> > +		kfree(FDEV(i).zone_capacity_blocks);
> >  #endif
> >  	}
> >  	kvfree(sbi->devs);
> > @@ -3039,13 +3040,26 @@ static int init_percpu_info(struct
> > f2fs_sb_info *sbi)  }
> >
> >  #ifdef CONFIG_BLK_DEV_ZONED
> > +
> > +struct f2fs_report_zones_args {
> > +	struct f2fs_dev_info *dev;
> > +	bool zone_cap_mismatch;
> > +};
> > +
> >  static int f2fs_report_zone_cb(struct blk_zone *zone, unsigned int idx,
> > -			       void *data)
> > +			      void *data)
> >  {
> > -	struct f2fs_dev_info *dev = data;
> > +	struct f2fs_report_zones_args *rz_args = data;
> > +
> > +	if (zone->type == BLK_ZONE_TYPE_CONVENTIONAL)
> > +		return 0;
> > +
> > +	set_bit(idx, rz_args->dev->blkz_seq);
> > +	rz_args->dev->zone_capacity_blocks[idx] = zone->capacity >>
> > +						F2FS_LOG_SECTORS_PER_BLOCK;
> > +	if (zone->len != zone->capacity && !rz_args->zone_cap_mismatch)
> > +		rz_args->zone_cap_mismatch = true;
> >
> > -	if (zone->type != BLK_ZONE_TYPE_CONVENTIONAL)
> > -		set_bit(idx, dev->blkz_seq);
> >  	return 0;
> >  }
> >
> > @@ -3053,6 +3067,7 @@ static int init_blkz_info(struct f2fs_sb_info
> > *sbi, int devi)  {
> >  	struct block_device *bdev = FDEV(devi).bdev;
> >  	sector_t nr_sectors = bdev->bd_part->nr_sects;
> > +	struct f2fs_report_zones_args rep_zone_arg;
> >  	int ret;
> >
> >  	if (!f2fs_sb_has_blkzoned(sbi))
> > @@ -3078,12 +3093,26 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int
> devi)
> >  	if (!FDEV(devi).blkz_seq)
> >  		return -ENOMEM;
> >
> > -	/* Get block zones type */
> > +	/* Get block zones type and zone-capacity */
> > +	FDEV(devi).zone_capacity_blocks = f2fs_kzalloc(sbi,
> > +					FDEV(devi).nr_blkz * sizeof(block_t),
> > +					GFP_KERNEL);
> > +	if (!FDEV(devi).zone_capacity_blocks)
> > +		return -ENOMEM;
> > +
> > +	rep_zone_arg.dev = &FDEV(devi);
> > +	rep_zone_arg.zone_cap_mismatch = false;
> > +
> >  	ret = blkdev_report_zones(bdev, 0, BLK_ALL_ZONES, f2fs_report_zone_cb,
> > -				  &FDEV(devi));
> > +				  &rep_zone_arg);
> >  	if (ret < 0)
> 
> kfree(FDEV(devi).zone_capacity_blocks);
Actually, we do not need to free this here, because if error (ret < 0) is returned, then the control goes back to
destroy_device_list() and deallocates the buffer.

> 
> Thanks,
> 
> >  		return ret;
> >
> > +	if (!rep_zone_arg.zone_cap_mismatch) {
> > +		kfree(FDEV(devi).zone_capacity_blocks);
> > +		FDEV(devi).zone_capacity_blocks = NULL;
> > +	}
> > +
> >  	return 0;
> >  }
> >  #endif
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
