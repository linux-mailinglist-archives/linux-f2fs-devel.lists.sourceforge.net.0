Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8940F37B113
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 May 2021 23:52:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/Igx8rBY+mNAZAxSQk5Z1+7vQGOsUpiDsRkc1jpbdt0=; b=W+MoH8rqfm/O4NeDdYsc6yjzz
	brBFaaocXPW8g00+j5RlE900kDfyH14mL2u3YUpl4CFB9skDYp73F6kyeWcFulLx1rSclfzLFRCej
	nefJxVNS05bQaLdBLgwiH6rlbC0uGp2xUM65HhUF/ml9LCg3mjXalmsS9tFCi1M7wtlOY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgaIo-00047U-Bd; Tue, 11 May 2021 21:52:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=47652bfc39=terrelln@fb.com>)
 id 1lgaIm-00047G-Cj; Tue, 11 May 2021 21:52:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r1afHE+rSybVI4a1iMl3QwY1998ehS9SU84r4YQaVfM=; b=MZJCEys31esHGej+0z+yQim0Lu
 dPYQTi3VyYTQd+E01ZJ8IBqaeVmOTWvDw3lgkFSiyO2D/wKik9j6yLOREpiCO2Sizo6cS8Zm0E4IA
 1KsoCWNODzSE/Hp0ua/suXpTvkYsPBhk0kewcM3lq3VQs80r/i4yqwOtk5Eh5pXadVhA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r1afHE+rSybVI4a1iMl3QwY1998ehS9SU84r4YQaVfM=; b=Y9hvI+ohBjseU14NNzJ7nYSFHb
 SLMB8EC0EgLuirrupZ3JTLI7kUQrIUSOYXe4UMLod8hv7zux5lwduCl/4OKVgjDbepnLbuIhBSEMq
 RA8U3lW7FBYGM50l0mpdPjG/VUBuZ2S+K7N6oc3iqxytmYaR4qAeTtuB/XslKTSsQ3XE=;
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]
 helo=mx0a-00082601.pphosted.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lgaIh-004K1u-QA; Tue, 11 May 2021 21:52:30 +0000
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.43/8.16.0.43) with SMTP id 14BKr5dZ025780;
 Tue, 11 May 2021 13:53:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=r1afHE+rSybVI4a1iMl3QwY1998ehS9SU84r4YQaVfM=;
 b=TjLxprXXVE6vHFAGnwizBVZdz3+hZ0Uwzjh7KxcPpo9CSo2a4N9S3weKp8TyYjJrdMj2
 quZBdrL/RC2lafK970KyAHCe0PZLVnldtsXzC1xq8oIDmcn+E6LA2Tv6VOSFwlMpRQvG
 MCUEryAsHNDXrYoxbuaMoxO4+BKSiMTK7GM= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0001303.ppops.net with ESMTP id 38faehf869-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 11 May 2021 13:53:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 11 May 2021 13:53:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZ9pVrMLW9GiSJwV3Rboz1jgG1ZbVc5PTPyEdvFY18IWxz1aG8Gm+VOYdBmlQGJ3tiPr3wqF84uKSbJjnRKvS2F0o22tcBn+VYSddigAXvfc0uriIZYeg9Qg3wlsg0h+6NLXp/TVsPZpe8Czt0uoWJO9D5lV0MiW3a9jfMyhMaA+LLH8EC2AMonMr1XYgDfIfSAzNzeIulnLLTxzGeYTHlaJf/sjuGY3x6/aZzBiE7KJPslhphQ9r6hp8IHIGnL+31LnOOaGFWLNrhOx3jx6OlVXFfcGUNUmZ7ayV+N3+qhtHouQ5saBFbk+gl93grNgC/ku0ARokcSL3nOu/RXspw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AZwjq7HqdUKGxQ2D37LAOGStv4nPPkqeewWIeqpz08=;
 b=UjEuhNjNDcmlv8ghwGwUK95JAW6Abbn3362dYJOoA8ZQs4TiNG7z7m4JXXRWozzDo3A3CkTwSIoH5q6zTTXKbGmiEJYv0so8msCdP++E0PSNIF09mv2IX2Dp8ZDbcntXLAg1Tx4qM6l5DVK8YQIcYDDoXoeIRxm8JZWbhEsIIfM+qRQeAgMG5c6WP9rS8lO6o3Ukc63dTGg6UBaac/mnoifDCVEenIRXANEP7N7sPVOlQLFzTPXXzXepbfngqZdVj7oVZ7TIRwztcm8hzc/958i/VwNQDfoHc3evQ/y/h7/NCDQGm1oqeZLXJBS/LL6aQJu7bqHK81YRhXgVmbrf2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by SJ0PR15MB4389.namprd15.prod.outlook.com (2603:10b6:a03:35a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Tue, 11 May
 2021 20:53:41 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::8a:2386:5e51:e2e7]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::8a:2386:5e51:e2e7%6]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 20:53:41 +0000
