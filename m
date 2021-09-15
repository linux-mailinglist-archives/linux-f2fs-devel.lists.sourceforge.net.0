Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0970440BF83
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Sep 2021 08:01:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mQNyy-0005br-Jy; Wed, 15 Sep 2021 06:01:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=8851c81c2=shinichiro.kawasaki@wdc.com>)
 id 1mQNyw-0005bY-DQ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Sep 2021 06:01:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fFnXEnr9ihhGqo2baR8C67MZ+I3/4mV59UCTTL/1i/s=; b=V7nEZJBrwVIG56It0CWbAJxYBt
 kTLDEBsmdAAxSroNbbbEI8bHTuHI5RJMpJYXnX5n9MaLPC5Gf+T+N2pJOdVCltUF0Blahbdh0H77M
 QqVX3khT/qjj5U8tDvBM3sciDNAh4q0ms5eqaQYp1ysFFjscfBsDPsPspl7q/Wxk3d/4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fFnXEnr9ihhGqo2baR8C67MZ+I3/4mV59UCTTL/1i/s=; b=eREqR0K+beoPjCzY6UC+3F0oX0
 Rtty6yoW0V7dy/jw/RmRIkh5dR34XamJHIwJLxXPpV8mWsb9IFYLcP/Td9whFYOO6Asu8+X8PMIiL
 0WkPgP1Hl+ytLO49HSM6FJZuL+VcQQhhp21SXC3AEoghTmTPeW1rw4OOTN4cDptOmbWA=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mQNyt-00BCaP-Lt
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Sep 2021 06:01:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631685675; x=1663221675;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=B4J4cZDfvmr2OHr4el4fwfXQs3oMLmlfRhYckEpdgB8=;
 b=I5tTwI9vLbMzl1NXtJ1M/WQDO4sm72AbSXkxk8boy1ypxaHo3a0B0LPd
 BKibaW7erAO6axjxCSeFGpMQfBT4k96gLhQuXGn3C5n1oC06hMClTK1iF
 tnOAVIqZgNJrFHO/cE4D3ec5hMYYiWSojTFpZX0ILTECTJoSQ2puF0IyB
 304mZyFiG/BFzB+L8Nt4OaZQ9Zy5uoc6R/+lxiEffnwsWPwOWWrfs0xwM
 0akmkeoX2TzqUTBOxiLF/sT/ZG2zAPnjV0ykhYkqJOGCN9mJuyFu4eZb9
 01DIgKTo02Z9J5Tn/AlXDiXSn8pYXYhN7DevQARV8pzUEhSekyQVLW2Fp A==;
X-IronPort-AV: E=Sophos;i="5.85,294,1624291200"; d="scan'208";a="291657923"
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hgst.iphmx.com with ESMTP; 15 Sep 2021 13:45:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIm/04iMnUzRyvmJHqfP/FQzzVcO6ijuQ+PaQjqY6ESRDUSUc/BToQdkUeY3F008ixl6Uk7PHB1iEgVRuNZiBjWfnFyuxr+s5cgMXAXvgKGbJ1LkU4EHrF7WZkGQvI9KHZ7XzRnfJeLc+olSvWt3dSDwZ6pzvSs1ALKqFHvlmUd8EVZHldoyfHqYDNY7TxTBp5Q+eUAH/PMshqeMvgqh12/+YkVRgPUI4LOfFcrrp+LpzX2kQ0PXYl3Kde4gHSJB7+IT+pEvb6NQxmUJ+Y7zMnvTaPl0jhsmI6H+zrDnHXH3T/x4ruX3tQQBer1mM07ndOPnkXKgeRxxIMUx64cJWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=fFnXEnr9ihhGqo2baR8C67MZ+I3/4mV59UCTTL/1i/s=;
 b=YmcNJCBUEbjNf6QomAsLomn4lNygcSTh6XpjKmy++ZEMKgC9TcVOv08JO9CiyUyUB9OJvRuMNciRdccwluYyjGubi0p2sRFlovBmP5FDm/kRlFXqvhloQyPMnDj24RLPDvcrsBAir/o/vI5LYF4K04J8cbIin3RJxAIipodRuYyeY+6HVMk3KMgOlBI9CG0ppmWaHpQfpqd0GUvcuNh1Kk1268Qp++glhVfg3v1Fow1mAAyWVezCxA6KxwTaXG/9pQa0ncG90AZa1cvdQVA5XdJc7oYvTHGjWXJcCRDfV5uweIHu3TMXOAhVX0l/lzJYwQJgEaTsiXFcVc+tBCmCkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFnXEnr9ihhGqo2baR8C67MZ+I3/4mV59UCTTL/1i/s=;
 b=MPexhBkakcJcfOyZQDN0LsdIiAxjfXprXBoy5+tVcg1G5N36q4gYbC1FIyh6wReiaRBKb72p8akOtGQOaP0WZoLkyPvFcvSp/kIob4MjZ0qd/1EzTOTbBT1huaHhdp5xll94Mq1SugqhL4qH5iv4yE2jcMMqhKwENO5442mp5+U=
