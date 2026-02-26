Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9eUnN3azoGmHlwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 21:56:22 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A17651AF536
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 21:56:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rp2PxKtHuExKkW/k3fgC57u8p9DzFF5f72Y6bPOANKg=; b=Z17XjKI6za+htRYhX8faIxA2gO
	X66g2W1OLA4xSerk6EcK6weWDyHyp6bNyw3lZrlYJay3/2SkKayVbtuxsfyVz2rrwJSOnqpNWNpr3
	uOtXnjpnK/p5Z94ay+ffoTvAA9s9zafz9uKgw5jTKNUhr/xwzEjA+kUXscof3G3VrtKA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vviP6-0008MG-6t;
	Thu, 26 Feb 2026 20:56:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Slava.Dubeyko@ibm.com>) id 1vviP4-0008Ly-Cr;
 Thu, 26 Feb 2026 20:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:CC:To:From:
 Sender:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LILfmGjZqKoX4SxkAinliX4KD5JtQIXnFpvI7AAiOtM=; b=VQI9EB5T4fsdK07rdNrYNL6yvp
 VyL7owypePZr3gDkUBMY3IDxhsaOaRLTg0yCV9Rx8qWHMP1JUDvNhwL1xa896A1c7fOkPRozOaWoE
 JXR5k7u7pAuXB5l9eTuStZdjSivX6BWCY4v6tVFp/GjHhD4yHUeFX5KTwtH4s1bnnCOs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LILfmGjZqKoX4SxkAinliX4KD5JtQIXnFpvI7AAiOtM=; b=Y2c0xmQ6WCmecRBqLyyGQrnfPP
 DyYRRa1BUmtTj+OooSz9ItwSHE0wGbZGN/+ca/sWO7aruGtKcynBzD0FnP5HvqNcwDsVw3JbhVRop
 Uj02uAvyu6LMf2n71jDavM/N9WwStP4yUr3VnUH5jA4zlSxmM6Du5pbKEHXU3jjmgnE8=;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vviP3-0004aM-RF; Thu, 26 Feb 2026 20:56:10 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61QIZSUe2346129; Thu, 26 Feb 2026 19:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 pp1; bh=LILfmGjZqKoX4SxkAinliX4KD5JtQIXnFpvI7AAiOtM=; b=sNP/T8BS
 JO9xuFg2jGdAZZv19ntk3EIagQdH/11b4uWWozLL5KqjhhA5YRevSv0Vh8y7oW6V
 HGQYZJ32apoYLqHN/8NOU8mBQeiJ/kSu7qbcGb7Ld70dyrqpFNBq+iZV+ycMTNLv
 HjKOc8yF5T5d0Lm9A6nADkG1q583M+PBr1Xlud2yVXYHG79pz00DZTsoawUKI0rE
 foQUbtQvtLtNdH/gVnuZOCJZN6hZXvINt57izE05sTTU+GfLC0p0ed517ql4/J5v
 +Offuuz/PehR8wzwXIAzAcg+CDplik6jQFwhntHOJSpP4yPC85NoU6NtuB4lN0Ga
 3JIaYsMwQUYtQA==
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010016.outbound.protection.outlook.com [52.101.61.16])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ch858x26j-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 26 Feb 2026 19:33:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTEVROjL1MpGC37SBIVoReLpQ0Va4hNcQbJvgn7X3fL2SrXMBxEJIDd/McrU9k8G2SFRJgI8btykTT18oY8jBXzvLwLk3ydqsrElAjbj8KNQ/htYNRgUae0/s8QSI4G/bRHOBZzJSkv+4L3Sp8VdjqwuH3e4iWKQk3jC3kVfZ7ofi8IhzOXun33OrWcK61/SJOymg3ztjz55g2W7mcQYsMtAGippbZUnCkt3NL7Da8sx/JITpgfBXw1zuM2Arl91GNsgXl5EngolXtlJS4uShFo4XlpfP4V/0e04rNbZjmmDkvKzoZut63f+A09Tf6n/C7W7ZqfELxRrAOvTcMS+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LILfmGjZqKoX4SxkAinliX4KD5JtQIXnFpvI7AAiOtM=;
 b=YO4RqbqURYeCTWkCP9IvWw3ilw/uc/3KBxzCPXq8sdBcR272n1stFAweHqdpHd2JpwlU3aSKIDkuCi6VHgZyyw1v1CZMW+3DA0aKCf2V4Bf75VR4yO9rnCcV+768CpbzL6zBTnKqLBcaJiMubmFvjofw4vDpE2xZf2XOS7ua5qyMDGpd8TtOh43c5/jUG/aCB+zg7Bz/6N3oDoiGYeIAop4SVUy4a+QICq9Xs6avg1GrnLLyyda7Qr501e3b6XCRlhArPGHzqXB011tYrj8PsHIbxbC2vwWGLSdkJwslElGCuLLnYOkvilTW5+GzRRI79nM+dtl/JIQaWQjtbEF7nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from SA1PR15MB5819.namprd15.prod.outlook.com (2603:10b6:806:338::8)
 by PH7PR15MB5693.namprd15.prod.outlook.com (2603:10b6:510:270::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Thu, 26 Feb
 2026 19:33:37 +0000
Received: from SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539]) by SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539%7]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 19:33:37 +0000
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
Thread-Topic: [EXTERNAL] [PATCH 33/61] hfs: update format strings for u64 i_ino
Thread-Index: AQHcpz2x4TUu0p1b1UOrTR9iSPzcyLWVXx4A
Date: Thu, 26 Feb 2026 19:33:37 +0000
Message-ID: <0bc9e485e475a12e1e2c9a73b781308fd94a97a4.camel@ibm.com>
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
 <20260226-iino-u64-v1-33-ccceff366db9@kernel.org>
