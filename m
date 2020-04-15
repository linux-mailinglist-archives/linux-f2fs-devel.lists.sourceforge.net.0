Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2A51A98F4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 11:32:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOeOk-0005eJ-MX; Wed, 15 Apr 2020 09:31:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=367a5aa7f=Johannes.Thumshirn@wdc.com>)
 id 1jOeOj-0005e5-Tn
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 09:31:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=; b=l+VtxRwYoWo/a2jTLTydAx6tqc
 RETWyq6yBqHOdPDQeTjOoDMfx94E2Ox7P24GnNG6RldbVSgGCMXem7lN4v2tN6gKERVWmJ924jAKK
 VJkFJTrBXu18OmSrhl4q4lrapUi9qZqIE7fYMs5YhXmmZDYJoBL4Mdoly8DQOhkp798k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=; b=R
 zjVJA6seLuvFnqbaALr2oc3A0yvtOMtr99D/PVuI4sypn76gfWDKAYCRdFFuMW9RsDxWOXP4JdP3w
 B7rxT8Q0J3uJQxILOD15poS1bpjRlN706XZ5Kd5PyynQIRLe8jG/gER9h0GA/tuBrojHDKY3V550/
 a4kTRIg7D9MlRJfU=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOeOf-00G98N-23
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 09:31:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1586943113; x=1618479113;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=Q29aLn5NQljErqBXyBz/o2zDOUQcYds9akkV0guidOqJIN6q745qbs0T
 26vW+MaZppuVygeQFeaBhQshuu4Zc2pwnNSvePJ2BkRfl3hEn7dk8cY+B
 v1r5OOHADg5BiVRz5d9iErIaT4pSwWuBc3KGDMZ9kuCZeGW6Gtzjelqfo
 ZBUATre+E7glDCdIiDk10DZ7NxMboOesczXoDFst1Jd7EkF1KnIeS3nc3
 SNkYkwlExmsXmIf6GroXvy8dRHg8fE6gZFltoUNITIg5do1brN0qndTOP
 PKiBOTusVypCo8Ews35fU9IHQvgvfu9HocVSpuhplrSdnIhnbnNs3EPY7 A==;
IronPort-SDR: BaKMqZV9U5WwLXYLi2bhk+5+q/kczDr3LpXzfn7QKUGKGZwJ+Z2lMl45zbsrCxFFB3YsGvgPF3
 0awmKBcRWsjYUiL9wkbjpdvSzlq95ReIZHksdr5mrFXp32cC+j/qqO/EKjTmKFBgwF3Cdx0JKO
 MJuMoZJlhXgZkfneMA7ImtTlxOFv3FON6ftwuV10BFuUI6acyzvINNEnWa5gELI6J6K3CvrsGM
 /Gh/gHo5tj4TYTIcu1STx9WVbWLRv10K9qwyY+uvY/AMHBY6Kb7S1I/Csg9XPzji/fFqjEE2V6
 f2s=
X-IronPort-AV: E=Sophos;i="5.72,386,1580745600"; d="scan'208";a="135687648"
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2020 17:31:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gcN/9qDPigqmT4t80y1LS4Lo8J+cCbPodoI5uigttACKwDa8iZAhwINaWJz+bn2LSAtBkqzrrUwyoWeL9Z9XNIZq2RiEZvYvPU8d+3GvuvrtofggPMBHE7UGTMa0bFIlb5o0DjcPKQDc6OPrHEMGcyEKien4D0J0doJqiIqoYacWHAGqd3iME0IMgQ+8e1jObpewLd3JhFqvsIDKAOQjBKS1WrFUqRxgQ+qcoKy6q+y8+x+ZAwj830xT0k67dhplwThYCaTpT+RQxFFY3HmmaYVk5dpfOUQ2TcfSFZyxOItgp/H2gF/Y28DN8/UhlPj9+nlcYWSHxNbSxVBKPwAkMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=G+7mI2LzIZxFQ6brPHCumndJaOOp2YmouiNRVwflpSUYbO+uHlC2NC3HklqGYehs5JS/X6HoLM6ZobAEceKJmv2/I3oTofpV3WtbNfnhM0rsjZQOUGdQbJ4cVkLpymMes1yWagWZ1nP62/GG0+wBfH9+kfBO7EcVd4suGLrDmnWc7mPtC9II3fK+5V75kmjwTucd1XMwEGjThypizD5tLPYFZbyG4k17oY/JmH4FhLCEPTaX21Q3eZGu/z96b4dR5PY7T9+VaUn8r+UNJElYzCESnyfoQxp4tGIt/3faV/8rJt2A05hfCdCt4Y9iTCLJhEK+PSjmaHU84AIoNSU0sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=hwb/YdCWaxODp0n2WC5QXONs2fAy31FfPnYVYyx9zVCG/yIeSxu29NwqQm2cIsluf+z8y+jP5UzJrOQrS6apw8HyhBPl7qvv6drPZ9c+R2/2JFQFHdchJPzcI0VrbRo4B02d7ZyI9EYoQyNwPRwtpWWk4IPnYSY7uh5Jmc9Zvsg=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 (2603:10b6:803:47::21) by SN4PR0401MB3632.namprd04.prod.outlook.com
 (2603:10b6:803:46::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Wed, 15 Apr
 2020 09:31:41 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::9854:2bc6:1ad2:f655]) by SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::9854:2bc6:1ad2:f655%4]) with mapi id 15.20.2900.028; Wed, 15 Apr 2020
 09:31:41 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Matthew Wilcox <willy@infradead.org>, Andrew Morton
 <akpm@linux-foundation.org>
