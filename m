Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C64A158B2D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Feb 2020 09:19:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j1QlT-0000p4-4O; Tue, 11 Feb 2020 08:19:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=3037ffdec=Johannes.Thumshirn@wdc.com>)
 id 1j1QlP-0000or-GU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Feb 2020 08:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FDQF7YmUbf7aiT8pwm9gfOrtDMSYksmXliNItnHvbJM=; b=Jg56T6Sf+HjramwVXEkw5fvGii
 Fx9FxIK133FiRMntz2/SePjTb+uuUBn6D2khq4Eln0itv487alkpgNz3Fi+fM8TsY4Q9zbHAfi8U7
 bkUdoHgndV3x6X49HoJfJy9Hs5JOTyw2ZlhLpnzvh8nZMErR6z7aIdOLtXhl5hamI2wI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FDQF7YmUbf7aiT8pwm9gfOrtDMSYksmXliNItnHvbJM=; b=j
 AOYwsnWB99XRA0I02j0GeV6fMUH18EBX/FDYHtFLy0rMveSrcGzf898iD6CudXh/bB7yBil8UfNFX
 iDYiioonyEZjU/viUzmTaXB6qjOl4+6FznSoULyuWzuejmpl+i75na2+ZPIeIQySWf/V97Gmc6HjT
 KA4csvw0H/1QQun8=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j1QlN-000JKB-V3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Feb 2020 08:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1581409162; x=1612945162;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=FDQF7YmUbf7aiT8pwm9gfOrtDMSYksmXliNItnHvbJM=;
 b=NtkP/ZlIrBeE4E0rFUXcb4QXxRHqM215JsSlLuGy1A7HH0yUJgJ5Nkf1
 A/4KZB/JnGFMsEcsfd3+SudnVbmJFSz5hgSqkVH+J+v5Z/JCmaem/px2f
 Z7iAOcrhqPbkn5qagq+MfPQBBxRJbz1Xaa92aU9xrY2SCKc2SRYvALAUT
 YIVMiYgWH/J1SKAllc6q7CZL9gP2Xh2Cl8HCpP+sKzuVHUt8zX/ngpp/z
 0FO8c+frrFPzz8grmRgSuIC4F48mTEQOfNm2oBhxBwUjqc1eliKNT9KsD
 ZyjNX0KpV0ejmCeAsPa295BMCGKMg8zhH8S4HB6JhxwNK55IXFzI6dkbR g==;
IronPort-SDR: TTpGiZ+CrPrMqQD08kY+UMnaQ1VC8AGR3aneqoIUUY8TfLa6+gcKWb/1LnnK2sf5VVJpNfwodD
 eprhvkWp2D1y/As6LgwFt3RkNXQxROHtkx4jMzzq2dBDB1cytEO8cGS3akB+WaKNt8yrJkbpj1
 zT0ezXDptkOTRqEcQHdOzE/cfAUd5swPx02ua+4uNLHkxGkhvTzn5PlkNbyziR0tAnVQudOrXx
 PQTfZviWsfowVKubfDgGAxm3k1l4SLnUaZ45XNsnA1nGNnC+rLBrqC2Xyf9me48/6WhV6Eh+5+
 wJY=
X-IronPort-AV: E=Sophos;i="5.70,428,1574092800"; d="scan'208";a="130107720"
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hgst.iphmx.com with ESMTP; 11 Feb 2020 16:19:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbOZ8PGX+pHGj8jZlYa7H686mXG5I5hjC92WnaqgN4AaL1gNhTtl9g7728BhIL67Pa0SEs1xZAyZAGhEQTofn5LAFhTdska0A0PzVs6pGyB1XgR/LCfyB6uGVWIuSGnL5qUFNBrtePvKSatxT9R3CdxPvlAvj40OFIEQYeF2Oo7BTj9ik96CBmVvuYLJiPOTyO7zaQhEHWp+ChZN9m6YA2j1WApo9+wqzAPG5cLPt7R4oSOCxigfzlOyrKE2dPYb4Syn/UBTKOOE7pTe2ZtcFP+rV5U8LLsnlfd7uswgujETcxbAq1xcN6PJboAI7yit67u/PIGryqHT4d6nivZY8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDQF7YmUbf7aiT8pwm9gfOrtDMSYksmXliNItnHvbJM=;
 b=alcXa2EsGIL1Z1u/bimwyTA7Z1Gty5+WjaSIQpFBB4K9SRRxxKCP2vYM00yM+hHWb+rQEhkqX9Mm69yJdDGCIDH8Qq15nK31VXN73KaKL9u9gqbR7kEkBOmM852kPwJ/9T28xpwxHsiHXZahx5Ur+S5/SOIlrCtM2cmkVGYHl1ADIsMVFJahFmAJo51uFIAHT0QfeMSuaYrgJXFEgGc30FC9URtbi7lk6yddTRk2o/a3VGsopKE/9U/BC/O2/zjJL2VbgJp4JOo8wNq3qM0VBAAiLyziETvtJ6T54/vgOTszX0Qw9P5trPAli3mSLfXHlw7Y+6Iuo309lC5cCyFJ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDQF7YmUbf7aiT8pwm9gfOrtDMSYksmXliNItnHvbJM=;
 b=IE59z5+qfoiES6btuEYw/qK3SrBZJVRQBphYhK1Uw3zNftDlj6VNzH1BRJ/yIyu/BKfKxpJWUYdnjofN5YZFl0xUfRoZXWvJQ/sZzWWAakENjX/lLozVrqWiPsn83F7FeohsxPsQw6bb89DWHJS5tPdZl9XZr98kEnwJbxW5UG0=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com (10.167.139.149) by
 SN4PR0401MB3600.namprd04.prod.outlook.com (10.167.133.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.23; Tue, 11 Feb 2020 08:19:14 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::e5f5:84d2:cabc:da32]) by SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::e5f5:84d2:cabc:da32%5]) with mapi id 15.20.2707.030; Tue, 11 Feb 2020
 08:19:14 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Matthew Wilcox <willy@infradead.org>, "linux-fsdevel@vger.kernel.org"
 <linux-fsdevel@vger.kernel.org>