In-Reply-To: <20260226-iino-u64-v1-33-ccceff366db9@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5819:EE_|PH7PR15MB5693:EE_
x-ms-office365-filtering-correlation-id: ae649948-3a84-4c30-576a-08de756deff5
x-ld-processed: fcf67057-50c9-4ad4-98f3-ffca64add9e9,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|38070700021|921020; 
x-microsoft-antispam-message-info: cahQUZvB1A3MAJEwPbxU3hSrLW7Ns8lPCLl5gpVuCZSGcPU97Z+M3LcXk87iMbetSbW04W5Y7KY2xx9pu+9IuBXZyYoB+CBXBnhWhAYPUi4bwz7zuYCOJJ0XITR9SnKqJmZsmk9ygX2gXymHaLEZelkJcGMk8BzplRZkpHXBzdPTBVeUFt6MWpp6O4aSttrBl0W56A9WmRcCNgqB+tIMdA3lYWTKg0RYOb7M3D1AqlUScc3Z/eRfRAJLkcMAL+muO6rQUX55/qmzgc8O2RNyLvsFWBjQq2dhONyQTeU91TL0weMZwz3jeZFwFrZqH3kp8pPfe/WIqJ74hz2M3jWbxixjMNE263BFamcUH+41CbgexFmz4ch30Wz8DFx3dFZlu52m0RfmYo2za74W55Pg2I34K1amiVsxHS7NNQ05R7jrjiVkrQZ6XuD1iMaIBniaM6O+fc5KK8mcNY1ZhiwpQRaYs92ar4qJAXl9cSgAgsp6K8LBdwooJsnqpTv9Hjpkdr/pgAnMJEft3YiD0h2n7ZPtUPFuPENO+nJammUVtXXBxs0eMBp3MrRSX53cf2fE+lYIVZSRCTzTTliwz+fRoH2GdFUS2GwIl/yx85nFdmJWbWOZ462PZPlfvOZpM6nq1V+RN+vIWpRycJydjxxbP1tgbEboW9AdgguT699AtVQnOOkszAkJglsu2liZCtBCkh5TJ+/16yclEpJyln5IxMKvRACrPR2GwjAUljw5fTU7YEZVUDmhpSebx46g6vut8S8BG1geJQv7gJGZEx5wgmnJn9ysa5KMSBFD+ySRq19PR1oDT+16n2X9rgd6WRIM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5819.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SnBDZ3NhcjNmZ1FPemRzOE1haldNZXdIK1dnT3FES3BleTFNVVE1TURQaVJD?=
 =?utf-8?B?UzE1azFuTFgwRUxKYkU4QytIeTk0MnU3ZEptajdTbjRvWkRqRFE5a3ZoakN1?=
 =?utf-8?B?QlNuUUd1M3VDWis2clRCdFF6ODlQUVkxeGtBTk9ZUHRzWWZMVmdlaEJvT1NH?=
 =?utf-8?B?TFNxbktKT3c3QmFuSGhYT1JGTGhYclhMaVV1ZkRhZUloeTVmQTRDajgxM1o0?=
 =?utf-8?B?Z2VtdExvMUhXZU9yYk90dllqZUNuQkdtamJrdTBZK3B2emVCNjFmeTdwdHRh?=
 =?utf-8?B?dEhVSnVOYkJKVlVBaFJKb01sNUZJNFVPR1BveFFGVkIxamEzdGRrdTRnallq?=
 =?utf-8?B?bjB3a29UVTVsbENyVjF4U1FNaEx5TGY5bG0zbGhwRU53aWRqUkJSSU9aSFA2?=
 =?utf-8?B?NzM5VmRwak1qdjVHNzFMTFdnTkttUWRUUEZNSHFyak5GMS9KL3Z0NUV1RG1Q?=
 =?utf-8?B?TjB2UG9DNnNjZVBPRk1JbkxxVFVIeko1T2ZVTXRBSnFFZ3lSbHpLaWZnTVJ4?=
 =?utf-8?B?R1ladkpFcG92dEFkS3RpbUNLMDNXQlkxcFJpMVZ4bENFSFVYZ2EzcTJvMStT?=
 =?utf-8?B?d3BYTkRKR2diVTRmYmF3RW1HQjF6RkNnWkswbkZFQ0tzcyswdEJGNWpSVUtP?=
 =?utf-8?B?VWdkWkhLSHEyMFlJZXR2UmlGOXdjRGUyK01zanBvWWxZa2ZmMW5hNTdLMDhV?=
 =?utf-8?B?VWJGOGZ2b1VvekhjeTVtZE1TWS9MdnNDTDJLY015VFVkb1NveHNEZ0VTckhw?=
 =?utf-8?B?TXFvUU96Mk9KL0JQcFJzdmkwclRSYytPUmpvT1pWWVJtVTFON2FEVm5iRkUv?=
 =?utf-8?B?NDJhcHhrbjc2UnVZVmxrSnNDQkpiSU5HWURnV0UwcHg0MitNZGRUOWo5NDVv?=
 =?utf-8?B?U0czY1NlZmJldDhHN25GOTE1UVloUllsdldKTG1kYkhBamtOQjFkNldFVFBq?=
 =?utf-8?B?S2ovRk03QTZ0cS9SNmJ5cVo5WStoOVo1Q3JEbCt6aTBVbC9IUFNNbjdpYms2?=
 =?utf-8?B?RTVaV2FIL2gwTllFTUVJd3JQQmJHMVlQN0QyYmJVTWRtSzljK1paN2lqV3Fq?=
 =?utf-8?B?NGhTdlRnVkd3WXZzUUY4SEpDTXQ4cUttL0xIVmVHaFJ2OE1wcEFOVzMrcnJF?=
 =?utf-8?B?b3Rsa242NUFYU0dhK2xSQUR3dWdORFphOE8vN1duenBTK2FaQU5qUEg2RlR3?=
 =?utf-8?B?eEM4Qi9wZzBtRis3eGdUYXJIb0k0TnJhMy9RRktYeGx0LzFKbXRLVml0OWk1?=
 =?utf-8?B?c2NiMlJlbFNtK0w4Tm10WkN3TStia08vRWw2L2NMQTZGK3NmbjBHeEI5WjQ1?=
 =?utf-8?B?c0QwL3NMUlY3VjkrLzRCN3U1cjhCMDIwNkNTT2xmVzV6ZWlYaS9ZZnpyTWNs?=
 =?utf-8?B?b2FPTjQ0ZklhMTJEdWo3OTBIV3FWazRyempBYno4SjVwZDNmMHFha3o4WTh0?=
 =?utf-8?B?YmxydlNjbFZRd3JJVXJDZ1dMQ0dicTJxMXJzaWlMc1EycVZ0ajlBeUduSmcx?=
 =?utf-8?B?aWprZTF4L3R2MXI2YVowZU5PckkyYVpZWEZ1NFg1YytzMGNKLzI4KzlkaFVW?=
 =?utf-8?B?Yk1xcHQyVlErbjB0YWFXY28vQVUwWVV6TGk3OGsrQWlGTldUVUtyNlJnaHdQ?=
 =?utf-8?B?bGhOM1Q5V2JXclAvdU42M0RxZlEvNFk2dzF4THRXbTZ0SUpOb29GYndBTi82?=
 =?utf-8?B?OFh1VXVSZGxGY2dxbUdOVldsaFZheU1VOUFKYlFLdUw2VURZdkEyT1RVK1NU?=
 =?utf-8?B?RHYrUHJoc2FpeXg5a2tXTU1zZjMydFNzbHh2MVF3WEVaVTc4YytBVXpYM3Fp?=
 =?utf-8?B?NXFIcWx5bUpVTmp0aG1PRkpmeE1Cc1FFdTJxNVRXWmc0TmFZaTRrR2p4ZDh1?=
 =?utf-8?B?OGhSQWtJM25NYmgwQlhPNXBRYVcycUdYRXAwamQ5aGtJKzRpMGwwaTArakxj?=
 =?utf-8?B?TjlBeFhuUnpEYlJrUEVETnBIMFI0djZTNDg4SWp4alAwZHVoRnhlWnliVEZ0?=
 =?utf-8?B?SUdBZmpQZDUrVlNpTHh6SFh4QWNqM092ZnNWMU8vUENTNy9sSXBFWlVzait0?=
 =?utf-8?B?TXlNRFhhbi93Q2xaZ2VkU3pJaDB1YTlPd2tMamxBaTU4SGdibW83OWpMTk5H?=
 =?utf-8?B?NHN3UTJjbzRyUGpTN2hkTlV0ZU83ZnFEZm1XRU05YUJyZFI3TEdWSkQxSUdO?=
 =?utf-8?B?NVNIcnpGMU5ybHhSMzgyTlNZTUYwUk53N1hQRmRUQmY2WHRMclFQSjdMcGpn?=
 =?utf-8?B?Y1F0VVVYZ2o5WDRwUzhGZnZzQ3N1WTM5MWJ4Z1BOa2IramxpK2ttR1l5cXlS?=
 =?utf-8?B?ZjRXYm1WYUlDcFpNVWVmYXgzOG9yZFJjTjA2RmNKTlQ5b3R0a0xJV2E4TytM?=
 =?utf-8?Q?afM8HRvGgw/e39HF8UrsDNex8gAAAp5LZ70om?=
