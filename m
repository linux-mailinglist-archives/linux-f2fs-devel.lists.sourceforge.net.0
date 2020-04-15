Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E1D1A98C9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 11:26:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOeJN-0002hg-8N; Wed, 15 Apr 2020 09:26:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=367a5aa7f=Johannes.Thumshirn@wdc.com>)
 id 1jOeJM-0002hV-GY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 09:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=; b=b+br7RplNi4ZRtiOIvTL/V+POE
 V/AmYywYU0+SfgQC4jwEjpAE44r5wy+co2ptm40VycEpEUshiPxunkkKA8wpOjgUJ7b4coxGuzN9j
 kRPP89fYiYAHlYLfmBLZbpq/xu0UMGM46fL9aHpWe6cVW4Ub5Je98nMT/AKwSZQJfhR0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=; b=D
 JEntkzjs/No3G5mb+1I+wAiUpEHMT+y1Jdif2UAR004GO4y7eDEZmNaUWzZo+qlcWymDuBj8VgC0n
 FBdltdiJ9ta2s9MnFWoFjHC5qe26ioDveMQxQnRhscbMlae7zEewfP3N15ZKrQSA3Caq5xnKl1Mws
 4P7buC+rrCQWjxwg=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOeJH-00G8JA-N1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 09:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1586942779; x=1618478779;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=n9QMAVjv/DywmINivx6xWLVoejk6Y/fia2hMyk6Wsf0CusC06HQGwm7U
 1YGNeCUlZMtI22609cddvoqkcp/D/DtziWnaCY1AzifmTIfnvH4cEexw1
 xjakWy4kspUZ7omT5cuKHidMUFkJU/HXAVRdn/4O+/AgnXE4JNkYJKBiU
 43o/Lpei/iCp2DL2VWURS8Cxwfi2NKcTey8dQ2NxNoCMNiY6MyA+uqU7n
 bUP4nYGmQRwzgf1xPVEzX7h7MQFz5QyQCaOWKyx16uC+beC37CVKsJfTm
 gL3gMIhg1g+BPcFJUa6iz6b1FBw5ubdwAgDgh9mW//FfnEPh45X52p5qV w==;
IronPort-SDR: 95i4dpGue9eNjoYk2K/9cbOToVeWBBtkiWiQhEHO7EFSD1h2NzcPaGUo/1aPiT4V91hLq1wdEu
 JkZ8xqP4mXpXp5SOX/Xmby+I5FPE0PQGo64RvyPtXSLe1rR1eWQCBh/n5ZqGNkWddjcHlITDQ7
 Em2CIJuLg2GWAh9K46RexHbC4bfKgJSCUp2DBrlqFOy3cuWpfNvQik3ltm4DEvJSBQVOAs3W28
 tUMBtevXNEyg/7USRKfOrqenmsbSwLJ1Q0bmbVgbu7Aa3j23lF8D+9rCxEwKNKlpZ8g2eVSPTQ
 c0A=
X-IronPort-AV: E=Sophos;i="5.72,386,1580745600"; d="scan'208";a="244033359"
Received: from mail-co1nam04lp2053.outbound.protection.outlook.com (HELO
 NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.53])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2020 17:10:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2Xs028JgTBHrlnEvgJ/p8UilVh5M2YVmknCeMUfx9kjOmVae40x9oNfqJVGD3+OJbuHLD3osu3GbQv5GvVEWg7Vj3i12IKHT3oHuILszhJ/V3PR4QjzAV1FPdU6UlImyL4GgSZKStp6C+pvdpbz9AJn9vW7U/47vWLgpfGExKhVbKJAmxKL2rfdAcCmLdDOqlp3h7SsPJvmi43IcG9aUXOkNXMBm45ntMBQg2r9kRXA5ikuFPZJj5S7g8sX4wZL6JgPKIfKlRb/3+DrPn7/JiAO0iikOUiNRIwTnNiPabyf9bNf01b151PTwLi5e/LI71mnB7Nxjp36ipEiTefvnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=i4yOOBoRmCsR/I7VlSR8v7lxEPPqjbgrQ8/cDyGRfMsnOKWxhrGtNBYhAXUytn56jl0PeYD8v1PkAFnyMb4R5rekL2rorkgKqG9L3kiJVV7d+h/gW51sXpSZ+KLPRvRC77wFPPpDO4uGs7e+Irro4zli3w+lxkeWrW6NjsRqAfsvs7ntp9SGYNsDpOkgnPpg+slNmTCtjW8QVtRIGYqTIYni1C/pdUyGSQOf2NCjn6viPb931MUWg2h9YKcx9ik0zKl31ZzDN1ffWc4YiRgHl80JRui8uSMmDH3Xyc+HGH0X5YXoGVn+9SujlNAiyVDZE8ytovBs6k8zCvIIPfjGhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=IB/SQjf9mKvmSURSWenwo2Y3VQ/sD/la2pZc4arPiO0zUuodi/0B2/hzs3r8SJ4FxLAJ+BWlug97gAuhSAN5808A54ZOkWmOLDo4798UwGho/fQBReZ9ouPIcovvEBddtkqaD5FXuN7I/5oV2FFffju3BfoSlkqZPrqGpgdNiTI=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 (2603:10b6:803:47::21) by SN4PR0401MB3599.namprd04.prod.outlook.com
 (2603:10b6:803:4e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.28; Wed, 15 Apr
 2020 09:10:31 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::9854:2bc6:1ad2:f655]) by SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::9854:2bc6:1ad2:f655%4]) with mapi id 15.20.2900.028; Wed, 15 Apr 2020
 09:10:31 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Matthew Wilcox <willy@infradead.org>, Andrew Morton
 <akpm@linux-foundation.org>
