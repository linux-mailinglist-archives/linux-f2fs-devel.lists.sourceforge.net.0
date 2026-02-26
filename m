Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNd2FdqsoGlulgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 21:28:10 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C6F1AF1D4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 21:28:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olATg113sWlde6PZMAVZdWEPXUUFbZQpY/UUXi+ZEcw=; b=h8rTSQKL5am/zdYKCfYy7Y+8ph
	8ePN9G/6qbQPoPm3UubZc8XbQWKFENGEKYvHuxuIPSJJoQIv+SZowlBDt42tfhQNiUPKQGZTmMRl7
	WDj8kfqc+5f7HTtVpJ4ig3Iil4He6LjNRg4BVafwOttOCGP4DUicmt+rXBCwpwspxbcc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvhxn-0001Ye-Es;
	Thu, 26 Feb 2026 20:28:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Slava.Dubeyko@ibm.com>) id 1vvhxl-0001YE-I7;
 Thu, 26 Feb 2026 20:27:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:CC:To:From:
 Sender:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sbRbkgbamZT1xRBfw3iQ9lifOMz6fP5JgL+HdMWGQak=; b=cAYWU6ru5NHVZD71DpfHTEmIPv
 OEiq5mFQw52ec7vBfk1JCYMjxHrQ7k6QlV9bl6DPq2S1qQ5cIfIDuM5c6NLb48T+0OaOfTl5CXkka
 QEOgdj6GT8DwA+bh9CB/Jn5FhVYruPYb+X9k1yjUqjDVOJs2otseDmUmOa2zARS73/AU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sbRbkgbamZT1xRBfw3iQ9lifOMz6fP5JgL+HdMWGQak=; b=le31PodLNY00lGasaM4rpq4/V1
 rDX5pL4PoD/OC6Z5S99VMkMfgj9I6iJqW+PmvqZJ5O1FWRUSQilz14VJIep3hQ9fADI5tMGvD1eVR
 TRmjjeAqdMrNOPmwXmc/O+DNSRbrOxJO9QQU45G4cgAWBKZxfSk3ugBIcRB+R9+iD5x4=;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvhxl-0003DS-1J; Thu, 26 Feb 2026 20:27:58 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61QEZ29G2870425; Thu, 26 Feb 2026 20:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 pp1; bh=sbRbkgbamZT1xRBfw3iQ9lifOMz6fP5JgL+HdMWGQak=; b=gW6f2LzW
 SlWMsjlijPpvgNoZGYlm6wUZtpltpuszWKZ1UX15pLoHD+BEsprhuMhul3Oaz4b8
 LYMhWnPbBk/PXETDBE2Wy0kroiInTozsorj58aGdanT12gY5UFiS7g9xOGDZj2ja
 pu1bkLIJHfUGAWIC/jjmv60ado9zVkgpJjl9xIwZSbnJqNolFzkxOor94RMHnysR
 Ff6DZgZul6laKU+oF9GYdIV6vEQNkS6+08dx7MY6Q6KIqlHcC8Qtiotk1GWU16A2
 Bmto33pNoqi/XQwjXblBaOAtbvcnEUjFjh5ChQmWnyqbkTOVdRncM4rqZDhAXowU
 t8zMYjdFzWOVDw==
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013033.outbound.protection.outlook.com
 [40.93.196.33])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4bs7w4p-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 26 Feb 2026 20:09:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFUG71e7hSZBMqpKmaa4nqG1aOMn6BhOJCBzYyl7esQxuqoSlkHgtIH/piSdrC/WS6y/AxYpf6ljWHsEZbjKjQ+26RD+pf9rpmJzNhn1U3IzCAJkbGFoL8CPfTVhYYlRLPlneJW2KexEc1ixFWyoOmbzxInFNfnsDl23BAvGdVkXF+YUfvrYtXV6iAG5swk8CW6xOZEPwyj+kzV/FDbnoR7ljx2b6xb4medjm8qyyKGQ32s4E3psfo33I+hWOsBIjh/NMRi9SGlbPdfB1r1JNA6wBd9++y0RdTn300Q7tHgHa8G8jcsdkxM9rpgs1jKI955qqFjogWIm8Sm7gCjixQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbRbkgbamZT1xRBfw3iQ9lifOMz6fP5JgL+HdMWGQak=;
 b=jeMjGJr1zb/iahCS5kgFrakPPEuBwjSbxCBsr8oIGEG103OmERt1dpGK0AyRuA7G+cuTwqgtV2AUMRU1kP+JEZD0gSkLI1j/bEMi2r5z6aZE+d5OXfqBRgnbhqd6vU/Jiz27nUPUjbK6EeaYLtftUUFh2i3tUqAeEJMnJcB0/53SFqXj7V8pIsXrcMPhVItuOiwR4XXGvOTDK7pMC9SgIQ961fhDKeFqAFgzsT73ZJK3NEZe4Dn2K1ySDF1M5UslFpW3558NPtn3hHIC4tFDb31TrMYUOZ8mOchgzDexFgc22moSW7kpb0oNkrVtGshHAmXZIhpG782XwySk67RN2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from SA1PR15MB5819.namprd15.prod.outlook.com (2603:10b6:806:338::8)
 by DS0PR15MB5598.namprd15.prod.outlook.com (2603:10b6:8:13c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 20:09:23 +0000
Received: from SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539]) by SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539%7]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 20:09:23 +0000
To: "david@kernel.org" <david@kernel.org>, "davem@davemloft.net"
 <davem@davemloft.net>, "hch@infradead.org" <hch@infradead.org>, Paolo Abeni
 <pabeni@redhat.com>, "anna@kernel.org" <anna@kernel.org>, "ms@dev.tdt.de"
 <ms@dev.tdt.de>, "alexander.shishkin@linux.intel.com"
 <alexander.shishkin@linux.intel.com>, "casey@schaufler-ca.com"
 <casey@schaufler-ca.com>, "ebiggers@kernel.org" <ebiggers@kernel.org>,
 "jack@suse.cz" <jack@suse.cz>, Ondrej Mosnacek <omosnace@redhat.com>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>,
 "miklos@szeredi.hu" <miklos@szeredi.hu>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "john.johansen@canonical.com" <john.johansen@canonical.com>,
 "amir73il@gmail.com" <amir73il@gmail.com>, "slava@dubeyko.com"
 <slava@dubeyko.com>, "willy@infradead.org" <willy@infradead.org>,
 "tytso@mit.edu" <tytso@mit.edu>, "serge@hallyn.com" <serge@hallyn.com>,
 "jth@kernel.org" <jth@kernel.org>, "jolsa@kernel.org" <jolsa@kernel.org>,
 "shaggy@kernel.org" <shaggy@kernel.org>, "jaharkes@cs.cmu.edu"
 <jaharkes@cs.cmu.edu>, "willemb@google.com" <willemb@google.com>,
 "jlayton@kernel.org" <jlayton@kernel.org>, "ericvh@kernel.org"
 <ericvh@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "trondmy@kernel.org" <trondmy@kernel.org>, "aivazian.tigran@gmail.com"
 <aivazian.tigran@gmail.com>, "asmadeus@codewreck.org"
 <asmadeus@codewreck.org>, "hubcap@omnibond.com" <hubcap@omnibond.com>,
 "muchun.song@linux.dev" <muchun.song@linux.dev>, "neil@brown.name"
 <neil@brown.name>, "sfrench@samba.org" <sfrench@samba.org>,
 "jmorris@namei.org" <jmorris@namei.org>, "lucho@ionkov.net"
 <lucho@ionkov.net>, "jlbec@evilplan.org" <jlbec@evilplan.org>,
 "chuck.lever@oracle.com" <chuck.lever@oracle.com>,
 "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "raven@themaw.net"
 <raven@themaw.net>, Alex Markuze <amarkuze@redhat.com>,
 "peterz@infradead.org" <peterz@infradead.org>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "horms@kernel.org" <horms@kernel.org>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>, "alexander.deucher@amd.com"
 <alexander.deucher@amd.com>,
 "tom@talpey.com" <tom@talpey.com>, "mark@fasheh.com" <mark@fasheh.com>,
 "mikulas@artax.karlin.mff.cuni.cz" <mikulas@artax.karlin.mff.cuni.cz>,
 "djwong@kernel.org" <djwong@kernel.org>,
 "edumazet@google.com" <edumazet@google.com>, Olga Kornievskaia
 <okorniev@redhat.com>, "bharathsm@microsoft.com" <bharathsm@microsoft.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>, "osalvador@suse.de"
 <osalvador@suse.de>, "ronniesahlberg@gmail.com" <ronniesahlberg@gmail.com>,
 "pc@manguebit.org" <pc@manguebit.org>, "martin@omnibond.com"
 <martin@omnibond.com>, "naohiro.aota@wdc.com" <naohiro.aota@wdc.com>,
 "frank.li@vivo.com" <frank.li@vivo.com>, "dsterba@suse.com"
 <dsterba@suse.com>, "zohar@linux.ibm.com" <zohar@linux.ibm.com>,
 "code@tyhicks.com" <code@tyhicks.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "kuba@kernel.org" <kuba@kernel.org>,
 "kuniyu@google.com" <kuniyu@google.com>, "nico@fluxnic.net"
 <nico@fluxnic.net>, "jack@suse.com" <jack@suse.com>, "dlemoal@kernel.org"
 <dlemoal@kernel.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "stephen.smalley.work@gmail.com" <stephen.smalley.work@gmail.com>,
 "salah.triki@gmail.com" <salah.triki@gmail.com>, David Howells
 <dhowells@redhat.com>, "paul@paul-moore.com" <paul@paul-moore.com>,
 "luisbg@kernel.org" <luisbg@kernel.org>,
 "acme@kernel.org" <acme@kernel.org>, "richard@nod.at" <richard@nod.at>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "idryomov@gmail.com" <idryomov@gmail.com>,
 "joseph.qi@linux.alibaba.com" <joseph.qi@linux.alibaba.com>,
 "al@alarsen.net" <al@alarsen.net>,
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
 <chao@kernel.org>, "wufan@kernel.org" <wufan@kernel.org>,
 "irogers@google.com" <irogers@google.com>, Ingo Molnar <mingo@redhat.com>,
 "alex.aring@gmail.com" <alex.aring@gmail.com>, "namhyung@kernel.org"
 <namhyung@kernel.org>, "oleg@redhat.com" <oleg@redhat.com>,
 "chengzhihao1@huawei.com" <chengzhihao1@huawei.com>,
 "marc.dionne@auristor.com" <marc.dionne@auristor.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "almaz.alexandrovich@paragon-software.com"
 <almaz.alexandrovich@paragon-software.com>, "coda@cs.cmu.edu"
 <coda@cs.cmu.edu>