Received: from SJ0PR04MB7184.namprd04.prod.outlook.com (2603:10b6:a03:291::7)
 by SJ0PR04MB7280.namprd04.prod.outlook.com (2603:10b6:a03:2a1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 05:45:33 +0000
Received: from SJ0PR04MB7184.namprd04.prod.outlook.com
 ([fe80::30f6:c28:984d:bd79]) by SJ0PR04MB7184.namprd04.prod.outlook.com
 ([fe80::30f6:c28:984d:bd79%5]) with mapi id 15.20.4500.018; Wed, 15 Sep 2021
 05:45:33 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [f2fs-dev] [PATCH] mkfs.f2fs: wipe other FS magics given -f
Thread-Index: AQHXqfTmr9HoY1CH2UiiapdYmZKnnQ==
Date: Wed, 15 Sep 2021 05:45:33 +0000
Message-ID: <20210915054532.alaps3utwwei4efo@shindev>
References: <20210910225618.501839-1-jaegeuk@kernel.org>
In-Reply-To: <20210910225618.501839-1-jaegeuk@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 262c3996-68af-478a-9339-08d9780c092f
x-ms-traffictypediagnostic: SJ0PR04MB7280:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR04MB7280F2094AC1A686E357CF8CEDDB9@SJ0PR04MB7280.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:115;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GYtHeiZM1m7PW5tR7+NdQ1Hq6FU7E3u8l/cbNJVF7JLUVaXJl/S4CyjrI2JAo8LqPFQhzft50YuqFCYudJ73sgqgGXSPXFCtMAok3F1YICw4PWVFo6omq7U4TEiCNAEXmG0euUH50+WIlkfTcq6zQ7eBMtvstuUAX+pImt9uKMerEPKLb6qCEtAOGk6dTI73shYr2DQsqwpzR+x0+muV8+zDt5nZWTYBQR5aiLGQA4qoYP4NS+P9g+p7J15SYUL5eKWXw8S5V9VlpUjlxYjS0HgW2Vu3hC9ukh7T5lgAOq3PSghL8KZyblKAQv10gjhXJAjtsu7bPmKonY2AAFEnIK9JafIXtyOt2omns0/rh3IgUcBUhvifHFB5Dn4c4WEn24h1mynd6Wvz3ynWBLpy6Lo9WNlVXeRDSni5RCV6UPv/ZTMAiw/YmVw4SJtTJ7C3N/evzyVtiVadtHDgJ4R30S4dE3aCcfxkotqmreAkc/I1w0OsEUNZi/j524gn4gu+XkrxwFyUF8LhMamhz298468dVQQftgZWlF9PXT0ef6zFt3skGRaGHqltsyazdibJm2ljcEsdvDhbRQxl4u2SrC9sRq9jVOMpRovIRxlOZ4HjGq0wxabOAGlbRUZXjbXNKR94ARymM1oLi1c2WQm9XzVr0tgZBufWfMbifDvniexj05nRYOzLZhZjgU6c3HCf7GYFqA5KH8zo0ZQyHJ4pNihMjDU0RUtiT1l1baUuuv5gMutHb+9QY7t1eHhVI0eER9pcqS/Jjc31HTX8f53ufc7n7gRqKxSl4FZ6f1M5ULZDskjbiy0f90X2yII9ua4O
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB7184.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(396003)(366004)(346002)(136003)(376002)(39860400002)(33716001)(6486002)(478600001)(64756008)(66946007)(83380400001)(91956017)(76116006)(54906003)(66556008)(66446008)(8936002)(8676002)(1076003)(38070700005)(66476007)(4326008)(9686003)(6512007)(316002)(966005)(38100700002)(186003)(6916009)(26005)(71200400001)(44832011)(2906002)(5660300002)(4001150100001)(122000001)(86362001)(6506007)(505234006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IpQg75S5xAvHwcod4sO+grCNW7eqVWGU8TaxW1UFGoKjh0BHkv0FMD1zjsgF?=
 =?us-ascii?Q?T9Q2HNZ/vNt7ii5KwkkbfUQ3FkEoOSaBUUv960xR+YNSFtBk1YBTDDmVzJms?=
 =?us-ascii?Q?a1LI3A0YrQSBLeD0fuOuPbS+OHqp9791eQb5nrocSN8idFiJSppl+tOd1+wq?=
 =?us-ascii?Q?bc6TbRV4TQ/+lmJI2+Zxi+0n1TJg29uyO94nXxYFmJ+DZF3JVPp2KnWZezGS?=
 =?us-ascii?Q?X+X6US0GS96OYhX8CewKoK4MjQAhOkcD/O/UxIpB0ORyExUfo2bTvfIZklnc?=
 =?us-ascii?Q?VYXKcDcUb8KH5uv5wXs6KAIFkKfQs1EgTytJB3LXeByh2oqXVJXmZxVHpXeu?=
 =?us-ascii?Q?Ds1Rf9FejghxXBAwcK9SdpXLKPqAnOMie1SIdHloBi6Lx+GC8IQomJ6IxYBp?=
 =?us-ascii?Q?DT6ypjUqPLsMGR8w2B1jQQ8WpW8/KwAv3QZrfS2jmrJMiZL3BQA/P85FTdCu?=
 =?us-ascii?Q?Q3054Gbui2W941QtIAzGKNcYokiLc5JN5+yRwsMQH+PdIyBADNan+Z1zWEIw?=
 =?us-ascii?Q?XhaBZbYEb78BDvIf4/+8ElYP8Hyx0GnYW99lwi3e7649uH3c2kHuh8ZHd5+2?=
 =?us-ascii?Q?lBLpu2ujHOt9Ms+VOWvIPZM3Kx/buGYEvxoP/ZV5KX4qAfYA+6UFk9/3ZvWz?=
 =?us-ascii?Q?LKKiS/GMpWQAUnYzS2sWMY9Ka/5to/SGZdSgxB6IrBU58eiW+rYCJZvgTtWa?=
 =?us-ascii?Q?mOKoURr90LDzsTDSJK9xoIVovD67J37in65bDs5kSFDQ5cx1U4fUJfFl18Go?=
 =?us-ascii?Q?yQaZEiQsvdBHR3IdSQRYapXTBCfbPKypU5HG7d4zOA/6hwwLZZf/TH2YY3LB?=
 =?us-ascii?Q?c8CgCSqqjRxsW+eikh2nq7Rf9eFwiM4BcDE6duVEXbK1FiFI3+839wIXFG1u?=
 =?us-ascii?Q?dspecUVCtUocBuJmaA0MIa/l4p6FRTFUGdXgdtGGp2NRErRIfBl6Nd3N1FNV?=
 =?us-ascii?Q?prEhS1WYFet0u0gzbxkoQYHcPzcBm8wYK8xTuonrtKleXd/B1jLBnxLBiEAu?=
 =?us-ascii?Q?2j0b/6DFF/5ABFKCcL/Jj1udyoL4qrGu6JQpvCFUiu25qZiXcYvl6J+XkR+2?=
 =?us-ascii?Q?rL7E8hwWU1KKXW+veHor39ueRHg4rmszuiHLjuceOE6CvbOelQRkjJfYCm6A?=
 =?us-ascii?Q?ZAgmfzbFG72P+YDvdnLMNN6qKa/JbOvWfSXIoCvFQreMomenXuwAMf8zeFGt?=
 =?us-ascii?Q?/Tzh3xnV65dZThgfk1G+g8N0acGBN9xIJWMkeTCiSR3IrbfwO4PSD4CAsaU0?=
 =?us-ascii?Q?n21w2rQ8fvNDmLFLqi+aGyNDt5Z83xYkqJJ7o7jY9Aq/gE+bHQ7SrFxUQ5fb?=
 =?us-ascii?Q?CAKU/HqqwaJGYHcleW6Cq13fFeBcKspcqfDgjZH9PzcIsg=3D=3D?=
Content-ID: <E20C0FD0A139534A91F55FD1EC08A247@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB7184.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 262c3996-68af-478a-9339-08d9780c092f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2021 05:45:33.6389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kd+Tm34Yza9mhFYoj6vBInPSGwAqTvwbtlXNSXex0S6pgON3BtSKjiV62HY/XNZxdaVjXDtmVCB8f9Xdft++ZoCLyGyUYfzWMHYvn9//kcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7280
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sep 10, 2021 / 15:56,
 Jaegeuk Kim wrote: > This patch fixes
 the below stale magic info. > > $ mkfs.btrfs -f test.img > btrfs-progs v5.10.1
 > See http://btrfs.wiki.kernel.org for more information. > [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [68.232.141.245 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mQNyt-00BCaP-Lt
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: wipe other FS magics given -f
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sep 10, 2021 / 15:56, Jaegeuk Kim wrote:
> This patch fixes the below stale magic info.
> 
> $ mkfs.btrfs -f test.img
> btrfs-progs v5.10.1
> See http://btrfs.wiki.kernel.org for more information.
> 
> Label:              (null)
> UUID:               941d2db7-3ece-4090-8b22-c4ea548b5dae
> Node size:          16384
> Sector size:        4096
> Filesystem size:    1.00GiB
> Block group profiles:
>   Data:             single            8.00MiB
>   Metadata:         DUP              51.19MiB
>   System:           DUP               8.00MiB
> SSD detected:       no
> Incompat features:  extref, skinny-metadata
> Runtime features:
> Checksum:           crc32c
> Number of devices:  1
> Devices:
>    ID        SIZE  PATH
>     1     1.00GiB  test.img
> 
> $ hexdump -s 0x10000 -n 128 -C test.img
> 00010000  81 29 94 0a 00 00 00 00  00 00 00 00 00 00 00 00  |.)..............|
> 00010010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 00010020  94 1d 2d b7 3e ce 40 90  8b 22 c4 ea 54 8b 5d ae  |..-.>.@.."..T.].|
> 00010030  00 00 01 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
> 00010040  5f 42 48 52 66 53 5f 4d  05 00 00 00 00 00 00 00  |_BHRfS_M........|
> 00010050  00 40 d2 01 00 00 00 00  00 40 50 01 00 00 00 00  |.@.......@P.....|
> 00010060  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 00010070  00 00 00 40 00 00 00 00  00 00 02 00 00 00 00 00  |...@............|
> 00010080
> 
> $ mkfs.f2fs -t 0 -f test.img
> 
> 	F2FS-tools: mkfs.f2fs Ver: 1.14.0 (2020-12-28)
> 
> Info: Disable heap-based policy
> Info: Debug level = 0
> Info: Trim is disabled
> Info: Segments per section = 1
> Info: Sections per zone = 1
> Info: sector size = 512
> Info: total sectors = 2097152 (1024 MB)
> Info: zone aligned segment0 blkaddr: 512
> Info: format version with
>   "Linux version 5.10.46-4rodete1-amd64 (glinux-team@google.com) (gcc-10 (Debian 10.2.1-6+build2) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP Debian 5.10.46-4rodete1 (2021-08-20)"
> Info: Overprovision ratio = 6.360%
> Info: Overprovision segments = 68 (GC reserved = 39)
> Info: format successful
> 
> $hexdump -s 0x10000 -n 128 -C test.img
> 00010000  c2 8a c8 26 00 00 00 00  00 00 00 00 00 00 00 00  |...&............|
> 00010010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 00010020  92 ab 3f c6 b7 82 49 5e  93 23 e8 c9 e9 45 7d ac  |..?...I^.#...E}.|
> 00010030  00 00 01 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
> 00010040  5f 42 48 52 66 53 5f 4d  05 00 00 00 00 00 00 00  |_BHRfS_M........|
> 00010050  00 40 d2 01 00 00 00 00  00 40 50 01 00 00 00 00  |.@.......@P.....|
> 00010060  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 00010070  00 00 00 40 00 00 00 00  00 00 02 00 00 00 00 00  |...@............|
> 00010080
> 
> --- After this patch ---
> $ mkfs.f2fs -t 0 -f test.img
> 
> 	F2FS-tools: mkfs.f2fs Ver: 1.14.0 (2020-12-28)
> 
> Info: Disable heap-based policy
> Info: Debug level = 0
> Info: Trim is disabled
> 	test.img appears to contain an existing filesystem (btrfs).
> Info: Segments per section = 1
> Info: Sections per zone = 1
> Info: sector size = 512
> Info: total sectors = 2097152 (1024 MB)
> Info: zone aligned segment0 blkaddr: 512
> Info: format version with
>   "Linux version 5.10.46-4rodete1-amd64 (glinux-team@google.com) (gcc-10 (Debian 10.2.1-6+build2) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP Debian 5.10.46-4rodete1 (2021-08-20)"
> Info: Overprovision ratio = 6.360%
> Info: Overprovision segments = 68 (GC reserved = 39)
> Info: format successful
> 
> $ hexdump -s 0x10000 -n 128 -C test.img
> 00010000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 00010080
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fsck/main.c             |  2 +-
>  include/f2fs_fs.h       |  1 +
>  lib/libf2fs.c           |  6 ++++++
>  mkfs/f2fs_format_main.c | 26 ++++++++++++++++++++++----
>  4 files changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/fsck/main.c b/fsck/main.c
> index eda399cf0679..e4cfdf443867 100644
> --- a/fsck/main.c
> +++ b/fsck/main.c
> @@ -1120,7 +1120,7 @@ int main(int argc, char **argv)
>  	}
>  
>  	/* Get device */
> -	if (f2fs_get_device_info() < 0) {
> +	if (f2fs_get_device_info() < 0 || f2fs_get_f2fs_info() < 0) {
>  		ret = -1;
>  		if (c.func == FSCK)
>  			ret = FSCK_OPERATIONAL_ERROR;
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index 2a9c1169456c..69260a6fccd9 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -1341,6 +1341,7 @@ extern int f2fs_devs_are_umounted(void);
>  extern int f2fs_dev_is_writable(void);
>  extern int f2fs_dev_is_umounted(char *);
>  extern int f2fs_get_device_info(void);
> +extern int f2fs_get_f2fs_info(void);
>  extern unsigned int calc_extra_isize(void);
>  extern int get_device_info(int);
>  extern int f2fs_init_sparse_file(void);
> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> index b27785dec757..420dfdae56da 100644
> --- a/lib/libf2fs.c
> +++ b/lib/libf2fs.c
> @@ -1183,6 +1183,12 @@ int f2fs_get_device_info(void)
>  	for (i = 0; i < c.ndevs; i++)
>  		if (get_device_info(i))
>  			return -1;
> +	return 0;
> +}
> +
> +int f2fs_get_f2fs_info(void)
> +{
> +	int i;
>  
>  	if (c.wanted_total_sectors < c.total_sectors) {
>  		MSG(0, "Info: total device sectors = %"PRIu64" (in %u bytes)\n",
> diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
> index 031244d5d67a..de93f1b5b778 100644
> --- a/mkfs/f2fs_format_main.c
> +++ b/mkfs/f2fs_format_main.c
> @@ -396,18 +396,36 @@ int main(int argc, char *argv[])
>  
>  	c.func = MKFS;
>  
> -	if (!force_overwrite && f2fs_check_overwrite()) {
> -		MSG(0, "\tUse the -f option to force overwrite.\n");
> +	if (f2fs_get_device_info() < 0)
>  		return -1;

Jaegeuk, thanks for the patch. Today, I had a chance to try out the dev branch
with this patch, and observed mkfs.f2fs for block devices failed with the
messages as follows:

$ sudo mkfs.f2fs -f /dev/sdc

        F2FS-tools: mkfs.f2fs Ver: 1.14.0 (2021-09-10)

Info: Disable heap-based policy
Info: Debug level = 0
Info: Trim is enabled
Info: [/dev/sdc] Disk Model: SanDisk SDSSDH32
        /dev/sdc appears to contain an existing filesystem (f2fs).
        Error: In use by the system!

I think f2fs_get_device_info() call above opens the block device with O_EXCL.
And the following f2fs_devs_are_umounted() opens the device again with O_EXCL.
The second open results in E_BUSY and the error message. I tried to move
the f2fs_devs_are_umounted() call before the f2fs_get_device_info() call, then
the error disappeared. So, I suggest to move the f2fs_devs_are_umounted() call.

> +
> +	if (f2fs_check_overwrite()) {
> +		char *zero_buf = NULL;
> +		int i;
> +
> +		if (!force_overwrite) {
> +			MSG(0, "\tUse the -f option to force overwrite.\n");
> +			goto err_format;
> +		}
> +		zero_buf = calloc(F2FS_BLKSIZE, 1);
> +		if (!zero_buf) {
> +			MSG(0, "\tFaile to allocate zero buffer.\n");

I guess you meant "Failed" in place of "Faile".

> +			goto err_format;
> +		}
> +		/* wipe out other FS magics mostly first 4MB space */
> +		for (i = 0; i < 1024; i++)
> +			dev_fill_block(zero_buf, i);
> +		free(zero_buf);
> +		f2fs_fsync_device();
>  	}
>  
>  	if (f2fs_devs_are_umounted() < 0) {
>  		if (errno != EBUSY)
>  			MSG(0, "\tError: Not available on mounted device!\n");
> -		return -1;
> +		goto err_format;
>  	}
>  
> -	if (f2fs_get_device_info() < 0)
> +	if (f2fs_get_f2fs_info() < 0)
>  		goto err_format;
>  
>  	/*
> -- 
> 2.33.0.309.g3052b89438-goog
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

-- 
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