Thread-Topic: [PATCH v11 08/25] mm: rename readahead loop variable to 'i'
Thread-Index: AQHWEnBXN8jjeMVDnk++wod6vaQDSA==
Date: Wed, 15 Apr 2020 09:31:40 +0000
Message-ID: <SN4PR0401MB3598372581D036EF768DFA4D9BDB0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200414150233.24495-1-willy@infradead.org>
 <20200414150233.24495-9-willy@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Johannes.Thumshirn@wdc.com; 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4a7f4252-07f1-4865-3c86-08d7e11fcde8
x-ms-traffictypediagnostic: SN4PR0401MB3632:
x-microsoft-antispam-prvs: <SN4PR0401MB3632C5115C84F1A1787AA3629BDB0@SN4PR0401MB3632.namprd04.prod.outlook.com>
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
x-microsoft-antispam-message-info: 9unlhB9zbhKeOGqZX91AELl9VJzJqA95l7GkPq8ATcgXaeXp/8Jcs8m7QAcefGYVwrF1AwISC+Gsv8segtTkCc7ksUjVLYfKxoeO4G27VZIJqWeMOgym4ewfOwgCGykZe998NeRInbIbJ5lELWmcsg7wXy6w8dZP11mjR7z1g7v6Fs/0bmfuCaayUW5zKduGWBTmTb23iL+PP0WVBCGN1A6vIwIEh10m+KVGCsoYWCuylH92XVIZqhIi2j+D/vrNGBoSxO7HCwmvm4Ywc8znf7ZPSL9k9YEEx3LzZpGOMUQr08LKQw6pED4ekRs3EDiqL8oAlQtf0q9n6fOK3dPQ41+cyDKZ4sJjAz9w+EDY7wTjLUuPzb4qOXn5/grqirRGLLwxt04moOAi4dRSeD69vOKQfwn8wz6CbXRGMqjZFmdXxZUz6t+G/gJP5gl3gKUK
x-ms-exchange-antispam-messagedata: uhQbOw6ZKaMUhGwm83KjCA/tI43ywZ17Yb7d+ofiLSyFC4Av+1/BjYHUgs9Si4olcDzwJY6apykh1yIp/Nq3zqtS/C+BY8HXfmEifgjowQwaMRdaQB5YJQV8Bq9mgo88QjrcsNLj9LjbCT++LncnyQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7f4252-07f1-4865-3c86-08d7e11fcde8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 09:31:40.9600 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qQpPVAPFWC51jmm2IphX52KtHY+a4IBt1a1VTBDjiMNS9WcYTo+ZllYTiF18EqbofEF+GUeemwhKFbVB54AohdffwC4b1kYlT6jjz318XJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0401MB3632
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
X-Headers-End: 1jOeOf-00G98N-23
Subject: Re: [f2fs-dev] [PATCH v11 08/25] mm: rename readahead loop variable
 to 'i'
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
 Dave Chinner <dchinner@redhat.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
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