Thread-Topic: [PATCH v5 01/13] mm: Fix the return type of
 __do_page_cache_readahead
Thread-Index: AQHV4HdLtCSr29ig40CbWBOKZ39/Iw==
Date: Tue, 11 Feb 2020 08:19:14 +0000
Message-ID: <SN4PR0401MB3598602411B75B46F5267B829B180@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200211010348.6872-1-willy@infradead.org>
 <20200211010348.6872-2-willy@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Johannes.Thumshirn@wdc.com; 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 783a7c5e-dfd1-4f05-3ff8-08d7aecb14cd
x-ms-traffictypediagnostic: SN4PR0401MB3600:
x-microsoft-antispam-prvs: <SN4PR0401MB3600BE4DF5FBBC2A07AC38609B180@SN4PR0401MB3600.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0310C78181
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(199004)(189003)(8936002)(9686003)(86362001)(110136005)(55016002)(52536014)(5660300002)(7416002)(66446008)(54906003)(8676002)(64756008)(66556008)(558084003)(81156014)(81166006)(316002)(76116006)(91956017)(66946007)(66476007)(26005)(33656002)(53546011)(6506007)(7696005)(71200400001)(478600001)(186003)(2906002)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN4PR0401MB3600;
 H:SN4PR0401MB3598.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J13A6ReA9TSTt1c6bdBpTxtzneb1Ofpyc3HHteWqvtuXD5BIp25wWX5Jj9rty+z8IuBPjt/gIuHTYUfEoYTkHZrnnDILfKSy45g6ryMvZTy61yO2Q+D6ULUDMigsCCjurNntAWZl0Xm/OPaC21h9Uhg9UsfGDU8yRR7pJp/4RtZPLu8Aa+pkHWfnddkRl+me9f0vLAAtyn91TZCvcIqa+pIWQqEAD41sQwhxTwrZ9YYK66o/AOKckkO5BFfhPOEMko2jHkIElHDKQ2xLih2gDaEWxDyXVbnwiNcDQ14fDOc61glpj0fPDXD9wLRF+uURWIoMWc/4/v/xEcylXlRAUCkkC3JGDfLGO5P1vDoTTsL8HhGcdLdCMRrLdg1L3yxaPXNcB6PpBTBIbmB1SpRGyXF5mmIccM3isWoZ/4rvj3nw9fQi+IKdlplFkQzhShVs
x-ms-exchange-antispam-messagedata: gfEyOKrwkPk8qghET5Arq6HHfBJaC0LBjYfYag1yvJsZYT4ZAH1sGnViMxzNGt5I12U+7zjXvc7zduxy+tXWxZcvuxjY2ApX92T48YFRi0PQXQLlLzOjG4KsqnzrprU7tnMP+4Gc0+BVeUyg7Qnipg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 783a7c5e-dfd1-4f05-3ff8-08d7aecb14cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2020 08:19:14.6094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +UkunN43yImZCGMmfIBExV/09gy+m2seRDcVr8m/zRykHkafS94C2sa/Bp5+xgnFqs3xnQdRlYKfhKG8VEjtTHo39tQdr+ZsU+hlmizKQRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0401MB3600
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1j1QlN-000JKB-V3
Subject: Re: [f2fs-dev] [PATCH v5 01/13] mm: Fix the return type of
 __do_page_cache_readahead
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/02/2020 02:05, Matthew Wilcox wrote:
> even though I'm pretty sure we're not going to readahead more than 2^32
> pages ever.

And 640K is more memory than anyone will ever need on a computer *scnr*



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