Thread-Topic: [EXTERNAL] Re:  [PATCH 17/61] nilfs2: update for u64 i_ino
Thread-Index: AQHcp1tifCxj4OBv6UGtddD/YF69PLWVaOEA
Date: Thu, 26 Feb 2026 20:09:23 +0000
Message-ID: <42116e23351321ff92376fbc3ea8cac91b886dc1.camel@ibm.com>
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
 <20260226-iino-u64-v1-17-ccceff366db9@kernel.org>
 <34b1d1f43043ca1b71a3ca9ea5ebce597a4c02aa.camel@ibm.com>
 <d8d47ebf099b21bf20f7284837f8164a19590010.camel@kernel.org>
In-Reply-To: <d8d47ebf099b21bf20f7284837f8164a19590010.camel@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5819:EE_|DS0PR15MB5598:EE_
x-ms-office365-filtering-correlation-id: 02955584-6f1f-405d-042d-08de7572ef28
x-ld-processed: fcf67057-50c9-4ad4-98f3-ffca64add9e9,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|7416014|38070700021|921020; 
x-microsoft-antispam-message-info: dS5J3+FI3hjDIKtDeDSgxj+OCCZrSWZpBJjhjSoIZxH0BCHct88W5t3r1QWr8YQmmAIo9TuM8K291NRHMLZTSTb9TFqiDKjF+SQumSw2f+hT2v/8BkLHhyQZlUGetxpnaoCvAMCsGyrR6aCx42bG/CcV9J6cBfJEjKjAeb5aWGmI8SGZv0xXUvJZIWdLLlMjh05Zz1uTGcC1Pyh/WKTGjuW1eI8Rm9w8xPSufZKVOvgSFxMvA06psCjZlgmmpL0KoalNYTSTktjA7FQ9msHL7sMymbM+PEwOQjMLnyynyoabjusnbvMxNNkoKv4uTnn4zFKq1zPypLnm6HQPJ67qKKJxeRxt78V3hlDV/1sczyKFEYDm52wAya7scEGc+YsbqOZa88cKTGPTXZ+g1q+ws24e2UaXgBIDRY8kkkQ9q96rHMhmQPcgdAP3oR2EvUSLKmYZHFfTXB67JedtYTIiBuMAmD07WbAnH8j2sdCygjUyNBIxsUziIr5WGkkw6EAmWD6rllmpH6tshjZLjW1RYYLDZDXLbxaEoZg+Tec/RXyTepTEKn5fW1EoNpmWMJGpDv/3p8iQPkRojSGVvRsAC8btfRyJjFH5Iy0Y4RltijV8jV+ekDSLJaWHBjsJLvC07Hkcf9cMzoKUs/iDwl7FfHyBo/uWlrq5QS6umiHbuYZEnvtbTkSBW6cwGrGEaOjFSvFjnf09v9Xvb3szsrg2i/6/kI/CfOgHE9Lv/Pdmx4830+p074tQmRdExAIX5bwkSVcqBTkkxdMplCvlF0lNJv3b/Dsx5XN0powWVPp+3Kg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5819.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlEzaWxzZHJXYUlzUVR0c2h1QzZXUUoya0JjUWl0d0x3amQ2Y2ROQkF2OFRo?=
 =?utf-8?B?cTRJL1F3a0xwTGFFSFhGNEZYYWFHK2pXeURNVEFTV1JsdXBEK3dVN2c5MW9B?=
 =?utf-8?B?QkVXUFJJSG8ybGxLK2VTZFV6dEMrUzkrNXgwR3RRTmdJNm55eWZUSUNhdDZs?=
 =?utf-8?B?eHNuRkZrcjRBbS94TmZNMFJiZkl0eGNrUnp5Z0hKWUcwQ245RytmZEVSTUpY?=
 =?utf-8?B?VVZzZEMrVTAvZUVCbGxEd2xtVUIyaEdCTTRwWTVydERPWi9YSWdtaVFTS1px?=
 =?utf-8?B?cUxaVjI5cjdiT0tWby9zUkEvdzZDbDBOMW5DUllPZTBoSjRWaUxLb29WL2tC?=
 =?utf-8?B?ZERURjFabjdFT3ZiczdKMnJuL1hjZDJjVW1HMkovNThHVWNKMFNjbisrdjNC?=
 =?utf-8?B?SnlweERQeVZ3QjAvQmlOZGNYMkY1bjI5UTFRUXdoWDdUWlVFV1BCWjBNWUZ4?=
 =?utf-8?B?Y1RZTGtIK3g5Q0FoMktGeVFQMnczL3diRXVkS1o3S3JzcEw4ejlBaTJiNDJD?=
 =?utf-8?B?cm1rbXF3bnBqZXdIVnE2b1RxUStDMUN3Q3FVODJtYUp3Y25kVHUwQ0syUW00?=
 =?utf-8?B?cExmUG55eFBJOWtSTFdlVC94Mzd2WHZ4MTVoZHhTVGNHSE5ZdXg1WmFKUFNK?=
 =?utf-8?B?TGF1c2pSSEEyUG9PSFNVcWxJOWJZZzJ3T1R2SHVpUmRlSU1DZ0tidGhMd1I4?=
 =?utf-8?B?L2RIOVlNMlVHTHZoZXJqbXljRDAxR0FRdkQydzlBb0xCbHllLzRocTkxdE9w?=
 =?utf-8?B?SU4wTFl3ZXlUZ0wyS3I2SGRiaXA4UVZLTUY1SWRZZnpoKzROK0FBMmlsYXZ3?=
 =?utf-8?B?dTNJbmZKaUxlQk1UR2NFRCtkQ2gvd0hXaVo1aFdWUDdmZW45cDU1R3pENTZ1?=
 =?utf-8?B?b3dsSmluUWNMSjUzeGpLL3hhQ25zWlQxeU52UHgzM3A3YzhQcmxpUnBWNktV?=
 =?utf-8?B?UVdMNFg1ZWc4TUJiYU5MSUhUS1ZXcDJxU2UxRVRKQ3B0WE9pbVgyYmZKRlNn?=
 =?utf-8?B?am1hNXd4dUZvTEc5cUZsNU9Lc212aXNvSm5Ia0ZqR2dCcGVOTHZWcVpQRkla?=
 =?utf-8?B?YzQxWHh0WFIrU0ZsUERoazNKK3pZSzc4RXppUHdjMU1DY3BjRC9oc2wzQ05l?=
 =?utf-8?B?UHdKejIwcldRQkVlVGNCSDR1R3lWQ1NBUWNiaXZHNE9ZeGpuUDBwZGUwejZC?=
 =?utf-8?B?ZGEwM0Y4K1lJOVg1eFJzQmN6L1p4ZCtTV09LekxIVDdmVDlwaXR4TWJCYWxL?=
 =?utf-8?B?b2REUlhtekxGZHgwQnJ1bW9OTnQvUUZVM2xUcjJ0NjBNVXZsZEYyVW9Xb1Nx?=
 =?utf-8?B?NnJiL1NaSTN6QkhSbSs0d05HSTc0N0ZoWmxDVGltYlNZR3NZU1FQTDdsZU5n?=
 =?utf-8?B?UjhLZi9hM01ZMWIybHlYZmZ6NjZzS0xMbGwra0tzdTd5N2JzbmlOdml0bGFP?=
 =?utf-8?B?Q3hHNHI3SE12Z0hRWllNOUpkRFcxT2xPaE5XTGU2NnhMVE8zWis0OVpXdy8x?=
 =?utf-8?B?bldjWWtJcEJia1ZOcWZXZ0dtblpZTDZsakJlODFqNGJiMUtFczFFc2ErV3Z3?=
 =?utf-8?B?WkxZUFRIeEwxOFUwN0xObHFhRU9mOEd6TENhM3UxbVNBV3FyRkRRenZJeEV1?=
 =?utf-8?B?RS9nWDRaek1veGZOVjViTGRNTmg1L20rWDRISXJpMnpHbEhCMXhyVExkN0Vo?=
 =?utf-8?B?NWNFOTNMemtkd0xZUXhiRDh4cjlUMnlHdFpBemtZMkU1VUs0TTkvWVhLZ1M0?=
 =?utf-8?B?UGVsYUx4SlN4eDR6T0YvNlRIbGdod2VUQ1JYSnl5WTNwQmxuRjc3VTlpWHBK?=
 =?utf-8?B?OGVBZFVRR1YzRENJV1BkUFFYY1NHMk96dW9nK1RnRERuUUNydHdmNThCd1Fw?=
 =?utf-8?B?K0h1bE04MkdaYnZWYVBGVlRMZXBRSGs2aHM1c0NrMUVFTzZ0Q05nWmpqS2ZT?=
 =?utf-8?B?ck1NNkFUR2RBRGlhaWRzYmc0ckNzR3Y0V3owdlVsTDBkdEpTZGIzQ2RxMzkz?=
 =?utf-8?B?NnRCRXRiYm1majVhMzNIUzBWNzdHajZWQ3l4Qjdud1FvTmM1RW5xT281a1lQ?=
 =?utf-8?B?OE04ejJEM3hUc1o1VmIxMHJLbTh3OS9UdzQ1VmJVVStpNm80WmFtdkNZSFN3?=
 =?utf-8?B?d0pVcDUxYXRVL0xCaEpEVi9TME1wQ0RTekYvMFFHSEorVzQyRkI3emZ5OTQ4?=
 =?utf-8?B?c09ISGJyTnNjSTJwWFI1a2dtbFVpbjk1dGdLb21KZDlneTE2Nkc4MnBlOTBJ?=
 =?utf-8?B?eEsxdVRYN2ZXdVJhdEVaZWpMQnQySDRQby9oWG1UemExdDR5TkVMWTNkdnNy?=
 =?utf-8?B?UU5iRjMrR1BmTEZqQ0RXWENZR0xmRGZRL2t2bzZOQm1vT2FWOU9lWXYxL3Yy?=
 =?utf-8?Q?oI34N2nWMbInutuymk6HvzdH6VT3GanrLkxwr?=
