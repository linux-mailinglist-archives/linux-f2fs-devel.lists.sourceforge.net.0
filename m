Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7372E1A9908
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 11:34:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOeRO-0007o6-Qv; Wed, 15 Apr 2020 09:34:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=367a5aa7f=Johannes.Thumshirn@wdc.com>)
 id 1jOeRO-0007ns-0R
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 09:34:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i73cQScyOXtQNhKCgBM0j0yco6YrKjuowVHgFUDbKic=; b=HqLJ1nZGfVM18LYnQc2X58rdZB
 82J6w0AUKpBgxvvxt//ZCXLIQ/7wMSNSlyt9QFpPiWiid5nxfD87qrj8SPC8jtH6dJUqfIHjfdnqT
 DR8gLldHyr4ecL79rNhUgSebYEVt2dzWIH/Iqn+FzNI190YIUn4IW3AqgOgPKzJ5ceDM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=i73cQScyOXtQNhKCgBM0j0yco6YrKjuowVHgFUDbKic=; b=f
 RctJH7ezS9pLsxlsYg1b0mA7GycnhmMvzvwgwt3hVinlUhTDWwmzFc5B6bpS3AexszjUhD1uH5Ot/
 miBxykZZxhK6Qjcb7IqFvA4w5RrjQhPlFq6ThrDpNwiOS32XjxnTLZNEsKI36rI3tZarQyJzzfuou
 7hsSmXcNjwPCDlkc=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOeRL-00HVhX-G1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 09:34:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1586943279; x=1618479279;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=i73cQScyOXtQNhKCgBM0j0yco6YrKjuowVHgFUDbKic=;
 b=WslkhlbMHlTwCNiPrj5+Qn8A3G6GdBR8PJz+ovEfwQswvj7Iog5/Z55v
 IJkq+wHvrHur4XO5UdFgPs1v0LeKx9RiQfHJSIqqMIYJ9oNh6hVUeaZvl
 McFjyY/apVAle070y5zQ/8C1WfFfcJ5gCShFmumhT4RYdFlgW9rTT48yE
 pfpbVPxou4yqswxHCZ2tGsM21CY+wgdrlNx+sd4dD8VywUneKT56ehajT
 RI9cOmSRqNuNrEhKLbNec1j/143UU7ra4ibLeVhYbF4gDJu9BJHy6kTza
 RcKh2hlVBgZ2mJeLHxh01vaieAsGAGsSM5+D6B0t4VlwbciJz/m/+ENkb A==;
IronPort-SDR: 7kjzK1Ad2wI5b4+VcSOfMv6/ppyrbsci/xuhvxCYoArjjognUejG8HHW6YMl9AM5WbSDToOdLP
 X8dYv47DtU4cxM0zSGBTTCmlK8wP7DfCa/ONMGdAtkVZHrIAUlag/V94tDHZx5Uqw5rEVLtGTV
 YdIi0d+qBDUxVDxPM3/vVeBoffG4x+z2tpO+sACAhLugH1NqtrgauHv3RN5nxrFamA+IwR3B5P
 YE+2CSRf8cu8pNZHTR4rO7658OLaGp63lrzvi2P1PE8rrc2pCOuSOMxkZQ6mYnVUJEk/ZuzROQ
 VcE=
X-IronPort-AV: E=Sophos;i="5.72,386,1580745600"; d="scan'208";a="135686908"
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2020 17:19:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEIej4lv6sJdhnVg1ul+ORze3ERisffSO3OanZb0O1wI3AORSBjTn78SWW92xu0021vwnrNqO4ShrmSBBwQzZqmzxd9w6KUxXwWSbnKlNQuIdwc9rfKugA4rtoYJbON/HED1PI+xjnyJEdH3sW/EU/Rjdpf9xBikf3MMtZQFF9qWkERdvH+itN3y1yTZ8IoIcSviTChJmb22CO55516EkQG/FP+2YAcwjKxcwD8hoaAQDCkwtUOnFWQVe/xjm52A3M7W2pmGZ960FM0diL0RyF7ZVqjDCPDzObjmsNP038wr5YcACGr87Qb/Nrua5Ls4QrAtzMrG+kvbqI9JRC+Mew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i73cQScyOXtQNhKCgBM0j0yco6YrKjuowVHgFUDbKic=;
 b=L3QuweCo3yGAnIdr1zoMtxP65BooYVXgXMp+3RpIfpoTlOaafpdoyDDn1PLoMlD81Hm9STsQ3rh+sRzVT8Qvi0visziJ3jT5Hb3ExqSSQuO1OOJj89CPeNYJFlCa8l6YcRUp86dH556nwW1L2Xt/S+Q1/kWsew8G/HUDiBiWKb5xK5hvL0flaTkihiNvBiofS+OmYwFQfe5UMEICCYFdbubpInbNuLsyrSB83acjP7o32+DeK4shMcAlf1oikvJt8h+xW7FMxFfXJLpKLDLTHvNqLfqbhS+NIr+XJ4v0vO4toqRKSKT/5vSe0wqzjgWgbZU5P+2Iu/fQWsc7p2qi7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i73cQScyOXtQNhKCgBM0j0yco6YrKjuowVHgFUDbKic=;
 b=cediymMqXsejz8XaN4L77SrepB3oVklmN6NKWIr1QSKzdeH9pOzsLO9HNKz1QTXeYWJ5XjYSfC2k3/2hqoSxmUIxawuSk2zcBOVeUbDxM9JAV49zV7slMNGV5PNCPPC3PypoYaJo30oCC5UrP9hfwVHZdeSH6eLrb3XOK7Enhl0=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 (2603:10b6:803:47::21) by SN4PR0401MB3648.namprd04.prod.outlook.com
 (2603:10b6:803:46::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Wed, 15 Apr
 2020 09:19:01 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::9854:2bc6:1ad2:f655]) by SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::9854:2bc6:1ad2:f655%4]) with mapi id 15.20.2900.028; Wed, 15 Apr 2020
 09:19:01 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Matthew Wilcox <willy@infradead.org>, Andrew Morton
 <akpm@linux-foundation.org>