Content-ID: <7670BFBF0951D141B560A656DB2C329E@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5819.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae649948-3a84-4c30-576a-08de756deff5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 19:33:37.0865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adyAmpJa7swZ6AcvnPyJYk2pY8i3CfPRcdpdV9jL/28MJfjDrmc+Bvpmn9egnZikqJYDqcTSZHSuFmAxkfCPKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR15MB5693
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE3NSBTYWx0ZWRfX8O6jcHtY/NdL
 r/XUtUVSBvu/YtoXvUR/rssgFIXAJAny+f9g6984PEh8KinHclgctXqf499ZYqMNi/8qHtZDBT9
 3j6kLH9oKnujydPJBMyxRXcp8lb27rDbQVq8Up9LURIvWj1NhDqh3EuNPEZwT/le79Xa84sCXU0
 CO6Wo6oOsnQrn0s5i1+BvKDfWe3GbeIOeqp+eKACxlkyXQ14x99Gx+fsTAMKJDII/Htxwcgzc94
 57bgqPtNA20hXWRrqhgLOWCY0TyCU245Jubneze13hEUTCxvwLASiSGt3SjT27Q1X1//c3uNoxd
 vc1HtF1M/72t30naBTIJ7YGPEW9FiNGPnQZBT7Ymf+tQ0oBXJ04H9LIZbrU40vmjG7cxQHxemJi
 XLxpBS1kHk7XgADlbdumfepoeqBWPYHTqgutBFEZECmgxe2qGtLcAxaLWSYrOnRQwZxxxKioW3a
 YC+afV+qLgkChEtxwOw==
