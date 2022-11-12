Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 925976265E5
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Nov 2022 01:15:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oteBH-00060C-2i;
	Sat, 12 Nov 2022 00:15:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=231520a4e5=terrelln@meta.com>)
 id 1oteBE-000606-CB for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Nov 2022 00:15:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=l/6An1APE+zcSjnqfUV+x14jhK2lduAp/9FAfYAuK00=; b=CRKO6YaMhbf023Qd19McoKNmbs
 7dMDHkkhGnFENhUQfUEI9p003DyfiFAH8cqUBjN/u3yo1N8bgT2dzTAR9ol5xqnPv9zzLO0C4laDz
 Zg1KmkL4JH8Czl7JDvDvY4j4JZAIUIAr238x3pdWCIjth6YpxtE8lTQwHDYeqUWkTXBg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Content-ID:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l/6An1APE+zcSjnqfUV+x14jhK2lduAp/9FAfYAuK00=; b=LJVmsAAj7XgNkWBP4loOngBJvo
 mLIaQZFrzpr/r58wjwG4Bu7LKLrW+HtLjedWm6j8OcehtFT0KsDbslW+rYBaXoa+bIni1Lbm5aC+T
 7VkLLxDE/sgXYbXm5XKug/0jns/e9hVb2oASjmAlgBG2fyLUGbQRDm/1tZ1bVRGOg0uQ=;
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oteB6-0007bc-Ni for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Nov 2022 00:15:27 +0000
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2ABJO4t0001592;
 Fri, 11 Nov 2022 16:15:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-id :
 content-type : content-transfer-encoding : mime-version; s=s2048-2021-q4;
 bh=l/6An1APE+zcSjnqfUV+x14jhK2lduAp/9FAfYAuK00=;
 b=csp/h1eWQbmLyVTq6jM6FnY3FJPDQ2LY8vB4xqAFxFYtVSyT+74vxzwqRuVCjuYKIY/p
 81c4p1RfcfeKcFoCQ0Oe04qy+WnDzgl/a7/BagVnUx3V2voXg4/iZTYkgnx0hi8vfraJ
 eL62e01J1yCwcHpOpDn+tujskzrp6POgPjXyBOf4B/gykVWqF4xscxddFQXw9aPygHEs
 PwkBKfAhMFiWjX2TDIwF+cNb6xzpkSvLyqf5FQ9+igBYiAL3Tx2Z9uOmjbQz+tIks4BB
 dMOW6feU1qOPXsaFmuNiWq6ju3hyoDHwnZ5dN0iEteVxaJOTcRBWoA/A9XHQFkI2hp4o Bg== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3ksj0hx6r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Nov 2022 16:15:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsmfgVG4fcQLJbHJTNXwLsDWRKxY5Q+U1a3S3stx5Alc0SYD2ExAldskIvLIEfpYBMlEOY7e31PKB6bT5TxOQeANXvm9Fxw2xxs7bFwYaI1s5PKIeWxnzAwbM4ohWToHtYeuHsEge0uvm0tWIueKXLeVIATSaAgTJIG6Zxzw7e9I/4tyPGpksbKEAi+EQuWfjHqB0F9Il16IpaiRbTwt9eUKoJ5Tz8wmm/h2RytEuLQmy2uOxSZU0gaIfmZRmY2xj/Mh0bOPZTl95ZCB79RPfQYBXR+9XmRYcRoZ7ubSdP/7NuySMuo17ldwquBVb2Yn8d3lcnzfj2f3FRycG/yWOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w20IEz5HcD6HFtOaojKEuKrdRw/SwgFUekC7mPck7AI=;
 b=B78lD20ulCIXuzfHRMoyozy9zPN3ZSwLrQWohR7p0yfSIEUSW5u7cL5RCXRCuKCqo9ymaOpTfoyLVGZ8OIixf1IRi8UwLV+YlPAo330JsyELTlg+5WdpbScY60M/9wofM485c3HZUvJxcQPjbJ9zw2J1LapolK5/pFfV93/s409Ephh9g7xgQ1yne1nkYqS8xNGkULkj+g3EOcjGkHpDZqtHMSao19gPM5zvw/W088+ToziKspxiiHEuKseFbTCbjy/i+X5aIWAM6XN+8qBm/RTDPexksQynB/Vs2C+8GceuddnA1mZWVMz1O5Zht96m70adQ+/81RHz/f7CRwAVtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from CH2PR15MB3672.namprd15.prod.outlook.com (2603:10b6:610:5::14)
 by MW4PR15MB5269.namprd15.prod.outlook.com (2603:10b6:303:16a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Sat, 12 Nov
 2022 00:15:08 +0000
Received: from CH2PR15MB3672.namprd15.prod.outlook.com
 ([fe80::f2e4:890:b012:8910]) by CH2PR15MB3672.namprd15.prod.outlook.com
 ([fe80::f2e4:890:b012:8910%4]) with mapi id 15.20.5791.022; Sat, 12 Nov 2022
 00:15:08 +0000
To: syzbot <syzbot+40642be9b7e0bb28e0df@syzkaller.appspotmail.com>
Thread-Topic: [syzbot] INFO: trying to register non-static key in
 f2fs_handle_error
Thread-Index: AQHY8TDGOufU10+cX0Cig6UNtwRGBq40LCQAgAZJHwA=
Date: Sat, 12 Nov 2022 00:15:08 +0000
Message-ID: <E31B0CBC-F169-4C7D-9FE6-F928C0F802AF@fb.com>
References: <0000000000006a83e705ecea7171@google.com>
In-Reply-To: <0000000000006a83e705ecea7171@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR15MB3672:EE_|MW4PR15MB5269:EE_
x-ms-office365-filtering-correlation-id: 7ea76d8f-ac68-4da1-cbde-08dac442f53e
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 39JepzQT6dLoz2zgPoV+112FJ91Q0gguLtRJBwTcmRJsf4dC8WXxLCOlO1agmefzhion2MexDSrrPbV2HEuFRQXw/6IlLm2Zpoj7JMLt+8Wn6S/TzypNb12Sdb7lAESL9fHzcBwWivcYVLabGjerjKu6Inw/8zuLBTfvhKPjkxHVIIu0ErMfChJi8kwo80N1zjSlcFBirfEMLzmT1XESFGNW6S83T34bW2kHG0GgJQ6QAyR4BQs7Qenr9WtKPbhcSkTu5pkilpO62b+ObCVeo0wLbG5KTiYjDp9UNLqbtJtqXZCEgbSAdW67/yD2XDERgtN+0zh1Kfx5BmB9g7ruSKK+E0Udhq2+4DIJQOW8pM18Aq5gsEJ19rq8iuweOodQ0ANo/R+4nNUick4dqd93kW07ffIzogrnRgcPdqs7k6pE4f7XqW+rmNSDBLzindNUYIfOqTrjwhT26ZFovDM5NvQey1jk7MdatF3daJSfwnaVozQwu0WLQZN6yNFLlvVDSTVrm+0RLI+QXxQPucBx6OtUYMM2EOaf/U46pLsVqNN/syk1TpgPymetc95zNVQ3DnjWtADNE/og9IxXPyO0SrcI26MQo4GWh+89nvNHk7lV9T+hI9gGDPCYkaLmARbZzjaXO9c3la4cf6DVRBYz0aO1mJ5T+KALjFnOLs8ojNOng1wniua5T41IqvQh/IYTupIdOdqndH7+NFwALE1h6IvMqqgf1xgowZEcgK2sRpYmeUQp1DukoWwZbkARL3gW5hy1TM7noSpxEcqveiopAGtq1wGHebKnCzYHE0Tkq6p/zwkyUu0wDCylO+nNxoRV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR15MB3672.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199015)(186003)(38100700002)(478600001)(91956017)(966005)(66446008)(9686003)(6486002)(2906002)(6506007)(4326008)(53546011)(66946007)(5660300002)(66556008)(76116006)(66476007)(64756008)(8676002)(6512007)(71200400001)(86362001)(8936002)(122000001)(83380400001)(36756003)(54906003)(316002)(41300700001)(38070700005)(33656002)(99710200001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f5OkCrRk8FUBdX6pUct05Bzl25GJvwig0hF14HEVjh5S2kClkWq0xuCS5wE3?=
 =?us-ascii?Q?MJO9xnJ7OixV4TBFb0PvAL1lcTBKEFcyxZvPbFXiYbGo3C3mGQ6NKqCxMICM?=
 =?us-ascii?Q?L99OWkXgWrc+0f2Gv2oRHmmw0SrK5wPh+klkzHJLRN8H3cdnlMJmw1sihC50?=
 =?us-ascii?Q?yfOrjh/RNPuwCoYZ8OhrtesaZ7/CP/OlwHwEGFlKOy756c0heJVYQUVijbjh?=
 =?us-ascii?Q?RAQvOU0W0gWZtmzmiI+5qldoo+c8G/WyxE1wRMBd6AmPakjvfXmw4NDnHKkn?=
 =?us-ascii?Q?68QZIpDw2TKS6qLVddu64BVm0C38au25eSzzLql4ULZvoMzOuOR3yH5sK+eU?=
 =?us-ascii?Q?oYdcuScAwJtby/p5JZt9UubkBE0EX8Jc6EvfVuQTNiSlguxkwfkzJHjTNMkE?=
 =?us-ascii?Q?WZ/rDTKXg8kxFZLZfpMtywkXBT3/rmRqN6WR7KquCGwH3uFTw/OVMneq5gSZ?=
 =?us-ascii?Q?v/WaKF7JjAPHdngdiNudlKnFEe3QmzxG5+PlBuOI8Chrh9PyeQkH+UuKDCGP?=
 =?us-ascii?Q?6r8jrsun0MblML1swwEi6pIUJA1FUTJB2phrYpZHyMtqtR81WyFphV15KcG6?=
 =?us-ascii?Q?GQ8EJuA+lDL1+SCM17XEsg9mw56mLrniUrY1290XUj8Ivb7z2tJz7+4m34n+?=
 =?us-ascii?Q?sv4aDvOgKugcU3Nzym/sC5bkNfjwk85mE9nYUgRtpcc303qDARCOcK8JOkH9?=
 =?us-ascii?Q?+K2a8GSI9hLMNNR2tLGfsV4BGGYIC+Z8xGuvQXWzFVukQRZD5pRnLnPIx2lQ?=
 =?us-ascii?Q?MlHHd7flgE6NiWfNhwz8u/TGUiQ4x5sN/b2CcfvcDaE8kfXkqpbdTKssAg0Q?=
 =?us-ascii?Q?q00+MMFKjAAwWpqIwWEQ7TuxEQX3WrFU4qgLJoVQ6hX9+j595xlWBz3rJIzg?=
 =?us-ascii?Q?IkBi8I006sMTUvQrhekIdf0MCA1EcCaHw7IFjLFT9FL3MzZv8+X0TLcHzaA5?=
 =?us-ascii?Q?EmS4ZasDuz+/OewbgYNHBn8pz89wbe94HzACRfDwNHRLAOUP0XoyrJ9i9dx5?=
 =?us-ascii?Q?EnZkrcN1p1gUJ0qSNCeQA/0RLA0KlLfjo7QmRE+ZSeCuLVdRs51MSGxa+KuV?=
 =?us-ascii?Q?nsRCo5GMTPBfsGxocv2/yyhHIwbkgVTR0LJUXl1LgsyZPn7H3x7s1CrMGUS/?=
 =?us-ascii?Q?B1KMqfreCjUtfjg8H7S+f3EFpXDdOYQtElaxQHWnLH1wweOig54wFdG1UIlf?=
 =?us-ascii?Q?TZ3COyN2JMD8ZIryoFDspjV88fJFN4rxF5fuqSSUozSItRC/EdmtYR37mt9P?=
 =?us-ascii?Q?U2L9+HqKjPlNb3nEVcpNTvHSH2kfqhr4hLCYYNrMl+HzLBfGxniLT4wJ46Ud?=
 =?us-ascii?Q?HaAbBBU9E2mTzm72v3urLa6gfldhISu4YnDGNkrU822gqNDPClMHH7pAb6nN?=
 =?us-ascii?Q?j0oTTZ4mXMUtR4iGKuPS6JGx56HZwRTh8fzBZcSTcGPb4EgKF0glT+ojwsMh?=
 =?us-ascii?Q?5igNOkYJ36ro3uHRIxMT19Ottw8OLjEoAaZnY/Qa7cOIccN0TMYEqSyvFkMZ?=
 =?us-ascii?Q?IN/uULWNWFTtkq48G8tmQmDhZl6pDxJeEXkE4tPLLvXgh2MXjSWHs+EzJsl2?=
 =?us-ascii?Q?WSUwdHhhT1xYmNgt3TdX7gpWzpoN89Nr6GbfArDn93Fiav1ieHHZYtqTk6Y8?=
 =?us-ascii?Q?p830Xr+6UMSeST/ClIwA3y8=3D?=
Content-ID: <1C956C759F7931479950C56879FF4680@namprd15.prod.outlook.com>
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR15MB3672.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea76d8f-ac68-4da1-cbde-08dac442f53e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2022 00:15:08.7609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u/wa/F7APRzmqFphfxlXovyA5Z5YYLCjLOSUYbXCNwhr0+295IdHtMKaTsq3IPvvvnoWrRfoQgTzQC5a8q4k3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR15MB5269
X-Proofpoint-ORIG-GUID: fKZabRaKLB32Sx6WbLbdDsY121vlCWjJ
X-Proofpoint-GUID: fKZabRaKLB32Sx6WbLbdDsY121vlCWjJ
X-Proofpoint-UnRewURL: 10 URL's were un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_11,2022-11-11_01,2022-06-22_01
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On Nov 7, 2022, at 4:15 PM,
 syzbot <syzbot+40642be9b7e0bb28e0df@syzkaller.appspotmail.com>
 wrote: > > !| > This Message Is From an [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [67.231.145.42 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [67.231.145.42 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oteB6-0007bc-Ni
Subject: Re: [f2fs-dev] [syzbot] INFO: trying to register non-static key in
 f2fs_handle_error
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
Reply-To: Nick Terrell <terrelln@meta.com>
Cc: "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



> On Nov 7, 2022, at 4:15 PM, syzbot <syzbot+40642be9b7e0bb28e0df@syzkaller.appspotmail.com> wrote:
> 
> !-------------------------------------------------------------------|
>  This Message Is From an External Sender
> 
> |-------------------------------------------------------------------!
> 
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    f0c4d9fc9cc9 Linux 6.1-rc4
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=15e494fe880000  
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ff27f0c8b406726e  
> dashboard link: https://syzkaller.appspot.com/bug?extid=40642be9b7e0bb28e0df  
> compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10822271880000  
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14f4cd51880000  
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/92c7e839ac32/disk-f0c4d9fc.raw.xz  
> vmlinux: https://storage.googleapis.com/syzbot-assets/b7bedbc08fb4/vmlinux-f0c4d9fc.xz  
> kernel image: https://storage.googleapis.com/syzbot-assets/3fe25e2dfdb7/Image-f0c4d9fc.gz.xz  
> mounted in repro #1: https://storage.googleapis.com/syzbot-assets/1f9d740f89a9/mount_1.gz  
> mounted in repro #2: https://storage.googleapis.com/syzbot-assets/6c6db4f39192/mount_2.gz  
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+40642be9b7e0bb28e0df@syzkaller.appspotmail.com
> 
> F2FS-fs (loop0): Invalid log_blocksize (16), supports only 12
> F2FS-fs (loop0): Can't find valid F2FS filesystem in 1th superblock
> F2FS-fs (loop0): inaccessible inode: 2, run fsck to repair
> INFO: trying to register non-static key.
> The code is fine but needs lockdep annotation, or maybe
> you didn't initialize this object before use?
> turning off the locking correctness validator.
> CPU: 1 PID: 3141 Comm: syz-executor147 Not tainted 6.1.0-rc4-syzkaller-31833-gf0c4d9fc9cc9 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/30/2022
> Call trace:
> dump_backtrace+0x1c4/0x1f0 arch/arm64/kernel/stacktrace.c:156
> show_stack+0x2c/0x54 arch/arm64/kernel/stacktrace.c:163
> __dump_stack lib/dump_stack.c:88 [inline]
> dump_stack_lvl+0x104/0x16c lib/dump_stack.c:106
> dump_stack+0x1c/0x58 lib/dump_stack.c:113
> assign_lock_key+0x134/0x140 kernel/locking/lockdep.c:981
> register_lock_class+0xc4/0x2f8 kernel/locking/lockdep.c:1294
> __lock_acquire+0xa8/0x3084 kernel/locking/lockdep.c:4934
> lock_acquire+0x100/0x1f8 kernel/locking/lockdep.c:5668
> __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
> _raw_spin_lock+0x54/0x6c kernel/locking/spinlock.c:154
> spin_lock include/linux/spinlock.h:350 [inline]
> f2fs_save_errors fs/f2fs/super.c:3868 [inline]
> f2fs_handle_error+0x38/0x17c fs/f2fs/super.c:3896
> f2fs_iget+0x138/0x538 fs/f2fs/inode.c:516
> f2fs_fill_super+0x10fc/0x1e90 fs/f2fs/super.c:4222
> mount_bdev+0x1b8/0x210 fs/super.c:1401
> f2fs_mount+0x44/0x58 fs/f2fs/super.c:4580
> legacy_get_tree+0x30/0x74 fs/fs_context.c:610
> vfs_get_tree+0x40/0x140 fs/super.c:1531
> do_new_mount+0x1dc/0x4e4 fs/namespace.c:3040
> path_mount+0x358/0x890 fs/namespace.c:3370
> do_mount fs/namespace.c:3383 [inline]
> __do_sys_mount fs/namespace.c:3591 [inline]
> __se_sys_mount fs/namespace.c:3568 [inline]
> __arm64_sys_mount+0x2c4/0x3c4 fs/namespace.c:3568
> __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
> invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
> el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
> do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
> el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
> el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
> el0t_64_sync+0x18c/0x190 arch/arm64/kernel/entry.S:581
> F2FS-fs (loop0): Failed to read F2FS meta data inode
> loop0: detected capacity change from 0 to 8192
> REISERFS warning:  read_super_block: reiserfs filesystem is deprecated and scheduled to be removed from the kernel in 2025
> REISERFS (device loop0): found reiserfs format "3.6" with non-standard journal
> REISERFS (device loop0): using ordered data mode
> reiserfs: using flush barriers
> REISERFS (device loop0): journal params: device loop0, size 512, journal first block 18, max trans len 256, max batch 225, max commit age 30, max trans age 30
> REISERFS (device loop0): checking transaction log (loop0)
> REISERFS (device loop0): Using rupasov hash to sort names
> REISERFS warning (device loop0): jdm-20006 create_privroot: xattrs/ACLs enabled and couldn't find/create .reiserfs_priv. Failing mount.

Not quite sure why I am CC'd here, I don't see anything related to zstd or compression in this stack.
Just want to check that it is likely unrelated, and that I'm not missing something.

Best,
Nick Terrell



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