Thread-Topic: [PATCH v11 04/25] mm: Move readahead nr_pages check into
 read_pages
Thread-Index: AQHWEm4IkvFnOm+tn0ujKbHOMv4ngA==
Date: Wed, 15 Apr 2020 09:19:01 +0000
Message-ID: <SN4PR0401MB359877A9FA5F54D9B9478A409BDB0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200414150233.24495-1-willy@infradead.org>
 <20200414150233.24495-5-willy@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Johannes.Thumshirn@wdc.com; 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 34e1ef26-dcd0-432d-5d98-08d7e11e0926
x-ms-traffictypediagnostic: SN4PR0401MB3648:
x-microsoft-antispam-prvs: <SN4PR0401MB3648BFA0531D55F928A734619BDB0@SN4PR0401MB3648.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(110136005)(2906002)(6506007)(19618925003)(5660300002)(54906003)(558084003)(52536014)(81156014)(55016002)(8676002)(4270600006)(478600001)(33656002)(71200400001)(66946007)(8936002)(7696005)(186003)(316002)(66556008)(7416002)(76116006)(26005)(66476007)(91956017)(64756008)(66446008)(9686003)(4326008)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ts4kbZfVIx3jY3ipP2XDo22PJ/uDpAUEebR5XqTR/mqTdQxW52hs+0U7TYZvRVbRm8ZHawitYkINlnyCicp/zaMoChF35gNTbuhUiNocBU1MrXuf+a4EuKOhrzn3WhczzDeOj0Acl+U++zZr5qa2Yn1SETaUqhqrQOPNDTChvu6C9bxswB787iloZ3k48x4rjZkOI25b8vl6jrAuA7VG2nARo2dQhPCadhpHzDJaglBmGHT3TBhvqWe47qXvsvQBei6VtNzbPXIoD9t7CEjgLGshUTx7oLGsxK67gsAKdpxD2PqzK7L2bvfUJG04JXMUQu7Ht06ocRyFS2WXEJRZwepDKFRy4zVwYxUppYPLEFcGmYXk56xr9oAxKyr9iMaHKripTCrf55JgxIiEs1M8z4OGHnyZfb4C6NlERG1jlclZMfgY1lUPkqLTiuyiDRe5
x-ms-exchange-antispam-messagedata: G5b00ZkXeotDfHr5faVQP7pQ8wJ3BUN2v83+0ZSaeaqLYTG62rwp0tpukyet2r/12j/07OjwMd35u20OT33lASk1RWliQXm3Y5wCN2+4chVeVuKQjJoMrbfgUiVbiMwJGAN4lrZmXEfLSfXxRIdFAg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e1ef26-dcd0-432d-5d98-08d7e11e0926
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 09:19:01.3852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7awMuL++xctXgRnNnTlkMtxoRGQgn6ttJ1Pw3s7lCSFjbymJ67INYV6uYM9IJ/lwJ2++fSVytVZUtgBEza8yH7+QrjyHiKW1mXwoRzbBDfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0401MB3648
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
X-Headers-End: 1jOeRL-00HVhX-G1
Subject: Re: [f2fs-dev] [PATCH v11 04/25] mm: Move readahead nr_pages check
 into read_pages
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
 Zi Yan <ziy@nvidia.com>,
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