X-Proofpoint-GUID: M-MXCEEylaJp_ApshRPMSNE2yqTOBDbU
X-Authority-Analysis: v=2.4 cv=S4HUAYsP c=1 sm=1 tr=0 ts=69a0a01a cx=c_pps
 a=ItoRIIcZIWT0tNr6APkIeA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=wCmvBT1CAAAA:8
 a=p87Qy_SXhRj_V6A2eicA:9 a=QEXdDO2ut3YA:10 a=6z96SAwNL0f8klobD5od:22
X-Proofpoint-ORIG-GUID: A99ac75_wtlLubPgvGPQMPkpOYw2QEeg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 impostorscore=0 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
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
 format strings and local variable types in hfs for the > i_ino type change
 from unsigned long to u64. > > Signed-off-by: Jeff Layton <jla [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [148.163.156.1 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vviP3-0004aM-RF
Subject: Re: [f2fs-dev] [PATCH 33/61] hfs: update format strings for u64
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,dev.tdt.de,linux.intel.com,suse.cz,arm.com,schaufler-ca.com,physik.fu-berlin.de,szeredi.hu,linaro.org,canonical.com,gmail.com,dubeyko.com,infradead.org,mit.edu,codewreck.org,hallyn.com,cs.cmu.edu,ffwll.ch,google.com,omnibond.com,linux.dev,samba.org,brown.name,namei.org,evilplan.org,oracle.com,ionkov.net,intel.com,themaw.net,amd.com,efficios.com,talpey.com,fasheh.com,artax.karlin.mff.cuni.cz,microsoft.com,suse.de,manguebit.org,wdc.com,vivo.com,suse.com,linux.ibm.com,tyhicks.com,fluxnic.net,zeniv.linux.org.uk,paul-moore.com,nod.at,goodmis.org,linux.alibaba.com,alarsen.net,huawei.com,crudebyte.com,dilger.ca,auristor.com,paragon-software.com,davemloft.net];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim];
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
X-Rspamd-Queue-Id: A17651AF536
X-Rspamd-Action: no action

