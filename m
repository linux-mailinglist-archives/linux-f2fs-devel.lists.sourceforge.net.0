Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKIiL4OtoGlulgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 21:30:59 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B49431AF257
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 21:30:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3jjeg/MyCyMGQDSuf75O0o1WJwaRby0gvc8GP4cX0M=; b=iGUaYdsgNcbuYRqrVmZgfXh1rQ
	fubHnII/JCSUPCKncM71bAoftDTNDN7Dn9yGD1ecAK55cdxuef53cb6u0laJI6pEMHEnTDXgNtAzV
	Qi3SqGXUzv1Q5P1c6kjeWsNXZLMQkoZJTECDB2607FRognjoInlJB+msKcr6fDiOlcXQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvi0b-0001tU-1t;
	Thu, 26 Feb 2026 20:30:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Slava.Dubeyko@ibm.com>) id 1vvi0Z-0001si-6l;
 Thu, 26 Feb 2026 20:30:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:CC:To:From:
 Sender:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TqZOgJUo5w0naj9n652qC/qV6uDX2lxzr746Qlg35vM=; b=DSVJVppiwODMZlyCpXQycmcWLb
 1zx7RrpeQUlDaDHUKu6ZW/aD9F7O+KgxMxdc/hsE+5YO/usk7mlJ1mVxcjo7tDTKC7wcfoge1HEj7
 wKOBORNtymIZVonU/iTcSPo62NpD+26RDFodAs9nsgmVvUYKM1c9ivHp+pjUczRwBfJk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TqZOgJUo5w0naj9n652qC/qV6uDX2lxzr746Qlg35vM=; b=E6/jKis2A4DcTJdhe9iVYrW6Dj
 OPUwIMeb2I4sgZT91Ic+nr/HSMSLTVckkRA/Q2z/+w5n7QyRP3zbCeu+MrHNsnUV4CGcdsEL5kvXP
 PnUKkCCYnLXVdtt1YakZq+ojkfejmjhxNvH8QmbAd4JlMV3VkyLpv+RD8/8NnprhgllA=;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvi0W-0003KN-Gs; Thu, 26 Feb 2026 20:30:49 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61QFUwZw2615756; Thu, 26 Feb 2026 19:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 pp1; bh=TqZOgJUo5w0naj9n652qC/qV6uDX2lxzr746Qlg35vM=; b=SlM6mN2a
 +sr6igf+TYgFKuFUN9zToyzg8PMvmr3qaVbgYGi4Ycr/KDxvZjOZB/tLShw4J/7s
 v3WXPPw7x+l9T+DGPwA31/RiLDh+WvkOWL3RA8V/QM6Qjh7zpJv3CO+3kfAnWSHQ
 Hjdcpv4u/X2z8SVqiCZYcKgYBhsIxNwzQBEncI0B9m+0LZbJL7AmBrxGtIS2fkU9
 kBvCoIvN61Aj+mEFMtl+37IJ2fsvcMi8JY13QNWKGWjk3kUFVDMzPQIqT2jF0kbe
 uOtYIzEvj2gOkCgikpMBUFoNSVi6A/k+kxAeJVEqEHtA26WicfBJgbhijGZd9bJ4
 1BFG7anaE9M9PA==
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azon11010000.outbound.protection.outlook.com [52.101.56.0])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4728rd4-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 26 Feb 2026 19:35:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YqrFKSac9+zTKyMMjgIHKWwQmuq+buAGUzfKNMkTYns9BTNak9Eks2+mS7vLO+UM1GxfO+g4jldZVdnFxWRijFe2qEekFziUFU6E57cE2zBYhPUQrmVPtl02h2ylqtx6g9ujJcHJSqujoj0Mm4dqLb7FkJWCWf376UZ/5QG2EPlxNzaeqGMUzS4e07dh/QnEjAwt7hQFG1vG0n7IZeMAyjJ48fPvkBpVqEUPse096XgOVZdTx6elu4TyX0+vo376yjTQt/nbbcjK0/jyEBVk5hqW027vxB+7YaoTPyVa0YOjgREbKKUqbDyg02wpzOiNruK8O/WCs+B9xXbQY8qVug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqZOgJUo5w0naj9n652qC/qV6uDX2lxzr746Qlg35vM=;
 b=h2pjN9oqBIBBfQ7B30RP/tHkoEt9J6ib+fVZyHW2KmEBwYkG5CTQ6XbfuwNWIUCn90FpefwRAtvGSkVV3UN0YNKIGX1zXGfvqQ/fuNL1jwLmd8UkoC4/BDH9eK1tRN2fTo2S9HMjT2YkBrCmp2QU3MO4XMzwLrUMW3QoFbx4nGF29v5hQCCCf0NjsHui4gYmw+ykEjXU4gmXryXiXfTh8dUnimpyfqaLq0K2KxMSsZqp1uUBl9aJujuBG5tD3IxgRdkdpJwFovkZ2bsxjAb96vftEX/9ZYFTCR/+9ye0TQhUXSjqbMQh1LFYmclA489uuveKSPV70rK5CrYPFSNYvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from SA1PR15MB5819.namprd15.prod.outlook.com (2603:10b6:806:338::8)
 by MW4PR15MB5249.namprd15.prod.outlook.com (2603:10b6:303:188::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Thu, 26 Feb
 2026 19:35:23 +0000
Received: from SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539]) by SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539%7]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 19:35:23 +0000
To: "david@kernel.org" <david@kernel.org>, "namhyung@kernel.org"
 <namhyung@kernel.org>, "oleg@redhat.com" <oleg@redhat.com>,
 "anna@kernel.org" <anna@kernel.org>, "ms@dev.tdt.de" <ms@dev.tdt.de>,
 "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
 "jack@suse.cz" <jack@suse.cz>, "ebiggers@kernel.org" <ebiggers@kernel.org>,
 Ondrej Mosnacek <omosnace@redhat.com>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, "casey@schaufler-ca.com" <casey@schaufler-ca.com>,
 "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>,
 "miklos@szeredi.hu" <miklos@szeredi.hu>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "john.johansen@canonical.com"
 <john.johansen@canonical.com>, "amir73il@gmail.com" <amir73il@gmail.com>,
 "slava@dubeyko.com" <slava@dubeyko.com>, "willy@infradead.org"
 <willy@infradead.org>, "tytso@mit.edu" <tytso@mit.edu>,
 "asmadeus@codewreck.org" <asmadeus@codewreck.org>, "jth@kernel.org"
 <jth@kernel.org>, "shaggy@kernel.org" <shaggy@kernel.org>,
 "serge@hallyn.com" <serge@hallyn.com>,
 "jaharkes@cs.cmu.edu" <jaharkes@cs.cmu.edu>,
 "jlayton@kernel.org" <jlayton@kernel.org>, "trondmy@kernel.org"
 <trondmy@kernel.org>, "jolsa@kernel.org" <jolsa@kernel.org>,
 "ericvh@kernel.org" <ericvh@kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "willemb@google.com" <willemb@google.com>, "aivazian.tigran@gmail.com"
 <aivazian.tigran@gmail.com>, "hubcap@omnibond.com" <hubcap@omnibond.com>,
 "muchun.song@linux.dev" <muchun.song@linux.dev>, "sfrench@samba.org"
 <sfrench@samba.org>, "neil@brown.name" <neil@brown.name>,
 "jmorris@namei.org" <jmorris@namei.org>,
 "jlbec@evilplan.org" <jlbec@evilplan.org>,
 "chuck.lever@oracle.com" <chuck.lever@oracle.com>,
 "ronniesahlberg@gmail.com" <ronniesahlberg@gmail.com>,
 "lucho@ionkov.net" <lucho@ionkov.net>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "raven@themaw.net"
 <raven@themaw.net>, Alex Markuze <amarkuze@redhat.com>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>, "alexander.deucher@amd.com"
 <alexander.deucher@amd.com>, "mathieu.desnoyers@efficios.com"
 <mathieu.desnoyers@efficios.com>, "horms@kernel.org" <horms@kernel.org>,
 "tom@talpey.com" <tom@talpey.com>, "mark@fasheh.com" <mark@fasheh.com>,
 "mikulas@artax.karlin.mff.cuni.cz" <mikulas@artax.karlin.mff.cuni.cz>,
 "djwong@kernel.org" <djwong@kernel.org>, "edumazet@google.com"
 <edumazet@google.com>, Olga Kornievskaia <okorniev@redhat.com>,
 "bharathsm@microsoft.com" <bharathsm@microsoft.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>, "osalvador@suse.de"
 <osalvador@suse.de>, "peterz@infradead.org" <peterz@infradead.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "pc@manguebit.org"
 <pc@manguebit.org>, "martin@omnibond.com" <martin@omnibond.com>,
 "naohiro.aota@wdc.com" <naohiro.aota@wdc.com>, "frank.li@vivo.com"
 <frank.li@vivo.com>, "dsterba@suse.com" <dsterba@suse.com>,
 "zohar@linux.ibm.com" <zohar@linux.ibm.com>, "code@tyhicks.com"
 <code@tyhicks.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "kuniyu@google.com" <kuniyu@google.com>,
 "nico@fluxnic.net" <nico@fluxnic.net>, "jack@suse.com" <jack@suse.com>,
 "dlemoal@kernel.org" <dlemoal@kernel.org>, "viro@zeniv.linux.org.uk"
 <viro@zeniv.linux.org.uk>, "stephen.smalley.work@gmail.com"
 <stephen.smalley.work@gmail.com>, "salah.triki@gmail.com"
 <salah.triki@gmail.com>, David Howells <dhowells@redhat.com>,
 "paul@paul-moore.com" <paul@paul-moore.com>, "luisbg@kernel.org"
 <luisbg@kernel.org>, "irogers@google.com" <irogers@google.com>,
 "acme@kernel.org" <acme@kernel.org>, "richard@nod.at" <richard@nod.at>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, "idryomov@gmail.com"
 <idryomov@gmail.com>, "joseph.qi@linux.alibaba.com"
 <joseph.qi@linux.alibaba.com>, "al@alarsen.net" <al@alarsen.net>,
 "james.clark@linaro.org" <james.clark@linaro.org>,
 "dmitry.kasatkin@gmail.com" <dmitry.kasatkin@gmail.com>,
 "roberto.sassu@huawei.com" <roberto.sassu@huawei.com>,
 "konishi.ryusuke@gmail.com" <konishi.ryusuke@gmail.com>,
 "sprasad@microsoft.com" <sprasad@microsoft.com>, "jaegeuk@kernel.org"
 <jaegeuk@kernel.org>, "linux_oss@crudebyte.com" <linux_oss@crudebyte.com>,
 "brauner@kernel.org" <brauner@kernel.org>, "Dai.Ngo@oracle.com"
 <Dai.Ngo@oracle.com>,
 "eric.snowberg@oracle.com" <eric.snowberg@oracle.com>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>, "chao@kernel.org"
 <chao@kernel.org>, "wufan@kernel.org" <wufan@kernel.org>, "coda@cs.cmu.edu"
 <coda@cs.cmu.edu>, Ingo Molnar <mingo@redhat.com>, "alex.aring@gmail.com"
 <alex.aring@gmail.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "chengzhihao1@huawei.com" <chengzhihao1@huawei.com>, Paolo Abeni
 <pabeni@redhat.com>, "marc.dionne@auristor.com" <marc.dionne@auristor.com>,
 "almaz.alexandrovich@paragon-software.com"
 <almaz.alexandrovich@paragon-software.com>, "davem@davemloft.net"
 <davem@davemloft.net>, "hch@infradead.org" <hch@infradead.org>
