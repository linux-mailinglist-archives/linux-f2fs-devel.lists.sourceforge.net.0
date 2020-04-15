Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5768B1A9986
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 11:51:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOehz-00045m-VR; Wed, 15 Apr 2020 09:51:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=367a5aa7f=Johannes.Thumshirn@wdc.com>)
 id 1jOehw-00045b-Bo
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 09:51:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i73cQScyOXtQNhKCgBM0j0yco6YrKjuowVHgFUDbKic=; b=U0LtXpldN7OifFxBKp+7DyGMh5
 io9/ATD+3BGIoOggls8ku0GV4KzE7whwMGfUPlOCJcSM0sJ9cIW1apLIt2LCkGi4uwEKocRAxxutY
 mtb3oAxg3YNib0ng5X6YI/tU9WvTZGBOtQ7G/rrFxjItNuH/6e4jfPj/JLAY2zE1p8L8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=i73cQScyOXtQNhKCgBM0j0yco6YrKjuowVHgFUDbKic=; b=k
 8tJIQYAM+FCutRYbzRiYpKrzGbPcyW0tX5PUxp5yNbM00m/Xfg2ylVSFNH7FzzX1siR95Wqn/6XPO
 QzhkIWPnWMTdimSAY5pCl2m5BxgsQSEFmC4MidCW+nBc8M/k3ckVvR95MY3+zkq7hHZtTFGCH/yHK
 7bCSobk82ulWNByw=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOehs-00GC9L-9s
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 09:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1586944313; x=1618480313;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=i73cQScyOXtQNhKCgBM0j0yco6YrKjuowVHgFUDbKic=;
 b=atKZR38eBp3v39jmt7vsryivKN3oCYemfnmnoOW0TkvkqfTTvL8W4Ess
 XhYxPv6TCtDaiCqxitkbocJ0Be7OqmQ8wOZ0reSRkI0tHAvBjmXFsjI4U
 b122WGHT0+yPp/ERuCY4HSCK/An6cLMydpBAn+lbCe+WOHzc0lvYWJaiG
 ZXoGbANasrg+WR98xx8UWjrsXpXFO+JUp7y/FJv1RAJhmYmr5vSBYsDcn
 WvuW/De0XZN88v2GFLaXaSeWa+CRo84Qu5p4LNmEQp7GpEAXPmDlCKRbs
 ei1aAH6ydoC2sC9pfBhw55uU5qFfopdiM+H9czDD9bx2IzHW2ecUso95o g==;
IronPort-SDR: eeRVIlNT7jgc5Ig8ZYnISAlMPD4ZQ9FY6eT5A/Kzo4C9xFYVNPO8mZYw1nU47bM/qi+jwjMgqs
 Jkm1w5xc0QIFmrCNltcXPYA1jgBzuZYSlkKBRReE8ZdNZ0iV7Wk8chgJsOyb+xsT27de56gsa+
 IxTUXDmASKQqo2yApvWnC9SUrNct71/VF3SHLxocRdXHNX3Hklq9nbrE//cCq9i6yRm43xOAQG
 +46gYBKDjsjJbq3IBnWH4hKnqld35SXuN+1u3lOGCEjDN44tbz4VHCpqYlpXgSXmvDpjq+vlCG
 5j4=