On Thu, 2026-02-26 at 10:55 -0500, Jeff Layton wrote:
> Update format strings and local variable types in hfs for the
> i_ino type change from unsigned long to u64.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/hfs/catalog.c | 2 +-
>  fs/hfs/extent.c  | 4 ++--
>  fs/hfs/inode.c   | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/hfs/catalog.c b/fs/hfs/catalog.c
> index b80ba40e38776123759df4b85c7f65daa19c6436..7f5339ee57c15aae2d5d00474133a985be3af6ca 100644
> --- a/fs/hfs/catalog.c
> +++ b/fs/hfs/catalog.c
> @@ -417,7 +417,7 @@ int hfs_cat_move(u32 cnid, struct inode *src_dir, const struct qstr *src_name,
>  	int entry_size, type;
>  	int err;
>  
> -	hfs_dbg("cnid %u - (ino %lu, name %s) - (ino %lu, name %s)\n",
> +	hfs_dbg("cnid %u - (ino %llu, name %s) - (ino %llu, name %s)\n",
>  		cnid, src_dir->i_ino, src_name->name,
>  		dst_dir->i_ino, dst_name->name);
>  	sb = src_dir->i_sb;
> diff --git a/fs/hfs/extent.c b/fs/hfs/extent.c
> index a097908b269d0ad1575847dd01d6d4a4538262bf..f066a99a863bc739948aac921bc906874c6009b2 100644
> --- a/fs/hfs/extent.c
> +++ b/fs/hfs/extent.c
> @@ -411,7 +411,7 @@ int hfs_extend_file(struct inode *inode)
>  		goto out;
>  	}
>  
> -	hfs_dbg("ino %lu, start %u, len %u\n", inode->i_ino, start, len);
> +	hfs_dbg("ino %llu, start %u, len %u\n", inode->i_ino, start, len);
>  	if (HFS_I(inode)->alloc_blocks == HFS_I(inode)->first_blocks) {
>  		if (!HFS_I(inode)->first_blocks) {
>  			hfs_dbg("first_extent: start %u, len %u\n",
> @@ -482,7 +482,7 @@ void hfs_file_truncate(struct inode *inode)
>  	u32 size;
>  	int res;
>  
> -	hfs_dbg("ino %lu, phys_size %llu -> i_size %llu\n",
> +	hfs_dbg("ino %llu, phys_size %llu -> i_size %llu\n",
>  		inode->i_ino, (long long)HFS_I(inode)->phys_size,
>  		inode->i_size);
>  	if (inode->i_size > HFS_I(inode)->phys_size) {
> diff --git a/fs/hfs/inode.c b/fs/hfs/inode.c
> index 878535db64d679995cd1f5c215f56c5258c3c720..95f0333a608b0fb57239cf5eec7d9489a25efb3a 100644
> --- a/fs/hfs/inode.c
> +++ b/fs/hfs/inode.c
> @@ -270,7 +270,7 @@ void hfs_delete_inode(struct inode *inode)
>  {
>  	struct super_block *sb = inode->i_sb;
>  
> -	hfs_dbg("ino %lu\n", inode->i_ino);
> +	hfs_dbg("ino %llu\n", inode->i_ino);
>  	if (S_ISDIR(inode->i_mode)) {
>  		atomic64_dec(&HFS_SB(sb)->folder_count);
>  		if (HFS_I(inode)->cat_key.ParID == cpu_to_be32(HFS_ROOT_CNID))
> @@ -455,7 +455,7 @@ int hfs_write_inode(struct inode *inode, struct writeback_control *wbc)
>  	hfs_cat_rec rec;
>  	int res;
>  
> -	hfs_dbg("ino %lu\n", inode->i_ino);
> +	hfs_dbg("ino %llu\n", inode->i_ino);
>  	res = hfs_ext_write_extent(inode);
>  	if (res)
>  		return res;

Looks good.

Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>

Thanks,
Slava.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