Thread-Topic: [EXTERNAL] [PATCH 34/61] hfsplus: update format strings for u64
 i_ino
Thread-Index: AQHcpz3KaJJHUfFDvEGTnwq9cpElgrWVX5SA
Date: Thu, 26 Feb 2026 19:35:23 +0000
Message-ID: <a7a46e6253a75dd2bed88061caedbe8dc6f6f96c.camel@ibm.com>
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
 <20260226-iino-u64-v1-34-ccceff366db9@kernel.org>
In-Reply-To: <20260226-iino-u64-v1-34-ccceff366db9@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5819:EE_|MW4PR15MB5249:EE_
x-ms-office365-filtering-correlation-id: 10c0be15-aad3-40ca-ca0a-08de756e2f72
x-ld-processed: fcf67057-50c9-4ad4-98f3-ffca64add9e9,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016|38070700021|921020; 
x-microsoft-antispam-message-info: IeD8erDnrrOpY4hzImQApc2Gn1xDIQMmQ33hGhpqr/UEjBO7GE3R1/6/Rwuo9ARMHQN6YqthkkL+4K6zbLg1cy5HxnGU4uQGifX9IiXKreqTee4LEElF3zcNkYQFxk259QTZfaC+T3cNa2EEWJJGl6/AS0TCogyTreyHxlabXeUTGKXOxMdY0c/EIaUQjFG9QE3VHu1xXrVdRNzqQ5LeANLqbPMKVEIVMX2xWyzu+wjtmJLNwpOyg/u6VmRIPdm3Mz9vpyVHrcXFOV9olL+AkJy2zwpeZ6KAZb/Q2oHGLr2QM5cPjmZ/PFyibD4bLjB4kiFuLnvFgE/U5xdUb1S1687NRiG+ag1ydxICvE5gGUSBMM787CSWXE3kTCZVMA4hxKpWVY52G1cmpHIPPcU248orOZ8FYT1tQnttralxiV+iR6SPjMS+Xq/K5ikHSZURe02jkDLl/GW70Tje/D4ZiehJgjcJcMk4lEDN7b02erxybU1d4+hN21Lt9eYSMOjMlkwrD6yPKOjYB5RQEwF6ie0PuzF5JWC8x8snUFuZZXLWqIWV6AXTRcO2jA0JhziZceXbPyRBSSzXCKidaWpWOy3wJrg6S31SrfCHDfGnYXID+H6Io/5HqWMqnhI5xNavTjaet+NO2Q8H9yz2YYbBPhgrIvItrUsfqArdZ6M2WZjKp2/bLrc97rzIXS3Njz17/O8+AIGlvH+FnrXBu+9deH5bLtUk3iDtVTw6heIpNIpVhBdiLl3A8m4I+4V1mFHPBHhdWS5zvHB3BRen2ZE7kcGeiC5jwtVttG+PbOZx2b/pGZ7EamFX+dxFFsPeJf3j
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5819.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFVUb1lXb0JRVmI0QWVpdUh1UjRZY2dmUnVUVmVtNGRxc3VXd2hjZnVTR3ZG?=
 =?utf-8?B?UnVZKzY0aXpCanBJUnBrTDVZUFRSNXpMdy8zUG8rem93cXNkczMvV1JjTXly?=
 =?utf-8?B?NlJna0FPcEtkL20xSVlrZjZvbENzN25tS1c5SkVYU3dtNnhoNFN0eHJlaklZ?=
 =?utf-8?B?OWNLYnlKM0lrT0hzaWJqcTI3TkllZ3pQeWNKa2s0VHQ0Ry91dnkweWhHL2c0?=
 =?utf-8?B?ODE1M2xQV1Noay9EaEs3Ky8vcXJpMkI4YXVVdmRyZU9CK1hzbm5PVHp4Uno0?=
 =?utf-8?B?LzdHSE1YeCtaM2ovcmdXZkh2L0VtM3J2dko0bFNqeE1jNHNnWmlMYk5CVG9C?=
 =?utf-8?B?dW95d2RjLzh0VG1iSTJTZHgzZzlPejBkYzdYNEJEYzJPd0RTejEvcTd2Q2xr?=
 =?utf-8?B?eG9zMURyUVphTWNTTzQ1WjVOZ2FPdk9qKzFRZUpQSUNFdEc4MUM0alBHd0FK?=
 =?utf-8?B?ZFpDUW04WFd4bDBzaWhuQlRXc0Z3Uzh0ZmtKNDEzS0FUSzJKblE0VlpMU2VO?=
 =?utf-8?B?TlJvUG5PTDJqTjVoOWtSNUExSVo0c3RCYzZnVmp5K1lQL3RUK2VkdFlwZ3ha?=
 =?utf-8?B?KzBjamMrZmFPNE5vTC81anlIdFprMmhydFJ0emFPTldJUUFHemw5UVlWei9N?=
 =?utf-8?B?Y0RZeWU5dmFkcjNPSlRML2phTHBWMGU0M25jMHNteEJ0dXFySzNDTzRtc2Nj?=
 =?utf-8?B?OEt6SWhnUGpTNUNTTDRlVkJqOWhIU1cxMlhJUWViSlFRTmNvZzlYM3k1RU1K?=
 =?utf-8?B?c25GdWZ6dTZFSjFEVzdQdm5WNzdYY0IwNTRrN0Q0K3NBSnZZWEhuQXMrTmdW?=
 =?utf-8?B?UlRBa1lRaHRaZzA3eDM3WXdvOU54R2JTdHFMUzArZ0w1SnhZRmxqMjVlOHJ2?=
 =?utf-8?B?Njk5Z0xGbWFEVUZoTjF0N3VaZFhYZHEvbUxuTC9MNnFjYkZBNFNlQTJvR2Np?=
 =?utf-8?B?Nm82YktBT1JWTG1oTElBL0syWC9OSjJBOTV4UWdCZW5iMEVWSUZtT2RPdWF3?=
 =?utf-8?B?YjRxdFJzMnV4UjhOc09Vd1h0bTNpQVpDN3AyNWFHQXpGOVYrZmlmVFlxTmgx?=
 =?utf-8?B?WkVvTXBlRzNXek5FU1BrNVhtbUIyRlZEejhaRjJvQ1NJckhOa1lHM1ZTTnJO?=
 =?utf-8?B?V3VFTDlXS3pJRC8yRGFmcmcrOGJJZzZaWmJFY09JZzJETUxtTCtYVE9od0Q5?=
 =?utf-8?B?ZTFUYmw1RVVJdGhQcjEzUSsvM1RONGlLaGh1SUtDZWpQN1Q1RytrUUR0Nkpu?=
 =?utf-8?B?NSs0VXppTmd1QWJvL1lYL2RIQ0pxblV6ZGMyZU5SNVZJaDdsUE12UnJYb3FF?=
 =?utf-8?B?WFEzeEZGOEZMbzY2akt4dFN3ZUtZbFY0MFU4Qi9zV0hJUW9nanloY3RnOW9Z?=
 =?utf-8?B?aWVnUHo0M0g0N0ZHTmRCLytDZXlhK1ZvMzZ3cmN3L3B5SDNyelp0SXBHTzRj?=
 =?utf-8?B?VzF5R1BQVDdjSlZQSFdjaWRrYjF1SVJoZEN1K1dtaE1lRSt3OVFQbWMxQjlL?=
 =?utf-8?B?SGUxRU5pRGYxMlBIRG5FU044N1V6dmlJQ1NKRXJWSUhWRzNaUWh1T055MVBi?=
 =?utf-8?B?bGdPK2QraVQ0UmZCdTMxTkJQVG0wVW5KNENRZjExWGZDMzFTQ0dRQ0JUMDZj?=
 =?utf-8?B?cVcyWmJYRWlVQmREMnJQSkVCZmlUMEJpVDg0K2NLUWU4OXhYTXpQOWJ2elIy?=
 =?utf-8?B?UlVrVmpMVlBrOUtLUlRlVDg1UDl2TUh4ZThPbVRzWUlhRU9waXVmWkdJOTFT?=
 =?utf-8?B?ci9tTlhrSU02QXJPeGg5cnREblJBajR3djZtZDNNRkJpNUpRbXE3RE5ic3Mz?=
 =?utf-8?B?RjJlM3VwMTdtRnFCdCt6eXZzZE9HZWdLUWpCYVd0K1V2L3o4NzNJeVVTNDhO?=
 =?utf-8?B?dEFRWnJtRXdkeDFZRWppcjVsTXU2bXBsdUlFMXAxZEUwRGtYejNJLzFzRGZl?=
 =?utf-8?B?UzJyZE9hbEZRVG8zSUhtV1lvbVBBWGZsTnQ4c2VtVGN0T3BhV0htYW5uQm02?=
 =?utf-8?B?U29rbStvNTEyTEpzZ2JrZzEvZ0tQbFRiZFJRdUE0bnVtODNNU0Vla0o2K0t0?=
 =?utf-8?B?RTUwallvSEZjdGU2ZnVoSkFBM0dHeVgyaEJJV3BJRTJsWk5pa2w3ZHNCa05a?=
 =?utf-8?B?ampOeEIrc2R6NkxnNlNmYVdPQXBQYWVOaGJZNWVXdFFWL0hKc1pBWGxQMXBJ?=
 =?utf-8?B?OHIyYUdxcFpuVVYzclRaeU9HeXNURUw5dVc0L3ptWHpYWEJhbXQ4bDIvOWta?=
 =?utf-8?B?N1BPQnpVeGtVRTVqK3JrNjdrWW81UHliZDFDenlQZGxTNTh5WVdzQnBOWmhM?=
 =?utf-8?B?TEJlZWE1eWhjUHhUSWRHSERyYWFTZk5WQW9vMWY0S29WUTl6VUEwOThpTXRs?=
 =?utf-8?Q?lBFMYdCW0Ar6gsuj7oSnRuAqPlEljGrIO0BsO?=
