Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 097E5DFCF0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2019 06:59:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iMmGq-0002fT-3L; Tue, 22 Oct 2019 04:59:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dkuhn@med.wayne.edu>) id 1iMmGo-0002fM-OB
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 04:59:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:Reply-To:Message-ID:Date:Subject:To:From:Sender:Cc:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OVFyrEE1KaJkOYZe5cthnA0NS5MP9OVoftAbLbOnIGY=; b=ITn4NoZ+CUWllod5FykxnAEvBN
 8tdgVJXb0k60Hn+2YJkW1+OeXTud/REgceV0AVl2OGTGclyQUiSmcDcc2fchtXjre6Zr6cyOS8+hQ
 3yvwKuWGDv8MmZAl2D7Pc5idoK6t6pd4LLuxZiE12zFvfAtlbhSzMlHCDl3yBgD37ZPQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Cc:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OVFyrEE1KaJkOYZe5cthnA0NS5MP9OVoftAbLbOnIGY=; b=A
 xEmHcOGlMRra6MA+WFYf9grWk3y+AO/GVK0cIL9zA7RzKRJNcgUEEeT+8aJQHNevXF7p8iUfV5wWO
 gyEim4053PuxD1/cJF1VpOiMrFkk/GjlhO3gc0+y1sO1tGUMiv1/WcjSsgHiXbp6saHmIJ0nr3DJB
 Y9MtUYw9DdFADjS8=;