To: Nick Terrell <nickrterrell@gmail.com>
Thread-Topic: [GIT PULL][PATCH v11 0/4] Update to zstd-1.4.10
Thread-Index: AQHXPV/R5TjBhDsVMEe8RPHHOgPOtKre1LEA
Date: Tue, 11 May 2021 20:53:41 +0000
Message-ID: <B093B859-53CC-4818-8CC3-A317F4872AD6@fb.com>
References: <20210430013157.747152-1-nickrterrell@gmail.com>
In-Reply-To: <20210430013157.747152-1-nickrterrell@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:bb0f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 399cd467-5f1c-4984-5984-08d914bedbf1
x-ms-traffictypediagnostic: SJ0PR15MB4389:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR15MB4389E198D0D52C5969CE5D3AAB539@SJ0PR15MB4389.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J+4lll+re4feabIg71pajVjbq1Jbka1cSTS0b6mUQN98ebfRFLbzSG3SleMWoxwA/lV7HyLUFdn9AgNPv4BhL72Ao5p3R6092DDF3+B/Sl4QZO2dzGbn7OLsYh65wiKcSyqi3er5jbliV/rOHGddRfTcCC7tAmZnpR3BLtp20y/7iVrdHeiEy0FL5MS1ErhvLbu5pYK28ilwxE8pBTQi9FLXoCptJJlk1eFqj6H9pHsxQ0P/p3He1l2njNNyCVHeo/E4k5FE1+Bs/eSydZXKPIyofREn7QlwMyFhzHBbw/QdPRWcYUDN1MJpDfeMKiYKomp+D4yF3us/Qgu01aLaNckm72AddBdVTAGtPR2i8lCNY1CX2Jh5kvCqPh7eNEIDBu+1dN9ZWtWtn/NvLGJmcYcEeDdND7SQY1xDcTAIxjvoWBjP+aDfFI5bVqYjw+CXU7nS8byHa9oqoat4OE5Etm/OYyw0oitxDIYsRPRuZmJrM7GG2mFCBPpp1WwiCz1LoWC95m/ZRQW9PcLdZxpOb5u0sjMzRdzJtfpmC0jPBaqOefhEpDrpv6Pv/vv7WwnN4gu81u+751xXUCcIjwqicjKRzdmBgVasu4uquLZjAFlwneEkX3TKVjIOThdUn25Dpw4xFtUQCGbhRfnBJ/jP/zVnJYfG4G3yG+usrFA+IDjn7zWQW91Ue8k6RL0G2RA9kXULDA2JiVFBAtOiP3pHRe6di/x0enk5V+lInQu94IXb7YBNA6EqJDEJcmJJk6WfdWtO5fillYckXb4qJ/PwDQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3667.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(478600001)(6486002)(5660300002)(6916009)(53546011)(66946007)(6512007)(8676002)(8936002)(33656002)(91956017)(76116006)(2906002)(54906003)(66446008)(966005)(86362001)(4326008)(30864003)(66476007)(36756003)(2616005)(71200400001)(7416002)(83380400001)(64756008)(66556008)(316002)(38100700002)(15650500001)(6506007)(186003)(122000001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-2?Q?p0XPGWPEydc/RC+60OzSiZ9BUoFePkw2qjWdnQGuYIhgcdapsklRN43eWA?=
 =?iso-8859-2?Q?2knXVC+YcRz6/Y9LqjBGsKB4Gg9GpffkmtSQlvTC20vvakBWutE1YxIq00?=
 =?iso-8859-2?Q?CfH2asAmMtthXKG0SU/u7QGZpMvAfkHBpir8KCHIFei+RFMyavQaIHShbu?=
 =?iso-8859-2?Q?YEQC9xO8U34PeMLLKiAy3TFI0WYZXD4adQ7yKy5k3hFU3Yv8OGDZl2iVeZ?=
 =?iso-8859-2?Q?zq0/j2da5PMk5aUIZHIOx+gQ0NXuAJBtD5OtKnj835BO20RAnGi8V5MY4X?=
 =?iso-8859-2?Q?hGkxwTSGj6yvoaJlYZJT8L+AsY4GHI5eeHnWqEYFtJtTvu18NKmfBmvwP0?=
 =?iso-8859-2?Q?+MFBtv72wq+aThnCzAUh/aJHYuPO7bRn6Hsy0GE3enzdFg1lKy2oyGsdZu?=
 =?iso-8859-2?Q?FVEQhwUs9XiA1ZwzhqxNoX/hnR1dIeVDgmfiyJ7NDwrLfxF7nA6bJABTin?=
 =?iso-8859-2?Q?sJPvgx0uV5zmG5TrvnkbGL/YpGwEw2T3ylPPFboyn/QfMn424GIm9r+dCf?=
 =?iso-8859-2?Q?qdkV1UEugKEKEqg4M/HKty5ATl0CTYY3xAKHG5tjzt3Bwjgyduxr3VEmWM?=
 =?iso-8859-2?Q?OkM2NNx6dykhl9heu+ZBL9Ud/iQ56nn13qBnPvm6MXNFrrhdstqjV4tAZE?=
 =?iso-8859-2?Q?eEORaLOpJ/uAoZT2mWIP3qF/AfbYJhlukI7G1jxdwEk5wi6cipGzYwfu5u?=
 =?iso-8859-2?Q?6160NWT4XC3c7gKVqlIU6jEAMnu9vF6oWPzA+3AbU8jhW/MoZnfvWyxxpR?=
 =?iso-8859-2?Q?qDDwNSc2lhkfW1z+f6wzrZ1ucbakzxZabPXA7cZwRijBh+oYQ+ThLFVmzt?=
 =?iso-8859-2?Q?LziTAbaPd9l91glf0Ow0eVQsgoCg8pHqL9t10rPV21w6/IkwW8ZTejN2Rm?=
 =?iso-8859-2?Q?4Nr6VAshi6s61XvECUS9w49M0oGHmxIAHfIp7AFAQXQA3RVtiC30ifLb/f?=
 =?iso-8859-2?Q?iiUzJtaLUSNMWDqZ7ii0mmpNGgzdfmLfyZgk6D0gb+7xRqxahRsrlegeNu?=
 =?iso-8859-2?Q?iY6i5KQcAUW4fYppSr/B0ZuuaQ9qaCw8x5oEpjDi7NRjRsgYYudknZqWMI?=
 =?iso-8859-2?Q?NeoNcU0Em4JgviO+2FTr5Fq4gLWWgT7viWDIZqXbqOdaaXPcxrGsqts5x6?=
 =?iso-8859-2?Q?W7JubqXsy4l19Wc2olYTIXEweezqqCDRrp+qtXBFJPOjodDqvJNnIo8i/l?=
 =?iso-8859-2?Q?5bj2FeLuCh8yVTnC8fuGnZLTm9UJtvpeTmom6pvb5UUJDSb83P4wGyqPgu?=
 =?iso-8859-2?Q?wAEvO3qYyvva2zSx8LGXFB93uJfAqA8GbmTSjT+9HlRXRcsWMpfpU+dn11?=
 =?iso-8859-2?Q?kKcxZYzs/t/NGfnSEaG74JET0dSoyalRpcyjSjzY/PgZWYddAGGm4msVf4?=
 =?iso-8859-2?Q?XAe6FSzozs5Ir7C6FDzLFCD2++SjbmPk/VQ3bglTZCKPVVdcS1E+I=3D?=
Content-ID: <467C5C876DAA6446940CC5C2C6CF37AB@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 399cd467-5f1c-4984-5984-08d914bedbf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2021 20:53:41.4485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tclX2mnxDvBJ8Bog2cM/WU4Apxi0ORJEAJbSVJ6Exw7ZJxhyiF3moknbAAzf3SS9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4389
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: 90T5oovx7cGYiBdHWJnLZgDy48BLI9Pn
X-Proofpoint-ORIG-GUID: 90T5oovx7cGYiBdHWJnLZgDy48BLI9Pn
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-11_04:2021-05-11,
 2021-05-11 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105110142
X-FB-Internal: deliver
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [67.231.153.30 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lgaIh-004K1u-QA
Subject: Re: [f2fs-dev] [GIT PULL][PATCH v11 0/4] Update to zstd-1.4.10
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
From: Nick Terrell via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Nick Terrell <terrelln@fb.com>
Cc: "squashfs-devel@lists.sourceforge.net"
 <squashfs-devel@lists.sourceforge.net>, Randy Dunlap <rdunlap@infradead.org>,
 Eric
 Biggers <ebiggers@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Christoph Hellwig <hch@infradead.org>, Yann Collet <cyan@fb.com>,
 David Sterba <dsterba@suse.cz>, LKML <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Petr Malat <oss@malat.biz>,
 Chris Mason <clm@fb.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Felix Handte <felixh@fb.com>, Oleksandr
 Natalenko <oleksandr@natalenko.name>, Kernel Team <Kernel-team@fb.com>,
 =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>,
 Niket Agarwal <niketa@fb.com>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>,
 Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



> On Apr 29, 2021, at 6:31 PM, Nick Terrell <nickrterrell@gmail.com> wrote:
> 
> From: Nick Terrell <terrelln@fb.com>
> 
> Please pull from
> 
>  git@github.com:terrelln/linux.git tags/v11-zstd-1.4.10
> 
> to get these changes. Alternatively the patchset is included.

Hi all,

Pinging this series. Is there anything I should do to help get this
merged?

The use of zstd in the kernel is continuously increasing over time,
both in terms of number of use cases, and number of users that
actually enable zstd compression in production. E.g. Fedora is
making btrfs with zstd compression enabled the default.

I would love to see the zstd code updated to the latest upstream
and be kept up to date. The latest upstream brings bug fixes, and
significant performance improvements. Additionally, the latest
upstream code is continuously fuzzed.

Thanks,
Nick

> This patchset lists me as the maintainer for zstd and upgrades the zstd library
> to the latest upstream release. The current zstd version in the kernel is a
> modified version of upstream zstd-1.3.1. At the time it was integrated, zstd
> wasn't ready to be used in the kernel as-is. But, it is now possible to use
> upstream zstd directly in the kernel.
> 
> I have not yet released zstd-1.4.10 upstream. I want the zstd version in the
> kernel to match up with a known upstream release, so we know exactly what code
> is running. Whenever this patchset is ready for merge, I will cut a release at
> the upstream commit that gets merged. This should not be necessary for future
> releases.
> 
> The kernel zstd library is automatically generated from upstream zstd. A script
> makes the necessary changes and imports it into the kernel. The changes are:
> 
> 1. Replace all libc dependencies with kernel replacements and rewrite includes.
> 2. Remove unncessary portability macros like: #if defined(_MSC_VER).
> 3. Use the kernel xxhash instead of bundling it.
> 
> This automation gets tested every commit by upstream's continuous integration.
> When we cut a new zstd release, we will submit a patch to the kernel to update
> the zstd version in the kernel.
> 
> I've updated zstd to upstream with one big patch because every commit must build,
> so that precludes partial updates. Since the commit is 100% generated, I hope the
> review burden is lightened. I considered replaying upstream commits, but that is
> not possible because there have been ~3500 upstream commits since the last zstd
> import, and the commits don't all build individually. The bulk update preserves
> bisectablity because bugs can be bisected to the zstd version update. At that
> point the update can be reverted, and we can work with upstream to find and fix
> the bug. After this big switch in how the kernel consumes zstd, future patches
> will be smaller, because they will only have one upstream release worth of
> changes each.
> 
> This patchset adds a new kernel-style wrapper around zstd. This wrapper API is
> functionally equivalent to the subset of the current zstd API that is currently
> used. The wrapper API changes to be kernel style so that the symbols don't
> collide with zstd's symbols. The update to zstd-1.4.6 maintains the same API
> and preserves the semantics, so that none of the callers need to be updated.
> 
> This patchset comes in 2 parts:
> 1. The first 2 patches prepare for the zstd upgrade. The first patch adds the
>   new kernel style API so zstd can be upgraded without modifying any callers.
>   The second patch adds an indirection for the lib/decompress_unzstd.c
>   including of all decompression source files.
> 2. Import zstd-1.4.10. This patch is completely generated from upstream using
>   automated tooling.
> 
> I tested every caller of zstd on x86_64. I tested both after the 1.4.10 upgrade
> using the compatibility wrapper, and after the final patch in this series.
> 
> I tested kernel and initramfs decompression in i386 and arm.
> 
> I ran benchmarks to compare the current zstd in the kernel with zstd-1.4.6.
> I benchmarked on x86_64 using QEMU with KVM enabled on an Intel i9-9900k.
> I found:
> * BtrFS zstd compression at levels 1 and 3 is 5% faster
> * BtrFS zstd decompression+read is 15% faster
> * SquashFS zstd decompression+read is 15% faster
> * F2FS zstd compression+write at level 3 is 8% faster
> * F2FS zstd decompression+read is 20% faster
> * ZRAM decompression+read is 30% faster
> * Kernel zstd decompression is 35% faster
> * Initramfs zstd decompression+build is 5% faster
> 
> The latest zstd also offers bug fixes. For example the problem with large kernel
> decompression has been fixed upstream for over 2 years
> https://lkml.org/lkml/2020/9/29/27.
> 
> Please let me know if there is anything that I can do to ease the way for these
> patches. I think it is important because it gets large performance improvements,
> contains bug fixes, and is switching to a more maintainable model of consuming
> upstream zstd directly, making it easy to keep up to date.
> 
> Best,
> Nick Terrell
> 
> v1 -> v2:
> * Successfully tested F2FS with help from Chao Yu to fix my test.
> * (1/9) Fix ZSTD_initCStream() wrapper to handle pledged_src_size=0 means unknown.
>  This fixes F2FS with the zstd-1.4.6 compatibility wrapper, exposed by the test.
> 
> v2 -> v3:
> * (3/9) Silence warnings by Kernel Test Robot:
>  https://github.com/facebook/zstd/pull/2324
>  Stack size warnings remain, but these aren't new, and the functions it warns on
>  are either unused or not in the maximum stack path. This patchset reduces zstd
>  compression stack usage by 1 KB overall. I've gotten the low hanging fruit, and
>  more stack reduction would require significant changes that have the potential
>  to introduce new bugs. However, I do hope to continue to reduce zstd stack
>  usage in future versions.
> 
> v3 -> v4:
> * (3/9) Fix errors and warnings reported by Kernel Test Robot:
>  https://github.com/facebook/zstd/pull/2326
>  - Replace mem.h with a custom kernel implementation that matches the current
>    lib/zstd/mem.h in the kernel. This avoids calls to __builtin_bswap*() which
>    don't work on certain architectures, as exposed by the Kernel Test Robot.
>  - Remove ASAN/MSAN (un)poisoning code which doesn't work in the kernel, as
>    exposed by the Kernel Test Robot.
>  - I've fixed all of the valid cppcheck warnings reported, but there were many
>    false positives, where cppcheck was incorrectly analyzing the situation,
>    which I did not fix. I don't believe it is reasonable to expect that upstream
>    zstd silences all the static analyzer false positives. Upstream zstd uses
>    clang scan-build for its static analysis. We find that supporting multiple
>    static analysis tools multiplies the burden of silencing false positives,
>    without providing enough marginal value over running a single static analysis
>    tool.
> 
> v4 -> v5:
> * Rebase onto v5.10-rc2
> * (6/9) Merge with other F2FS changes (no functional change in patch).
> 
> v5 -> v6:
> * Rebase onto v5.10-rc6.
> * Switch to using a kernel style wrapper API as suggested by Cristoph.
> 
> v6 -> v7:
> * Expose the upstream library header as `include/linux/zstd_lib.h`.
>  Instead of creating new structs mirroring the upstream zstd structs
>  use upstream's structs directly with a typedef to get a kernel style name.
>  This removes the memcpy cruft.
> * (1/3) Undo ZSTD_WINDOWLOG_MAX and handle_zstd_error changes.
> * (3/3) Expose zstd_errors.h as `include/linux/zstd_errors.h` because it
>  is needed by the kernel wrapper API.
> 
> v7 -> v8:
> * (1/3) Fix typo in EXPORT_SYMBOL().
> * (1/3) Fix typo in zstd.h comments.
> * (3/3) Update to latest zstd release: 1.4.6 -> 1.4.10
>        This includes ~1KB of stack space reductions.
> 
> v8 -> v9:
> * (1/3) Rebase onto v5.12-rc5
> * (1/3) Add zstd_min_clevel() & zstd_max_clevel() and use in f2fs.
>        Thanks to Oleksandr Natalenko for spotting it!
> * (1/3) Move lib/decompress_unzstd.c usage of ZSTD_getErrorCode()
>        to zstd_get_error_code().
> * (1/3) Update modified zstd headers to yearless copyright.
> * (2/3) Add copyright/license header to decompress_sources.h for consistency.
> * (3/3) Update to yearless copyright for all zstd files. Thanks to
>        Mike Dolan for spotting it!
> 
> v9 -> v10:
> * Add a 4th patch in the series which adds an entry for zstd to MAINTAINERS.
> 
> v10 -> v11:
> * Rebase cleanly onto v5.12-rc8
> * (3/4) Replace invalid kernel style comments in zstd with regular comments.
>  Thanks to Randy Dunlap for the suggestion.
> 
> Nick Terrell (4):
>  lib: zstd: Add kernel-specific API
>  lib: zstd: Add decompress_sources.h for decompress_unzstd
>  lib: zstd: Upgrade to latest upstream zstd version 1.4.10
>  MAINTAINERS: Add maintainer entry for zstd
> 
> MAINTAINERS                                   |   12 +
> crypto/zstd.c                                 |   28 +-
> fs/btrfs/zstd.c                               |   68 +-
> fs/f2fs/compress.c                            |   56 +-
> fs/f2fs/super.c                               |    2 +-
> fs/pstore/platform.c                          |    2 +-
> fs/squashfs/zstd_wrapper.c                    |   16 +-
> include/linux/zstd.h                          | 1252 +---
> include/linux/zstd_errors.h                   |   77 +
> include/linux/zstd_lib.h                      | 2432 ++++++++
> lib/decompress_unzstd.c                       |   48 +-
> lib/zstd/Makefile                             |   44 +-
> lib/zstd/bitstream.h                          |  380 --
> lib/zstd/common/bitstream.h                   |  437 ++
> lib/zstd/common/compiler.h                    |  151 +
> lib/zstd/common/cpu.h                         |  194 +
> lib/zstd/common/debug.c                       |   24 +
> lib/zstd/common/debug.h                       |  101 +
> lib/zstd/common/entropy_common.c              |  357 ++
> lib/zstd/common/error_private.c               |   56 +
> lib/zstd/common/error_private.h               |   66 +
> lib/zstd/common/fse.h                         |  710 +++
> lib/zstd/common/fse_decompress.c              |  390 ++
> lib/zstd/common/huf.h                         |  356 ++
> lib/zstd/common/mem.h                         |  259 +
> lib/zstd/common/zstd_common.c                 |   83 +
> lib/zstd/common/zstd_deps.h                   |  125 +
> lib/zstd/common/zstd_internal.h               |  450 ++
> lib/zstd/compress.c                           | 3485 -----------
> lib/zstd/compress/fse_compress.c              |  625 ++
> lib/zstd/compress/hist.c                      |  165 +
> lib/zstd/compress/hist.h                      |   75 +
> lib/zstd/compress/huf_compress.c              |  902 +++
> lib/zstd/compress/zstd_compress.c             | 5105 +++++++++++++++++
> lib/zstd/compress/zstd_compress_internal.h    | 1188 ++++
> lib/zstd/compress/zstd_compress_literals.c    |  158 +
> lib/zstd/compress/zstd_compress_literals.h    |   29 +
> lib/zstd/compress/zstd_compress_sequences.c   |  439 ++
> lib/zstd/compress/zstd_compress_sequences.h   |   54 +
> lib/zstd/compress/zstd_compress_superblock.c  |  850 +++
> lib/zstd/compress/zstd_compress_superblock.h  |   32 +
> lib/zstd/compress/zstd_cwksp.h                |  482 ++
> lib/zstd/compress/zstd_double_fast.c          |  521 ++
> lib/zstd/compress/zstd_double_fast.h          |   32 +
> lib/zstd/compress/zstd_fast.c                 |  496 ++
> lib/zstd/compress/zstd_fast.h                 |   31 +
> lib/zstd/compress/zstd_lazy.c                 | 1412 +++++
> lib/zstd/compress/zstd_lazy.h                 |   81 +
> lib/zstd/compress/zstd_ldm.c                  |  686 +++
> lib/zstd/compress/zstd_ldm.h                  |  110 +
> lib/zstd/compress/zstd_ldm_geartab.h          |  103 +
> lib/zstd/compress/zstd_opt.c                  | 1345 +++++
> lib/zstd/compress/zstd_opt.h                  |   50 +
> lib/zstd/decompress.c                         | 2531 --------
> lib/zstd/decompress/huf_decompress.c          | 1206 ++++
> lib/zstd/decompress/zstd_ddict.c              |  241 +
> lib/zstd/decompress/zstd_ddict.h              |   44 +
> lib/zstd/decompress/zstd_decompress.c         | 2075 +++++++
> lib/zstd/decompress/zstd_decompress_block.c   | 1540 +++++
> lib/zstd/decompress/zstd_decompress_block.h   |   62 +
> .../decompress/zstd_decompress_internal.h     |  202 +
> lib/zstd/decompress_sources.h                 |   28 +
> lib/zstd/entropy_common.c                     |  243 -
> lib/zstd/error_private.h                      |   53 -
> lib/zstd/fse.h                                |  575 --
> lib/zstd/fse_compress.c                       |  795 ---
> lib/zstd/fse_decompress.c                     |  325 --
> lib/zstd/huf.h                                |  212 -
> lib/zstd/huf_compress.c                       |  773 ---
> lib/zstd/huf_decompress.c                     |  960 ----
> lib/zstd/mem.h                                |  151 -
> lib/zstd/zstd_common.c                        |   75 -
> lib/zstd/zstd_compress_module.c               |  124 +
> lib/zstd/zstd_decompress_module.c             |  105 +
> lib/zstd/zstd_internal.h                      |  273 -
> lib/zstd/zstd_opt.h                           | 1014 ----
> 76 files changed, 27299 insertions(+), 12940 deletions(-)
> create mode 100644 include/linux/zstd_errors.h
> create mode 100644 include/linux/zstd_lib.h
> delete mode 100644 lib/zstd/bitstream.h
> create mode 100644 lib/zstd/common/bitstream.h
> create mode 100644 lib/zstd/common/compiler.h
> create mode 100644 lib/zstd/common/cpu.h
> create mode 100644 lib/zstd/common/debug.c
> create mode 100644 lib/zstd/common/debug.h
> create mode 100644 lib/zstd/common/entropy_common.c
> create mode 100644 lib/zstd/common/error_private.c
> create mode 100644 lib/zstd/common/error_private.h
> create mode 100644 lib/zstd/common/fse.h
> create mode 100644 lib/zstd/common/fse_decompress.c
> create mode 100644 lib/zstd/common/huf.h
> create mode 100644 lib/zstd/common/mem.h
> create mode 100644 lib/zstd/common/zstd_common.c
> create mode 100644 lib/zstd/common/zstd_deps.h
> create mode 100644 lib/zstd/common/zstd_internal.h
> delete mode 100644 lib/zstd/compress.c
> create mode 100644 lib/zstd/compress/fse_compress.c
> create mode 100644 lib/zstd/compress/hist.c
> create mode 100644 lib/zstd/compress/hist.h
> create mode 100644 lib/zstd/compress/huf_compress.c
> create mode 100644 lib/zstd/compress/zstd_compress.c
> create mode 100644 lib/zstd/compress/zstd_compress_internal.h
> create mode 100644 lib/zstd/compress/zstd_compress_literals.c
> create mode 100644 lib/zstd/compress/zstd_compress_literals.h
> create mode 100644 lib/zstd/compress/zstd_compress_sequences.c
> create mode 100644 lib/zstd/compress/zstd_compress_sequences.h
> create mode 100644 lib/zstd/compress/zstd_compress_superblock.c
> create mode 100644 lib/zstd/compress/zstd_compress_superblock.h
> create mode 100644 lib/zstd/compress/zstd_cwksp.h
> create mode 100644 lib/zstd/compress/zstd_double_fast.c
> create mode 100644 lib/zstd/compress/zstd_double_fast.h
> create mode 100644 lib/zstd/compress/zstd_fast.c
> create mode 100644 lib/zstd/compress/zstd_fast.h
> create mode 100644 lib/zstd/compress/zstd_lazy.c
> create mode 100644 lib/zstd/compress/zstd_lazy.h
> create mode 100644 lib/zstd/compress/zstd_ldm.c
> create mode 100644 lib/zstd/compress/zstd_ldm.h
> create mode 100644 lib/zstd/compress/zstd_ldm_geartab.h
> create mode 100644 lib/zstd/compress/zstd_opt.c
> create mode 100644 lib/zstd/compress/zstd_opt.h
> delete mode 100644 lib/zstd/decompress.c
> create mode 100644 lib/zstd/decompress/huf_decompress.c
> create mode 100644 lib/zstd/decompress/zstd_ddict.c
> create mode 100644 lib/zstd/decompress/zstd_ddict.h
> create mode 100644 lib/zstd/decompress/zstd_decompress.c
> create mode 100644 lib/zstd/decompress/zstd_decompress_block.c
> create mode 100644 lib/zstd/decompress/zstd_decompress_block.h
> create mode 100644 lib/zstd/decompress/zstd_decompress_internal.h
> create mode 100644 lib/zstd/decompress_sources.h
> delete mode 100644 lib/zstd/entropy_common.c
> delete mode 100644 lib/zstd/error_private.h
> delete mode 100644 lib/zstd/fse.h
> delete mode 100644 lib/zstd/fse_compress.c
> delete mode 100644 lib/zstd/fse_decompress.c
> delete mode 100644 lib/zstd/huf.h
> delete mode 100644 lib/zstd/huf_compress.c
> delete mode 100644 lib/zstd/huf_decompress.c
> delete mode 100644 lib/zstd/mem.h
> delete mode 100644 lib/zstd/zstd_common.c
> create mode 100644 lib/zstd/zstd_compress_module.c
> create mode 100644 lib/zstd/zstd_decompress_module.c
> delete mode 100644 lib/zstd/zstd_internal.h
> delete mode 100644 lib/zstd/zstd_opt.h
> 
> -- 
> 2.31.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