Content-ID: <788EA72B6A7BC0479F1D2F30F9DB3213@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5819.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c0be15-aad3-40ca-ca0a-08de756e2f72
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 19:35:23.5734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kjXw+2jm9STzGNY9nMBhYbMJxzAa+xMOmIZmM1q+3yzdkoEghvBGZyg5KRj/sY2u4UolDn1UrTOGjm+gHaYnFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR15MB5249
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: cX87CUbbAEl88Rx6-vKjzh_zTCF4-1-P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE3NSBTYWx0ZWRfX78tuqKaUT80C
 j04fN5Bxyv46V6LXStCSmhclTcanq6QXZGO2nFgVbQn3Flx8y6+awalddRH1HoqZQGWbptQbtzT
 1bdFkVksBTAtd/fdJQ/vL7yhi0reiyhRQ+XAuyt8V504nQ5k/FBWJZqvmw9MXsxjyA97DXD+c3r
 3fLCmQbMj/z+TkK5Uw9ys90MjA4E3oWvDn7C35idxnDOKSvljrbAtaFPXXZ/etI5zzwKKkoWZgw
 lUjTG68mi1+/gbFTHTS2fLQOozochPM6xphE4FFINhELRwaKSLdh/ywrd8hSyXyDkb6kIhRREbC
 LY63qwmrai0eb+Y5Rw1xTEBnwCJw9KfTLt22IO0hWFKbkxuzL679gSWlFO/COGEH7zxY7+zwV7s
 XI+EN9Oq/SCxHJDMrr6TIYtEg34KrWq5ZGKb+G8oXdI7UdKeYUXdsrEKa+G4irrJ1ZB1FTnFCUG
 jH9gKvA239hmcOUfNyw==