Received: from mail-bgr052100140040.outbound.protection.outlook.com
 ([52.100.140.40] helo=NAM05-BY2-obe.outbound.protection.outlook.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iMmGj-00GScj-4l
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 04:59:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lt4ogt8yZCesCTg3Oglt1dHKwP/XBSbei2cD4Yksxa657f90VtnxkaBV/rlhpKgzAho9ycF1ljUyXwcGwfWyHoO+G7kErEopTaIxkaI87FnP2yCEEpM7BXKUaS8nazLA/7Z+svM0rWkpjWCvQiz0N+FbrYq3m8yP7rGXFhhK0QbRu+HXqaLs1L6ghL4+zg1B60G51wXMmWzlmOw1xTpP6+pwUrJclpAeDbaofMcAA3jh1mnn41HYq1zs2GQ4yFee5/8ucmo/h8X45ZAXpoPcsNCwpdTBAH39j8vEKnu/+Y0aACVgnwOULNnTWn5MVgwX3FJ/Xp3rlD7UDfzKrFOwkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVFyrEE1KaJkOYZe5cthnA0NS5MP9OVoftAbLbOnIGY=;
 b=ag7cz9nVaxxUZV1SyHko8sk22YKooojhXngFoafcnRMx5AG+UnScrxcwxBojVQWAUmjhaO3/jq7HrpKE5oPz/mQiY5fNrdFDsy0+9PkS548Fyb+UICa2TRZe7vDuc1q4YK3DlBnVeoIhmrK4iwEVs2CVTQ72rg5XartOLKMzFe+tqJ5acxlaFUhw5ZAUWEbLY3DQm/6SW/ZXJaQv/fpJLhAFvnXE10c51yHbWxTMtZtfXJGmNDn1zvoK4brxyt1Ri0m91xE8iPsSAeooc6OMwBBFhBGylEQ/Z1WTbmJVzLOUDgSWCB8/vtz9ESwp4mrXsFnDruoEbbCfx9P2sLBIMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=med.wayne.edu; dmarc=pass action=none header.from=wayne.edu;
 dkim=pass header.d=wayne.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=waynestateprod.onmicrosoft.com; s=selector2-waynestateprod-onmicrosoft-com; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVFyrEE1KaJkOYZe5cthnA0NS5MP9OVoftAbLbOnIGY=;
 b=KBt3sV/7D/I3Q0bTW1dS9dBZD5JRFbH1d+hOZEnGNNs/mF7PkwdqiMLIXP4DKzuQ/eUhv/wF1V1BwrS0JAI1iEcL/VJS9ZnXMGFckc8E1U4Ud1fEyklVQ6KjkMvwZNmfsQSoqP52f8G8oO1tZko/LBPbB5DdU1K+T7fiqfSn+sE=
Received: from BL0PR11MB3220.namprd11.prod.outlook.com (10.167.182.151) by
 BL0PR11MB3394.namprd11.prod.outlook.com (10.167.240.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Tue, 22 Oct 2019 02:23:50 +0000
Received: from BL0PR11MB3220.namprd11.prod.outlook.com
 ([fe80::51b0:6df4:12f7:faf6]) by BL0PR11MB3220.namprd11.prod.outlook.com
 ([fe80::51b0:6df4:12f7:faf6%7]) with mapi id 15.20.2347.029; Tue, 22 Oct 2019
 02:23:50 +0000
From: Lisa Yu <aa3071@wayne.edu>
To: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: New order
Thread-Index: AQHViH+TNEXzybXKyUGHYHRl+OU7MQ==
Date: Tue, 22 Oct 2019 02:22:39 +0000
Message-ID: <BL0PR11MB3220244CF55472D7BB2476C0C1680@BL0PR11MB3220.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR2101CA0013.namprd21.prod.outlook.com
 (2603:10b6:805:106::23) To BL0PR11MB3220.namprd11.prod.outlook.com
 (2603:10b6:208:2f::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dkuhn@med.wayne.edu; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [155.94.250.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a623b22-9468-4524-c057-08d75696b5e9
X-MS-TrafficTypeDiagnostic: BL0PR11MB3394:|BL0PR11MB3394:
x-microsoft-antispam-prvs: <BL0PR11MB3394716815AE55F48C872D58FA680@BL0PR11MB3394.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1107;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(346002)(396003)(39860400002)(366004)(199004)(189003)(33656002)(43066004)(66806009)(6666004)(71200400001)(71190400001)(186003)(14444005)(52116002)(7696005)(99286004)(558084003)(14454004)(256004)(5660300002)(25786009)(478600001)(81166006)(316002)(786003)(476003)(2860700004)(486006)(8796002)(8676002)(8936002)(3480700005)(81156014)(5640700003)(66556008)(2351001)(64756008)(7116003)(66446008)(6506007)(9686003)(221733001)(55016002)(66476007)(6916009)(74316002)(305945005)(55236004)(75432002)(26005)(386003)(7736002)(6116002)(2906002)(3846002)(2501003)(88552002)(52536014)(66066001)(6436002)(66946007)(102836004)(5003540100004)(19580200005);
 DIR:OUT; SFP:1501; SCL:1; SRVR:BL0PR11MB3394;
 H:BL0PR11MB3220.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: med.wayne.edu does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0aXL9gRZ6OzyMpS71dO314P2BQQsP8OHSSNZ7k1a9fu7JI/EvIEtebsI3a1NxQ0K23+HmEdRgf0P3+ejW3ztvhDW4pJiOvIkwvj8gwVmqyMK5zYR6sEOtrihvCMHPdSTiGHY+PvKMqCMWzBR4bURiZOkYXPKAJSKD5cNNJ71RsZCZJQKkUgbeBl76+VR+mdJy1lVTyHFeIFeV5Lv7F6/i+UCqHFYPQVq6lyo1PELzmSgILdMWwpZhtb7rsapWAld1ztPLqoatrk442xZX2vqYbeTD0go4QmLvUXhPtFhHzRF3d1O6KKyOJ+NMnL+wVlgKiIjJLPwrSEfK1kRLs2a0R6K/ekjZCbLS0WUCBllyUkrT3rgq6rdNMMF9AguXlE7avVMMgrh1feaGJzw/VCXyUhFq/qd3TcaXFvUij6B7YuFumw+afy9ZlYN/B0TqYsr
x-ms-exchange-transport-forked: True
Content-ID: <82AAB60680751942931950033F404C00@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a623b22-9468-4524-c057-08d75696b5e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 02:22:39.4171 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e51cdec9-811d-471d-bbe6-dd3d8d54c28b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F2USuyJIoEmT9MTtSWYw5FWDkjtUYGvaeqjoCofy28XLDcmz73OBZD1N7+FYT1o+Zh0wquuwPXIoTCbjmotFdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3394
X-OriginatorOrg: wayne.edu
X-Spam-Score: 3.7 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.9 URG_BIZ                BODY: Contains urgent matter
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [52.100.140.40 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in digit
 (lisayu024[at]outlook.com)
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Headers-End: 1iMmGj-00GScj-4l
Subject: [f2fs-dev] New order
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
Reply-To: "lisayu024@outlook.com" <lisayu024@outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,


We have interest in purchacing some of your products. Kindly send us a breif catalog to help us make an order. 

Your urgent reply will be of good help.


Regards,

Lisa Yu | Sales Person.
NNA HOLDINGS.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