Thread-Topic: [PATCH v11 01/25] mm: Move readahead prototypes from mm.h
Thread-Index: AQHWEm/+X7EfNJ2OKkyFI+rGvCts3g==
Date: Wed, 15 Apr 2020 09:10:31 +0000
Message-ID: <SN4PR0401MB3598C4E727F07B81F75EA6719BDB0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200414150233.24495-1-willy@infradead.org>
 <20200414150233.24495-2-willy@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Johannes.Thumshirn@wdc.com; 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 65f197ce-a436-4803-b0c4-08d7e11cd958
x-ms-traffictypediagnostic: SN4PR0401MB3599:
x-microsoft-antispam-prvs: <SN4PR0401MB35994BDEBB4BCA4B125C10749BDB0@SN4PR0401MB3599.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(4636009)(346002)(39860400002)(396003)(366004)(376002)(136003)(54906003)(52536014)(91956017)(4326008)(4270600006)(19618925003)(5660300002)(33656002)(110136005)(316002)(186003)(6506007)(71200400001)(76116006)(2906002)(86362001)(7416002)(7696005)(558084003)(9686003)(8936002)(66476007)(26005)(8676002)(66556008)(64756008)(55016002)(66446008)(81156014)(66946007)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eUZe0V7dpVRe38Qbak+OXZnXMUyn2jT1GpYBt1XC9V2HJ5Xyago/PL79j8PJ7619d2CH50W5/iS8pHaam7mIgNQNZRbvaicuoSDerHprEzxgP9eZJqtrq9NCCJfQs9YMXgGl6qtzBp4d7ksbQayumPPqBS6CDrh6YZs1sL8hb29So5FmZ3+SogifY4lT5oc4Lnpiluy0Kc4JsJSjE11g2BR6gOGvCVYGdoS0ma1fhbU0L9Gqp8MJxV4b9QkZINmG1LAisy4WG3FHHVRYneSdJLQmbKvqj2qWLu2IiPYOCWSZ7VOOw6UsRiltYIMccHb81ZRxHgAeqp91etm8J71vbObfkjaVsk7VG0W1VgwAasdDG4wu0CyiIFMukSnep8TMPWZ2CEg6zwLe/HFT06TK5J3vkUI0yfY6iCBO1bdyFsmebbUmDkmrO2pLCi/Q4mzl
x-ms-exchange-antispam-messagedata: qMgzjpfOIFZuBsMKi59iqhZM4tReTMgOPKnS76raZ+3KcRbEKzSza4SbkVVNRsq7pQNw92YUmPtibdfvwNsFL6xcmfv8FsxlbXu+l+1sqzi8JXYMmslLPvDBbFkpr37lGmGMCfDrJoh7IfJfypgRvg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f197ce-a436-4803-b0c4-08d7e11cd958
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 09:10:31.7107 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZbWFK7kHx7rw59FVwqO+RfmhITfV5Zu3Iza6p3zBcbXwLKKUzSNQZljS1V+A4nBx7sdlgjD7Vb6RJQ1i/Ys64htwy3/Mpy5928efB5Ofej0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0401MB3599
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jOeJH-00G8JA-N1
Subject: Re: [f2fs-dev] [PATCH v11 01/25] mm: Move readahead prototypes from
 mm.h
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
Cc: "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 William Kucharski <william.kucharski@oracle.com>,
 John Hubbard <jhubbard@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