X-Authority-Analysis: v=2.4 cv=R7wO2NRX c=1 sm=1 tr=0 ts=69a0a08e cx=c_pps
 a=EtrKi/+kAVY73poqiPL3VQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=wCmvBT1CAAAA:8
 a=YkTVa5DhDZSreRIMWfMA:9 a=QEXdDO2ut3YA:10 a=6z96SAwNL0f8klobD5od:22
X-Proofpoint-GUID: stTDjlqIIH2haKPcQMHKmmNVzUNQtv18
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602260175
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 2026-02-26 at 10:55 -0500,
 Jeff Layton wrote: > Update
 format strings and local variable types in hfsplus for the > i_ino type change
 from unsigned long to u64. > > Signed-off-by: Jeff Layton [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [148.163.156.1 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vvi0W-0003KN-Gs
Subject: Re: [f2fs-dev] [PATCH 34/61] hfsplus: update format strings for u64
 i_ino
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
From: Viacheslav Dubeyko via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
Cc: "nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
 "jfs-discussion@lists.sourceforge.net"
 <jfs-discussion@lists.sourceforge.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-unionfs@vger.kernel.org" <linux-unionfs@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
 "linux-x25@vger.kernel.org" <linux-x25@vger.kernel.org>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "codalist@coda.cs.cmu.edu" <codalist@coda.cs.cmu.edu>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "devel@lists.orangefs.org" <devel@lists.orangefs.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "autofs@vger.kernel.org" <autofs@vger.kernel.org>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "ecryptfs@vger.kernel.org" <ecryptfs@vger.kernel.org>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "ocfs2-devel@lists.linux.dev" <ocfs2-devel@lists.linux.dev>,
 "linux-fscrypt@vger.kernel.org" <linux-fscrypt@vger.kernel.org>,
 "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "fsverity@lists.linux.dev" <fsverity@lists.linux.dev>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "v9fs@lists.linux.dev" <v9fs@lists.linux.dev>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "netfs@lists.linux.dev" <netfs@lists.linux.dev>,
 "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
 "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,dev.tdt.de,linux.intel.com,suse.cz,arm.com,schaufler-ca.com,physik.fu-berlin.de,szeredi.hu,linaro.org,canonical.com,gmail.com,dubeyko.com,infradead.org,mit.edu,codewreck.org,hallyn.com,cs.cmu.edu,ffwll.ch,google.com,omnibond.com,linux.dev,samba.org,brown.name,namei.org,evilplan.org,oracle.com,ionkov.net,intel.com,themaw.net,amd.com,efficios.com,talpey.com,fasheh.com,artax.karlin.mff.cuni.cz,microsoft.com,suse.de,manguebit.org,wdc.com,vivo.com,suse.com,linux.ibm.com,tyhicks.com,fluxnic.net,zeniv.linux.org.uk,paul-moore.com,nod.at,goodmis.org,linux.alibaba.com,alarsen.net,huawei.com,crudebyte.com,dilger.ca,auristor.com,paragon-software.com,davemloft.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,ibm.com:s=pp1];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,ibm.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,dubeyko.com:email];
	RCPT_COUNT_GT_50(0.00)[146];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[Slava.Dubeyko@ibm.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B49431AF257
X-Rspamd-Action: no action

On Thu, 2026-02-26 at 10:55 -0500, Jeff Layton wrote:
> Update format strings and local variable types in hfsplus for the
> i_ino type change from unsigned long to u64.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/hfsplus/attributes.c | 10 +++++-----
>  fs/hfsplus/catalog.c    |  2 +-
>  fs/hfsplus/dir.c        |  6 +++---
>  fs/hfsplus/extents.c    |  6 +++---
>  fs/hfsplus/inode.c      |  8 ++++----
>  fs/hfsplus/super.c      |  6 +++---
>  fs/hfsplus/xattr.c      | 10 +++++-----
>  7 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/fs/hfsplus/attributes.c b/fs/hfsplus/attributes.c
> index 4b79cd606276e31c20fa18ef3a099596f50e8a0f..e3d8fe1e7e75d9895c4ae30810a334412b4c105a 100644
> --- a/fs/hfsplus/attributes.c
> +++ b/fs/hfsplus/attributes.c
> @@ -203,7 +203,7 @@ int hfsplus_create_attr_nolock(struct inode *inode, const char *name,
>  	int entry_size;
>  	int err;
>  
> -	hfs_dbg("name %s, ino %ld\n",
> +	hfs_dbg("name %s, ino %lld\n",
>  		name ? name : NULL, inode->i_ino);
>  
>  	if (name) {
> @@ -255,7 +255,7 @@ int hfsplus_create_attr(struct inode *inode,
>  	hfsplus_attr_entry *entry_ptr;
>  	int err;
>  
> -	hfs_dbg("name %s, ino %ld\n",
> +	hfs_dbg("name %s, ino %lld\n",
>  		name ? name : NULL, inode->i_ino);
>  
>  	if (!HFSPLUS_SB(sb)->attr_tree) {
> @@ -337,7 +337,7 @@ int hfsplus_delete_attr_nolock(struct inode *inode, const char *name,
>  	struct super_block *sb = inode->i_sb;
>  	int err;
>  
> -	hfs_dbg("name %s, ino %ld\n",
> +	hfs_dbg("name %s, ino %lld\n",
>  		name ? name : NULL, inode->i_ino);
>  
>  	if (name) {
> @@ -367,7 +367,7 @@ int hfsplus_delete_attr(struct inode *inode, const char *name)
>  	struct super_block *sb = inode->i_sb;
>  	struct hfs_find_data fd;
>  
> -	hfs_dbg("name %s, ino %ld\n",
> +	hfs_dbg("name %s, ino %lld\n",
>  		name ? name : NULL, inode->i_ino);
>  
>  	if (!HFSPLUS_SB(sb)->attr_tree) {
> @@ -436,7 +436,7 @@ int hfsplus_replace_attr(struct inode *inode,
>  	hfsplus_attr_entry *entry_ptr;
>  	int err = 0;
>  
> -	hfs_dbg("name %s, ino %ld\n",
> +	hfs_dbg("name %s, ino %lld\n",
>  		name ? name : NULL, inode->i_ino);
>  
>  	if (!HFSPLUS_SB(sb)->attr_tree) {
> diff --git a/fs/hfsplus/catalog.c b/fs/hfsplus/catalog.c
> index 02c1eee4a4b86059ceaab7a7c68ab65adba6fa26..0e961e99b9856ab7d95da5d070b4fbce1e67ebde 100644
> --- a/fs/hfsplus/catalog.c
> +++ b/fs/hfsplus/catalog.c
> @@ -441,7 +441,7 @@ int hfsplus_rename_cat(u32 cnid,
>  	int entry_size, type;
>  	int err;
>  
> -	hfs_dbg("cnid %u - ino %lu, name %s - ino %lu, name %s\n",
> +	hfs_dbg("cnid %u - ino %llu, name %s - ino %llu, name %s\n",
>  		cnid, src_dir->i_ino, src_name->name,
>  		dst_dir->i_ino, dst_name->name);
>  	err = hfs_find_init(HFSPLUS_SB(sb)->cat_tree, &src_fd);
> diff --git a/fs/hfsplus/dir.c b/fs/hfsplus/dir.c
> index d559bf8625f853d50fd316d157cf8afe22069565..054f6da46033404bbbcf299beb5d8765495c0de3 100644
> --- a/fs/hfsplus/dir.c
> +++ b/fs/hfsplus/dir.c
> @@ -313,7 +313,7 @@ static int hfsplus_link(struct dentry *src_dentry, struct inode *dst_dir,
>  	if (!S_ISREG(inode->i_mode))
>  		return -EPERM;
>  
> -	hfs_dbg("src_dir->i_ino %lu, dst_dir->i_ino %lu, inode->i_ino %lu\n",
> +	hfs_dbg("src_dir->i_ino %llu, dst_dir->i_ino %llu, inode->i_ino %llu\n",
>  		src_dir->i_ino, dst_dir->i_ino, inode->i_ino);
>  
>  	mutex_lock(&sbi->vh_mutex);
> @@ -385,7 +385,7 @@ static int hfsplus_unlink(struct inode *dir, struct dentry *dentry)
>  	if (HFSPLUS_IS_RSRC(inode))
>  		return -EPERM;
>  
> -	hfs_dbg("dir->i_ino %lu, inode->i_ino %lu\n",
> +	hfs_dbg("dir->i_ino %llu, inode->i_ino %llu\n",
>  		dir->i_ino, inode->i_ino);
>  
>  	mutex_lock(&sbi->vh_mutex);
> @@ -393,7 +393,7 @@ static int hfsplus_unlink(struct inode *dir, struct dentry *dentry)
>  	if (inode->i_ino == cnid &&
>  	    atomic_read(&HFSPLUS_I(inode)->opencnt)) {
>  		str.name = name;
> -		str.len = sprintf(name, "temp%lu", inode->i_ino);
> +		str.len = sprintf(name, "temp%llu", inode->i_ino);
>  		res = hfsplus_rename_cat(inode->i_ino,
>  					 dir, &dentry->d_name,
>  					 sbi->hidden_dir, &str);
> diff --git a/fs/hfsplus/extents.c b/fs/hfsplus/extents.c
> index 8e886514d27f1e5d4d94be75142f197669e62234..474fde1a1653be6cf74b26e757c6d8a6f8d2906a 100644
> --- a/fs/hfsplus/extents.c
> +++ b/fs/hfsplus/extents.c
> @@ -275,7 +275,7 @@ int hfsplus_get_block(struct inode *inode, sector_t iblock,
>  	mutex_unlock(&hip->extents_lock);
>  
>  done:
> -	hfs_dbg("ino %lu, iblock %llu - dblock %u\n",
> +	hfs_dbg("ino %llu, iblock %llu - dblock %u\n",
>  		inode->i_ino, (long long)iblock, dblock);
>  
>  	mask = (1 << sbi->fs_shift) - 1;
> @@ -476,7 +476,7 @@ int hfsplus_file_extend(struct inode *inode, bool zeroout)
>  			goto out;
>  	}
>  
> -	hfs_dbg("ino %lu, start %u, len %u\n", inode->i_ino, start, len);
> +	hfs_dbg("ino %llu, start %u, len %u\n", inode->i_ino, start, len);
>  
>  	if (hip->alloc_blocks <= hip->first_blocks) {
>  		if (!hip->first_blocks) {
> @@ -545,7 +545,7 @@ void hfsplus_file_truncate(struct inode *inode)
>  	u32 alloc_cnt, blk_cnt, start;
>  	int res;
>  
> -	hfs_dbg("ino %lu, phys_size %llu -> i_size %llu\n",
> +	hfs_dbg("ino %llu, phys_size %llu -> i_size %llu\n",
>  		inode->i_ino, (long long)hip->phys_size, inode->i_size);
>  
>  	if (inode->i_size > hip->phys_size) {
> diff --git a/fs/hfsplus/inode.c b/fs/hfsplus/inode.c
> index 922ff41df042a83d47364f2d941c45dabda29afb..02be32dc6833dfdd767c407ec0263485d1a2c3c6 100644
> --- a/fs/hfsplus/inode.c
> +++ b/fs/hfsplus/inode.c
> @@ -230,7 +230,7 @@ static int hfsplus_get_perms(struct inode *inode,
>  		inode->i_flags &= ~S_APPEND;
>  	return 0;
>  bad_type:
> -	pr_err("invalid file type 0%04o for inode %lu\n", mode, inode->i_ino);
> +	pr_err("invalid file type 0%04o for inode %llu\n", mode, inode->i_ino);
>  	return -EIO;
>  }
>  
> @@ -328,7 +328,7 @@ int hfsplus_file_fsync(struct file *file, loff_t start, loff_t end,
>  	struct hfsplus_vh *vhdr = sbi->s_vhdr;
>  	int error = 0, error2;
>  
> -	hfs_dbg("inode->i_ino %lu, start %llu, end %llu\n",
> +	hfs_dbg("inode->i_ino %llu, start %llu, end %llu\n",
>  		inode->i_ino, start, end);
>  
>  	error = file_write_and_wait_range(file, start, end);
> @@ -639,7 +639,7 @@ int hfsplus_cat_write_inode(struct inode *inode)
>  	hfsplus_cat_entry entry;
>  	int res = 0;
>  
> -	hfs_dbg("inode->i_ino %lu\n", inode->i_ino);
> +	hfs_dbg("inode->i_ino %llu\n", inode->i_ino);
>  
>  	if (HFSPLUS_IS_RSRC(inode))
>  		main_inode = HFSPLUS_I(inode)->rsrc_inode;
> @@ -716,7 +716,7 @@ int hfsplus_cat_write_inode(struct inode *inode)
>  	if (!res) {
>  		res = hfs_btree_write(tree);
>  		if (res) {
> -			pr_err("b-tree write err: %d, ino %lu\n",
> +			pr_err("b-tree write err: %d, ino %llu\n",
>  			       res, inode->i_ino);
>  		}
>  	}
> diff --git a/fs/hfsplus/super.c b/fs/hfsplus/super.c
> index 7229a8ae89f9469109b1c3a317ee9b7705a83f8b..b3917249c206c3a25fe98b39a5eb2168b7404dc2 100644
> --- a/fs/hfsplus/super.c
> +++ b/fs/hfsplus/super.c
> @@ -156,7 +156,7 @@ static int hfsplus_system_write_inode(struct inode *inode)
>  		int err = hfs_btree_write(tree);
>  
>  		if (err) {
> -			pr_err("b-tree write err: %d, ino %lu\n",
> +			pr_err("b-tree write err: %d, ino %llu\n",
>  			       err, inode->i_ino);
>  			return err;
>  		}
> @@ -169,7 +169,7 @@ static int hfsplus_write_inode(struct inode *inode,
>  {
>  	int err;
>  
> -	hfs_dbg("ino %lu\n", inode->i_ino);
> +	hfs_dbg("ino %llu\n", inode->i_ino);
>  
>  	err = hfsplus_ext_write_extent(inode);
>  	if (err)
> @@ -184,7 +184,7 @@ static int hfsplus_write_inode(struct inode *inode,
>  
>  static void hfsplus_evict_inode(struct inode *inode)
>  {
> -	hfs_dbg("ino %lu\n", inode->i_ino);
> +	hfs_dbg("ino %llu\n", inode->i_ino);
>  	truncate_inode_pages_final(&inode->i_data);
>  	clear_inode(inode);
>  	if (HFSPLUS_IS_RSRC(inode)) {
> diff --git a/fs/hfsplus/xattr.c b/fs/hfsplus/xattr.c
> index 9904944cbd54e3d326591fa65a5ed678f38ca583..c70bb6f494b22b1e3f74e18a9ef378e0c87f8194 100644
> --- a/fs/hfsplus/xattr.c
> +++ b/fs/hfsplus/xattr.c
> @@ -277,7 +277,7 @@ int __hfsplus_setxattr(struct inode *inode, const char *name,
>  	u16 folder_finderinfo_len = sizeof(DInfo) + sizeof(DXInfo);
>  	u16 file_finderinfo_len = sizeof(FInfo) + sizeof(FXInfo);
>  
> -	hfs_dbg("ino %lu, name %s, value %p, size %zu\n",
> +	hfs_dbg("ino %llu, name %s, value %p, size %zu\n",
>  		inode->i_ino, name ? name : NULL,
>  		value, size);
>  
> @@ -447,7 +447,7 @@ int hfsplus_setxattr(struct inode *inode, const char *name,
>  		NLS_MAX_CHARSET_SIZE * HFSPLUS_ATTR_MAX_STRLEN + 1;
>  	int res;
>  
> -	hfs_dbg("ino %lu, name %s, prefix %s, prefixlen %zu, "
> +	hfs_dbg("ino %llu, name %s, prefix %s, prefixlen %zu, "
>  		"value %p, size %zu\n",
>  		inode->i_ino, name ? name : NULL,
>  		prefix ? prefix : NULL, prefixlen,
> @@ -607,7 +607,7 @@ ssize_t hfsplus_getxattr(struct inode *inode, const char *name,
>  	int res;
>  	char *xattr_name;
>  
> -	hfs_dbg("ino %lu, name %s, prefix %s\n",
> +	hfs_dbg("ino %llu, name %s, prefix %s\n",
>  		inode->i_ino, name ? name : NULL,
>  		prefix ? prefix : NULL);
>  
> @@ -717,7 +717,7 @@ ssize_t hfsplus_listxattr(struct dentry *dentry, char *buffer, size_t size)
>  	size_t strbuf_size;
>  	int xattr_name_len;
>  
> -	hfs_dbg("ino %lu\n", inode->i_ino);
> +	hfs_dbg("ino %llu\n", inode->i_ino);
>  
>  	if (!is_xattr_operation_supported(inode))
>  		return -EOPNOTSUPP;
> @@ -819,7 +819,7 @@ static int hfsplus_removexattr(struct inode *inode, const char *name)
>  	int is_xattr_acl_deleted;
>  	int is_all_xattrs_deleted;
>  
> -	hfs_dbg("ino %lu, name %s\n",
> +	hfs_dbg("ino %llu, name %s\n",
>  		inode->i_ino, name ? name : NULL);
>  
>  	if (!HFSPLUS_SB(inode->i_sb)->attr_tree)

Looks good.

Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>

Thanks,
Slava.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