Content-ID: <4156F00146CDC54DA613BB820FCD501A@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5819.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02955584-6f1f-405d-042d-08de7572ef28
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 20:09:23.2047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QifnMmouOs0w8b3DVcxXNL/qCsHaH7d2bpZEXJ7MYHLnR3q/xHuIzmaMZ4hTkK/Ld9GITyMWsEzGOAe0w3lmRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR15MB5598
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: bJ8moxjzktFB5eQX0v-Gf1txVgzLTS1o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4NCBTYWx0ZWRfXzOtOIlKTOj02
 b50A5SmN7MkrO3P+QEN0j9zkOV4dHoBERow919CMjbsX15g35NTsamqyAS8JYXCXTnQst1rlMow
 hWB1XB7D9D1+NN0Z5weBik5RzpdnLYmnKyLv9bPXUlxMR87bpH8v1tBIKCPdttnmqWFPvpU4Hr5
 wm9X0r8ZgywhFRNzQ0tk+SHWoJUJMDZoScWrdJ9bpkXVGOq0hEmDwybSGi8krLeBMt2lmIOl1vq
 gCPDyGZ5U7xTfWCQ3/YdzGd9UPbAYvES9zwXJKd0D5VdgobEkhfNvcn/ZiI2M3aIYkpInoaiHCX
 H+z/cKHqknQ/ogVz84Qh0Db672mY8BfdvRfj8engFclqeDip7MfBI8iipDc6j8vv41+Atr81uOf
 EVBkhz2VytEWJ+83v+wHXwHeJp9bKy6VIjtqSzxW5mXW3iDhl03X3mOswGiVjypMYxQ5LMptz+E
 yXeLhc9a8zhcLUEyotQ==