X-IronPort-AV: E=Sophos;i="5.72,386,1580745600"; d="scan'208";a="237794024"
Received: from mail-sn1nam02lp2050.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.50])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2020 17:30:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYzXWSdNM8Lt6zEhh6x8il7DwIbzfOs/ApjPtGwx+tSr7wGKYtlBPoXHdzXMG7d0/aFqPb2Uz20U1P2ixPrnwbSbVgZxB3HpOt81gNvmOIJEqBfpElLvLVoHx7HREHuxEtQ31Ms14+X3mVRcaA1UZ/iIz/jclfo8s2DzByGruMfix42ey7skmC4m51oYbLU+vGV1KRxLjpfr9C9daOwgj5KQTAHhLU16rNc6AhXMQlgMAAunPsYM4mbN3oXQ0PG6pWcN2r+Vzp9G4YJ9BEcwQH70wwRvgWj/xx2KQCUFiv5jMNUqC32Q+VJzuSjPxH3f+BIXpO138bBaxFRsC/hUbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i73cQScyOXtQNhKCgBM0j0yco6YrKjuowVHgFUDbKic=;
 b=G7naXZ3zL10OBDewhQWaBOKRtj8ZeZyC2iD2W64nrHRPQQO5xYGeH6q2W1ABaZVrjWt+wUD6a9teFXc6UKFqcWvyNHAJIf4gcuYen9yDten24ZMB1SCKZwlDNwGO/JJjt9r1d5Ff8HFk/KfP86iZrld06ki4pFB+adrlG/G1WoEQfeV+t6A2+Hz2Gg5TVQUEg0+CS31cpCV/Qdi1pUONiDto5Y39N7aC269R6NyrMXQq+X2awd5YWqHZN5doLMI2b3qOztYqskjdKImZPp7tyNjRCQ2+wkO/GFwIGDBlOmJYre55qLHC529WehfK2N3OtZvditWvv1g1AMCAAp8b1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i73cQScyOXtQNhKCgBM0j0yco6YrKjuowVHgFUDbKic=;
 b=GDUPzBkG6XEq3T7jskycK6rXY/CFtZb4ekXvp9QhqVyenQRG0uSPnw9vT7w//uDi3pha9a2ll32mHD8S6+Fgnsl9JLBu+UDtsczdvujff0fLIng1vmCzTUkbHuBjB9JNFGTV/xVS7RLcSdQG1KcvyJ8SPc+xQ0FXHtpECRVXJpg=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 (2603:10b6:803:47::21) by SN4PR0401MB3632.namprd04.prod.outlook.com
 (2603:10b6:803:46::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Wed, 15 Apr
 2020 09:30:21 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::9854:2bc6:1ad2:f655]) by SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::9854:2bc6:1ad2:f655%4]) with mapi id 15.20.2900.028; Wed, 15 Apr 2020
 09:30:21 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Matthew Wilcox <willy@infradead.org>, Andrew Morton
 <akpm@linux-foundation.org>
Thread-Topic: [PATCH v11 06/25] mm: Use readahead_control to pass arguments
Thread-Index: AQHWEm3c6YkRzif5rUSh6nBZ9gJdcA==
Date: Wed, 15 Apr 2020 09:30:21 +0000
Message-ID: <SN4PR0401MB359806A3638DBDD9A20DDFA49BDB0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200414150233.24495-1-willy@infradead.org>
 <20200414150233.24495-7-willy@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Johannes.Thumshirn@wdc.com; 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 42318151-4e49-45ff-ce57-08d7e11f9e5d
x-ms-traffictypediagnostic: SN4PR0401MB3632:
x-microsoft-antispam-prvs: <SN4PR0401MB363240B9E9E1F4E5A00E26469BDB0@SN4PR0401MB3632.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(33656002)(19618925003)(9686003)(81156014)(55016002)(8676002)(8936002)(478600001)(4270600006)(71200400001)(52536014)(2906002)(558084003)(86362001)(4326008)(66476007)(7696005)(66446008)(26005)(64756008)(76116006)(316002)(66556008)(54906003)(7416002)(66946007)(5660300002)(110136005)(6506007)(91956017)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3E10msHK2KLvXhznHQ9YJSWeEyPFo8ruTznCKt9trFhmCR2ubEYYVZQ5b/qZ60py5RQMtoBOOTichvWC82eTA779GWZfMYR+n0jwC9j2a1xIBnbe09XNSwRwrMwDvIevghhMnptKQqtFqaSmu/jq0r3dODtE8PoxNftmxV+jYAdqDRMjjjwZD4jPnKAcUZW78ropg/d0uN3EWCOImEWOI9nDXWGT+cMBQGduft9DTkhoIsFGr3OSrQbdP2Sox4bWEi6wL770iXty0EB4N1Cl9XWJvJ4wffLmvT4l0Sdec7k1g3JcoF18QD7hlAR6OZOxQfuIC0aY2D1/5DFciZV3gWw9lfzVsMXD1TlNLfkcoOY6D7X/ZCzJsjwfXXhxtPqMN6+gV2hUmY1c57tvqS1cdVq0hDa6pgqY1eIXnoLUz+KcDUJQfezMtja38Q4FVPCE
x-ms-exchange-antispam-messagedata: mZpW+p+O8zplPaT/JT9mfTC0+kdX2Wm8ycHn3eyabru/ZJeiJGpXDT3S4AcOKIMjTHIna/2LeOItwYoZX63oqxV5WyxCc6oguXWZpQ4vFer6Rl9IkMhWp3vcp/+/RWaZOM9Ce+pvoAKqUGq6yA2o3g==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42318151-4e49-45ff-ce57-08d7e11f9e5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 09:30:21.2508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0pP1zzxdZl0sYzuj3YYPXddr7XLPy9tBvfWuDosAZ5ZaDo5bilbGlM3XKFZhSyUvGW08IS3GnI9W4G7ina2KBTvZbjegH1JZwCwK60YvWoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0401MB3632
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jOehs-00GC9L-9s
Subject: Re: [f2fs-dev] [PATCH v11 06/25] mm: Use readahead_control to pass
 arguments
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

Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