X-Authority-Analysis: v=2.4 cv=eNceTXp1 c=1 sm=1 tr=0 ts=69a0a87b cx=c_pps
 a=uZgmHucj+isDzLb5E5/Wlw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=wCmvBT1CAAAA:8
 a=eAq9-sxpoI3TfA6Y_TAA:9 a=QEXdDO2ut3YA:10 a=6z96SAwNL0f8klobD5od:22
X-Proofpoint-GUID: SKcRdkzffsqYc5ZhgrIILo3U5nP4OyZd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602260184
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 2026-02-26 at 15:06 -0500, Jeff Layton wrote: > On
 Thu, 2026-02-26 at 19:46 +0000, Viacheslav Dubeyko wrote: > > On Thu,
 2026-02-26
 at 10:55 -0500, Jeff Layton wrote: > > > Update nilfs2 trace [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [148.163.158.5 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vvhxl-0003DS-1J
Subject: Re: [f2fs-dev] [PATCH 17/61] nilfs2: update for u64 i_ino
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
 "linux-unionfs@vger.kernel.org" <linux-unionfs@vger.kernel.org>,
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,davemloft.net,infradead.org,redhat.com,dev.tdt.de,linux.intel.com,schaufler-ca.com,suse.cz,arm.com,physik.fu-berlin.de,szeredi.hu,linaro.org,canonical.com,gmail.com,dubeyko.com,mit.edu,hallyn.com,cs.cmu.edu,google.com,ffwll.ch,codewreck.org,omnibond.com,linux.dev,brown.name,samba.org,namei.org,ionkov.net,evilplan.org,oracle.com,efficios.com,intel.com,themaw.net,amd.com,talpey.com,fasheh.com,artax.karlin.mff.cuni.cz,microsoft.com,suse.de,manguebit.org,wdc.com,vivo.com,suse.com,linux.ibm.com,tyhicks.com,fluxnic.net,zeniv.linux.org.uk,paul-moore.com,nod.at,goodmis.org,linux.alibaba.com,alarsen.net,huawei.com,crudebyte.com,dilger.ca,auristor.com,paragon-software.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,ibm.com:s=pp1];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,ibm.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dubeyko.com:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim];
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
X-Rspamd-Queue-Id: 18C6F1AF1D4
X-Rspamd-Action: no action

On Thu, 2026-02-26 at 15:06 -0500, Jeff Layton wrote:
> On Thu, 2026-02-26 at 19:46 +0000, Viacheslav Dubeyko wrote:
> > On Thu, 2026-02-26 at 10:55 -0500, Jeff Layton wrote:
> > > Update nilfs2 trace events and filesystem code for u64 i_ino:
> > > 
> > > - Change __field(ino_t, ...) to __field(u64, ...) in trace events
> > > - Update format strings from %lu to %llu
> > > - Cast to (unsigned long long) in TP_printk
> > > 
> > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > ---
> > >  fs/nilfs2/alloc.c             | 10 +++++-----
> > >  fs/nilfs2/bmap.c              |  2 +-
> > >  fs/nilfs2/btnode.c            |  2 +-
> > >  fs/nilfs2/btree.c             | 12 ++++++------
> > >  fs/nilfs2/dir.c               | 12 ++++++------
> > >  fs/nilfs2/direct.c            |  4 ++--
> > >  fs/nilfs2/gcinode.c           |  2 +-
> > >  fs/nilfs2/inode.c             |  8 ++++----
> > >  fs/nilfs2/mdt.c               |  2 +-
> > >  fs/nilfs2/namei.c             |  2 +-
> > >  fs/nilfs2/segment.c           |  2 +-
> > >  include/trace/events/nilfs2.h | 12 ++++++------
> > >  12 files changed, 35 insertions(+), 35 deletions(-)
> > > 
> > > diff --git a/fs/nilfs2/alloc.c b/fs/nilfs2/alloc.c
> > > index e7eebb04f9a4080a39f17d4123e58ed7df6b2f4b..7b1cd2baefcf21e54f9260845b02c7c95c148c64 100644
> > > --- a/fs/nilfs2/alloc.c
> > > +++ b/fs/nilfs2/alloc.c
> > > @@ -707,7 +707,7 @@ void nilfs_palloc_commit_free_entry(struct inode *inode,
> > >  
> > >  	if (!nilfs_clear_bit_atomic(lock, group_offset, bitmap))
> > >  		nilfs_warn(inode->i_sb,
> > > -			   "%s (ino=%lu): entry number %llu already freed",
> > > +			   "%s (ino=%llu): entry number %llu already freed",
> > >  			   __func__, inode->i_ino,
> > >  			   (unsigned long long)req->pr_entry_nr);
> > >  	else
> > > @@ -748,7 +748,7 @@ void nilfs_palloc_abort_alloc_entry(struct inode *inode,
> > >  
> > >  	if (!nilfs_clear_bit_atomic(lock, group_offset, bitmap))
> > >  		nilfs_warn(inode->i_sb,
> > > -			   "%s (ino=%lu): entry number %llu already freed",
> > > +			   "%s (ino=%llu): entry number %llu already freed",
> > >  			   __func__, inode->i_ino,
> > >  			   (unsigned long long)req->pr_entry_nr);
> > >  	else
> > > @@ -861,7 +861,7 @@ int nilfs_palloc_freev(struct inode *inode, __u64 *entry_nrs, size_t nitems)
> > >  			if (!nilfs_clear_bit_atomic(lock, group_offset,
> > >  						    bitmap)) {
> > >  				nilfs_warn(inode->i_sb,
> > > -					   "%s (ino=%lu): entry number %llu already freed",
> > > +					   "%s (ino=%llu): entry number %llu already freed",
> > >  					   __func__, inode->i_ino,
> > >  					   (unsigned long long)entry_nrs[j]);
> > >  			} else {
> > > @@ -906,7 +906,7 @@ int nilfs_palloc_freev(struct inode *inode, __u64 *entry_nrs, size_t nitems)
> > >  							      last_nrs[k]);
> > >  			if (ret && ret != -ENOENT)
> > >  				nilfs_warn(inode->i_sb,
> > > -					   "error %d deleting block that object (entry=%llu, ino=%lu) belongs to",
> > > +					   "error %d deleting block that object (entry=%llu, ino=%llu) belongs to",
> > >  					   ret, (unsigned long long)last_nrs[k],
> > >  					   inode->i_ino);
> > >  		}
> > > @@ -923,7 +923,7 @@ int nilfs_palloc_freev(struct inode *inode, __u64 *entry_nrs, size_t nitems)
> > >  			ret = nilfs_palloc_delete_bitmap_block(inode, group);
> > >  			if (ret && ret != -ENOENT)
> > >  				nilfs_warn(inode->i_sb,
> > > -					   "error %d deleting bitmap block of group=%lu, ino=%lu",
> > > +					   "error %d deleting bitmap block of group=%lu, ino=%llu",
> > >  					   ret, group, inode->i_ino);
> > >  		}
> > >  	}
> > > diff --git a/fs/nilfs2/bmap.c b/fs/nilfs2/bmap.c
> > > index ccc1a7aa52d2064d56b826058554264c498d592f..824f2bd91c167965ec3a660202b6e6c5f1fe007e 100644
> > > --- a/fs/nilfs2/bmap.c
> > > +++ b/fs/nilfs2/bmap.c
> > > @@ -33,7 +33,7 @@ static int nilfs_bmap_convert_error(struct nilfs_bmap *bmap,
> > >  
> > >  	if (err == -EINVAL) {
> > >  		__nilfs_error(inode->i_sb, fname,
> > > -			      "broken bmap (inode number=%lu)", inode->i_ino);
> > > +			      "broken bmap (inode number=%llu)", inode->i_ino);
> > >  		err = -EIO;
> > >  	}
> > >  	return err;
> > > diff --git a/fs/nilfs2/btnode.c b/fs/nilfs2/btnode.c
> > > index 56836712909201775907483887e8a0022851bbec..2e553d698d0f3980de98fced415dfd819ddbca0a 100644
> > > --- a/fs/nilfs2/btnode.c
> > > +++ b/fs/nilfs2/btnode.c
> > > @@ -64,7 +64,7 @@ nilfs_btnode_create_block(struct address_space *btnc, __u64 blocknr)
> > >  		 * clearing of an abandoned b-tree node is missing somewhere).
> > >  		 */
> > >  		nilfs_error(inode->i_sb,
> > > -			    "state inconsistency probably due to duplicate use of b-tree node block address %llu (ino=%lu)",
> > > +			    "state inconsistency probably due to duplicate use of b-tree node block address %llu (ino=%llu)",
> > >  			    (unsigned long long)blocknr, inode->i_ino);
> > >  		goto failed;
> > >  	}
> > > diff --git a/fs/nilfs2/btree.c b/fs/nilfs2/btree.c
> > > index dd0c8e560ef6a2c96515025321914e0d73f41144..3c03f5a741d144d22d1ffb5acf43a035e88c00dc 100644
> > > --- a/fs/nilfs2/btree.c
> > > +++ b/fs/nilfs2/btree.c
> > > @@ -353,7 +353,7 @@ static int nilfs_btree_node_broken(const struct nilfs_btree_node *node,
> > >  		     nchildren <= 0 ||
> > >  		     nchildren > NILFS_BTREE_NODE_NCHILDREN_MAX(size))) {
> > >  		nilfs_crit(inode->i_sb,
> > > -			   "bad btree node (ino=%lu, blocknr=%llu): level = %d, flags = 0x%x, nchildren = %d",
> > > +			   "bad btree node (ino=%llu, blocknr=%llu): level = %d, flags = 0x%x, nchildren = %d",
> > >  			   inode->i_ino, (unsigned long long)blocknr, level,
> > >  			   flags, nchildren);
> > >  		ret = 1;
> > > @@ -384,7 +384,7 @@ static int nilfs_btree_root_broken(const struct nilfs_btree_node *node,
> > >  		     nchildren > NILFS_BTREE_ROOT_NCHILDREN_MAX ||
> > >  		     (nchildren == 0 && level > NILFS_BTREE_LEVEL_NODE_MIN))) {
> > >  		nilfs_crit(inode->i_sb,
> > > -			   "bad btree root (ino=%lu): level = %d, flags = 0x%x, nchildren = %d",
> > > +			   "bad btree root (ino=%llu): level = %d, flags = 0x%x, nchildren = %d",
> > >  			   inode->i_ino, level, flags, nchildren);
> > >  		ret = 1;
> > >  	}
> > > @@ -453,7 +453,7 @@ static int nilfs_btree_bad_node(const struct nilfs_bmap *btree,
> > >  	if (unlikely(nilfs_btree_node_get_level(node) != level)) {
> > >  		dump_stack();
> > >  		nilfs_crit(btree->b_inode->i_sb,
> > > -			   "btree level mismatch (ino=%lu): %d != %d",
> > > +			   "btree level mismatch (ino=%llu): %d != %d",
> > >  			   btree->b_inode->i_ino,
> > >  			   nilfs_btree_node_get_level(node), level);
> > >  		return 1;
> > > @@ -521,7 +521,7 @@ static int __nilfs_btree_get_block(const struct nilfs_bmap *btree, __u64 ptr,
> > >   out_no_wait:
> > >  	if (!buffer_uptodate(bh)) {
> > >  		nilfs_err(btree->b_inode->i_sb,
> > > -			  "I/O error reading b-tree node block (ino=%lu, blocknr=%llu)",
> > > +			  "I/O error reading b-tree node block (ino=%llu, blocknr=%llu)",
> > >  			  btree->b_inode->i_ino, (unsigned long long)ptr);
> > >  		brelse(bh);
> > >  		return -EIO;
> > > @@ -2104,7 +2104,7 @@ static int nilfs_btree_propagate(struct nilfs_bmap *btree,
> > >  	if (ret < 0) {
> > >  		if (unlikely(ret == -ENOENT)) {
> > >  			nilfs_crit(btree->b_inode->i_sb,
> > > -				   "writing node/leaf block does not appear in b-tree (ino=%lu) at key=%llu, level=%d",
> > > +				   "writing node/leaf block does not appear in b-tree (ino=%llu) at key=%llu, level=%d",
> > >  				   btree->b_inode->i_ino,
> > >  				   (unsigned long long)key, level);
> > >  			ret = -EINVAL;
> > > @@ -2146,7 +2146,7 @@ static void nilfs_btree_add_dirty_buffer(struct nilfs_bmap *btree,
> > >  	    level >= NILFS_BTREE_LEVEL_MAX) {
> > >  		dump_stack();
> > >  		nilfs_warn(btree->b_inode->i_sb,
> > > -			   "invalid btree level: %d (key=%llu, ino=%lu, blocknr=%llu)",
> > > +			   "invalid btree level: %d (key=%llu, ino=%llu, blocknr=%llu)",
> > >  			   level, (unsigned long long)key,
> > >  			   btree->b_inode->i_ino,
> > >  			   (unsigned long long)bh->b_blocknr);
> > > diff --git a/fs/nilfs2/dir.c b/fs/nilfs2/dir.c
> > > index b243199036dfa1ab2299efaaa5bdf5da2d159ff2..3653db5cdb65137d1e660bb509c14ec4cbc8840b 100644
> > > --- a/fs/nilfs2/dir.c
> > > +++ b/fs/nilfs2/dir.c
> > > @@ -150,7 +150,7 @@ static bool nilfs_check_folio(struct folio *folio, char *kaddr)
> > >  
> > >  Ebadsize:
> > >  	nilfs_error(sb,
> > > -		    "size of directory #%lu is not a multiple of chunk size",
> > > +		    "size of directory #%llu is not a multiple of chunk size",
> > >  		    dir->i_ino);
> > >  	goto fail;
> > >  Eshort:
> > > @@ -169,7 +169,7 @@ static bool nilfs_check_folio(struct folio *folio, char *kaddr)
> > >  	error = "disallowed inode number";
> > >  bad_entry:
> > >  	nilfs_error(sb,
> > > -		    "bad entry in directory #%lu: %s - offset=%lu, inode=%lu, rec_len=%zd, name_len=%d",
> > > +		    "bad entry in directory #%llu: %s - offset=%lu, inode=%lu, rec_len=%zd, name_len=%d",
> > 
> > I think you missed 'inode=%lu' here. 
> 
> That is actually the placeholder for this:
> 
>     (unsigned long)le64_to_cpu(p->inode)
> 
> ...which is not inode->i_ino. I do agree that the cast probably no
> longer makes sense with this change, but I'd probably leave that to a
> later cleanup so we can keep this set focused on the i_ino change.

I see your point. Makes sense. The rest looks good.

Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>

Thanks,
Slava.

> 
> 
> > >  		    dir->i_ino, error, (folio->index << PAGE_SHIFT) + offs,
> > >  		    (unsigned long)le64_to_cpu(p->inode),
> > >  		    rec_len, p->name_len);
> > > @@ -177,7 +177,7 @@ static bool nilfs_check_folio(struct folio *folio, char *kaddr)
> > >  Eend:
> > >  	p = (struct nilfs_dir_entry *)(kaddr + offs);
> > >  	nilfs_error(sb,
> > > -		    "entry in directory #%lu spans the page boundary offset=%lu, inode=%lu",
> > > +		    "entry in directory #%llu spans the page boundary offset=%lu, inode=%lu",
> > 
> > Ditto. You missed 'inode=%lu' here.
> > 
> > 
> 
> Same here.
> 
> > >  		    dir->i_ino, (folio->index << PAGE_SHIFT) + offs,
> > >  		    (unsigned long)le64_to_cpu(p->inode));
> > >  fail:
> > > @@ -251,7 +251,7 @@ static int nilfs_readdir(struct file *file, struct dir_context *ctx)
> > >  
> > >  		kaddr = nilfs_get_folio(inode, n, &folio);
> > >  		if (IS_ERR(kaddr)) {
> > > -			nilfs_error(sb, "bad page in #%lu", inode->i_ino);
> > > +			nilfs_error(sb, "bad page in #%llu", inode->i_ino);
> > >  			ctx->pos += PAGE_SIZE - offset;
> > >  			return -EIO;
> > >  		}
> > > @@ -336,7 +336,7 @@ struct nilfs_dir_entry *nilfs_find_entry(struct inode *dir,
> > >  		/* next folio is past the blocks we've got */
> > >  		if (unlikely(n > (dir->i_blocks >> (PAGE_SHIFT - 9)))) {
> > >  			nilfs_error(dir->i_sb,
> > > -			       "dir %lu size %lld exceeds block count %llu",
> > > +			       "dir %llu size %lld exceeds block count %llu",
> > >  			       dir->i_ino, dir->i_size,
> > >  			       (unsigned long long)dir->i_blocks);
> > >  			goto out;
> > > @@ -382,7 +382,7 @@ struct nilfs_dir_entry *nilfs_dotdot(struct inode *dir, struct folio **foliop)
> > >  	return next_de;
> > >  
> > >  fail:
> > > -	nilfs_error(dir->i_sb, "directory #%lu %s", dir->i_ino, msg);
> > > +	nilfs_error(dir->i_sb, "directory #%llu %s", dir->i_ino, msg);
> > >  	folio_release_kmap(folio, de);
> > >  	return NULL;
> > >  }
> > > diff --git a/fs/nilfs2/direct.c b/fs/nilfs2/direct.c
> > > index 2d8dc6b35b5477947ca12a70288d3a3cce858aab..8bd0b1374e25f8ff510f3b36dbde2acc01aafc1e 100644
> > > --- a/fs/nilfs2/direct.c
> > > +++ b/fs/nilfs2/direct.c
> > > @@ -338,7 +338,7 @@ static int nilfs_direct_assign(struct nilfs_bmap *bmap,
> > >  	key = nilfs_bmap_data_get_key(bmap, *bh);
> > >  	if (unlikely(key > NILFS_DIRECT_KEY_MAX)) {
> > >  		nilfs_crit(bmap->b_inode->i_sb,
> > > -			   "%s (ino=%lu): invalid key: %llu",
> > > +			   "%s (ino=%llu): invalid key: %llu",
> > >  			   __func__,
> > >  			   bmap->b_inode->i_ino, (unsigned long long)key);
> > >  		return -EINVAL;
> > > @@ -346,7 +346,7 @@ static int nilfs_direct_assign(struct nilfs_bmap *bmap,
> > >  	ptr = nilfs_direct_get_ptr(bmap, key);
> > >  	if (unlikely(ptr == NILFS_BMAP_INVALID_PTR)) {
> > >  		nilfs_crit(bmap->b_inode->i_sb,
> > > -			   "%s (ino=%lu): invalid pointer: %llu",
> > > +			   "%s (ino=%llu): invalid pointer: %llu",
> > >  			   __func__,
> > >  			   bmap->b_inode->i_ino, (unsigned long long)ptr);
> > >  		return -EINVAL;
> > > diff --git a/fs/nilfs2/gcinode.c b/fs/nilfs2/gcinode.c
> > > index 561c220799c7aee879ad866865e377799c8ee6bb..62d4c1b787e95c961a360a4214d621d564ad8b4c 100644
> > > --- a/fs/nilfs2/gcinode.c
> > > +++ b/fs/nilfs2/gcinode.c
> > > @@ -137,7 +137,7 @@ int nilfs_gccache_wait_and_mark_dirty(struct buffer_head *bh)
> > >  		struct inode *inode = bh->b_folio->mapping->host;
> > >  
> > >  		nilfs_err(inode->i_sb,
> > > -			  "I/O error reading %s block for GC (ino=%lu, vblocknr=%llu)",
> > > +			  "I/O error reading %s block for GC (ino=%llu, vblocknr=%llu)",
> > >  			  buffer_nilfs_node(bh) ? "node" : "data",
> > >  			  inode->i_ino, (unsigned long long)bh->b_blocknr);
> > >  		return -EIO;
> > > diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
> > > index 51bde45d586509dda3ef0cb7c46facb7fb2c61dd..51f7e125a311b868860e3e111700d49d4cb98fa6 100644
> > > --- a/fs/nilfs2/inode.c
> > > +++ b/fs/nilfs2/inode.c
> > > @@ -108,7 +108,7 @@ int nilfs_get_block(struct inode *inode, sector_t blkoff,
> > >  				 * be locked in this case.
> > >  				 */
> > >  				nilfs_warn(inode->i_sb,
> > > -					   "%s (ino=%lu): a race condition while inserting a data block at offset=%llu",
> > > +					   "%s (ino=%llu): a race condition while inserting a data block at offset=%llu",
> > >  					   __func__, inode->i_ino,
> > >  					   (unsigned long long)blkoff);
> > >  				err = -EAGAIN;
> > > @@ -789,7 +789,7 @@ static void nilfs_truncate_bmap(struct nilfs_inode_info *ii,
> > >  		goto repeat;
> > >  
> > >  failed:
> > > -	nilfs_warn(ii->vfs_inode.i_sb, "error %d truncating bmap (ino=%lu)",
> > > +	nilfs_warn(ii->vfs_inode.i_sb, "error %d truncating bmap (ino=%llu)",
> > >  		   ret, ii->vfs_inode.i_ino);
> > >  }
> > >  
> > > @@ -1026,7 +1026,7 @@ int nilfs_set_file_dirty(struct inode *inode, unsigned int nr_dirty)
> > >  			 * this inode.
> > >  			 */
> > >  			nilfs_warn(inode->i_sb,
> > > -				   "cannot set file dirty (ino=%lu): the file is being freed",
> > > +				   "cannot set file dirty (ino=%llu): the file is being freed",
> > >  				   inode->i_ino);
> > >  			spin_unlock(&nilfs->ns_inode_lock);
> > >  			return -EINVAL; /*
> > > @@ -1057,7 +1057,7 @@ int __nilfs_mark_inode_dirty(struct inode *inode, int flags)
> > >  	err = nilfs_load_inode_block(inode, &ibh);
> > >  	if (unlikely(err)) {
> > >  		nilfs_warn(inode->i_sb,
> > > -			   "cannot mark inode dirty (ino=%lu): error %d loading inode block",
> > > +			   "cannot mark inode dirty (ino=%llu): error %d loading inode block",
> > >  			   inode->i_ino, err);
> > >  		return err;
> > >  	}
> > > diff --git a/fs/nilfs2/mdt.c b/fs/nilfs2/mdt.c
> > > index 946b0d3534a5f22f34ac44a91fb121541881c548..09adb40c65e505d92012a3d2f5fe8a5696e10056 100644
> > > --- a/fs/nilfs2/mdt.c
> > > +++ b/fs/nilfs2/mdt.c
> > > @@ -203,7 +203,7 @@ static int nilfs_mdt_read_block(struct inode *inode, unsigned long block,
> > >  	err = -EIO;
> > >  	if (!buffer_uptodate(first_bh)) {
> > >  		nilfs_err(inode->i_sb,
> > > -			  "I/O error reading meta-data file (ino=%lu, block-offset=%lu)",
> > > +			  "I/O error reading meta-data file (ino=%llu, block-offset=%lu)",
> > >  			  inode->i_ino, block);
> > >  		goto failed_bh;
> > >  	}
> > > diff --git a/fs/nilfs2/namei.c b/fs/nilfs2/namei.c
> > > index 40f4b1a28705b6e0eb8f0978cf3ac18b43aa1331..40ac679ec56e400b1df98e9be6fe9ca338a9ba51 100644
> > > --- a/fs/nilfs2/namei.c
> > > +++ b/fs/nilfs2/namei.c
> > > @@ -292,7 +292,7 @@ static int nilfs_do_unlink(struct inode *dir, struct dentry *dentry)
> > >  
> > >  	if (!inode->i_nlink) {
> > >  		nilfs_warn(inode->i_sb,
> > > -			   "deleting nonexistent file (ino=%lu), %d",
> > > +			   "deleting nonexistent file (ino=%llu), %d",
> > >  			   inode->i_ino, inode->i_nlink);
> > >  		set_nlink(inode, 1);
> > >  	}
> > > diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
> > > index 098a3bd103e04cd09b0689fe2017380d74664496..4b1bf559f3524b1cc3965dae9fd3e5745718569d 100644
> > > --- a/fs/nilfs2/segment.c
> > > +++ b/fs/nilfs2/segment.c
> > > @@ -2024,7 +2024,7 @@ static int nilfs_segctor_collect_dirty_files(struct nilfs_sc_info *sci,
> > >  				ifile, ii->vfs_inode.i_ino, &ibh);
> > >  			if (unlikely(err)) {
> > >  				nilfs_warn(sci->sc_super,
> > > -					   "log writer: error %d getting inode block (ino=%lu)",
> > > +					   "log writer: error %d getting inode block (ino=%llu)",
> > >  					   err, ii->vfs_inode.i_ino);
> > >  				return err;
> > >  			}
> > > diff --git a/include/trace/events/nilfs2.h b/include/trace/events/nilfs2.h
> > > index 8880c11733dd307c223cc62ee34ebeff650ecb12..86a0011c9eeaf031cfa0b79875b2b106ef8b7cfd 100644
> > > --- a/include/trace/events/nilfs2.h
> > > +++ b/include/trace/events/nilfs2.h
> > > @@ -165,14 +165,14 @@ TRACE_EVENT(nilfs2_segment_usage_freed,
> > >  
> > >  TRACE_EVENT(nilfs2_mdt_insert_new_block,
> > >  	    TP_PROTO(struct inode *inode,
> > > -		     unsigned long ino,
> > > +		     u64 ino,
> > >  		     unsigned long block),
> > >  
> > >  	    TP_ARGS(inode, ino, block),
> > >  
> > >  	    TP_STRUCT__entry(
> > >  		    __field(struct inode *, inode)
> > > -		    __field(unsigned long, ino)
> > > +		    __field(u64, ino)
> > >  		    __field(unsigned long, block)
> > >  	    ),
> > >  
> > > @@ -182,7 +182,7 @@ TRACE_EVENT(nilfs2_mdt_insert_new_block,
> > >  		    __entry->block = block;
> > >  		    ),
> > >  
> > > -	    TP_printk("inode = %p ino = %lu block = %lu",
> > > +	    TP_printk("inode = %p ino = %llu block = %lu",
> > >  		      __entry->inode,
> > >  		      __entry->ino,
> > >  		      __entry->block)
> > > @@ -190,7 +190,7 @@ TRACE_EVENT(nilfs2_mdt_insert_new_block,
> > >  
> > >  TRACE_EVENT(nilfs2_mdt_submit_block,
> > >  	    TP_PROTO(struct inode *inode,
> > > -		     unsigned long ino,
> > > +		     u64 ino,
> > >  		     unsigned long blkoff,
> > >  		     enum req_op mode),
> > >  
> > > @@ -198,7 +198,7 @@ TRACE_EVENT(nilfs2_mdt_submit_block,
> > >  
> > >  	    TP_STRUCT__entry(
> > >  		    __field(struct inode *, inode)
> > > -		    __field(unsigned long, ino)
> > > +		    __field(u64, ino)
> > >  		    __field(unsigned long, blkoff)
> > >  		    /*
> > >  		     * Use field_struct() to avoid is_signed_type() on the
> > > @@ -214,7 +214,7 @@ TRACE_EVENT(nilfs2_mdt_submit_block,
> > >  		    __entry->mode = mode;
> > >  		    ),
> > >  
> > > -	    TP_printk("inode = %p ino = %lu blkoff = %lu mode = %x",
> > > +	    TP_printk("inode = %p ino = %llu blkoff = %lu mode = %x",
> > >  		      __entry->inode,
> > >  		      __entry->ino,
> > >  		      __entry->blkoff,

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
