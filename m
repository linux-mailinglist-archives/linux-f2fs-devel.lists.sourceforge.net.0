Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMKmNFWjoGkvlQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 20:47:33 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A53D71AEA3E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 20:47:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmXLEvev9AoFICnJo7qERSe32GgEOK4OP2gI6VzAesc=; b=izb/q1swvzH/qAQFkdUfg3IvLg
	oWXCJX5JfnXX9Xpb3ULbZHtFrAXmPPSX9c7evaAWcpPYsCEXWbFRj8Iy8QfvlF/DAjNcHAeS+/PsJ
	7Jfssx7rEpXffRoLaFFNBIgmU+xT/UZ+balPm87pEtyKoRqolH+jAte2AFn9Qzh+pp6E=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvhKW-00088b-HI;
	Thu, 26 Feb 2026 19:47:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Slava.Dubeyko@ibm.com>) id 1vvhKL-00088E-EF;
 Thu, 26 Feb 2026 19:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:CC:To:From:
 Sender:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BwZnsWLXjqxHVojbCUwCraTX9fFdw+qOsuTst5rUlG0=; b=lUExLxA+n6wAbtWYc3vDnOisgE
 CU5FUXUjxgXNpICeHGMetnc0ABFPY4yjWBJd9A9xMjS4eN5P4ahx8QjH6YnvDm/lBcAXDHdkWDmgz
 /LlnM3DvHAoGgMfYq+YY+XV1XaCNhu43YpingSFcNwi2z93wL/sy3acjCQ+Kn7+NKO+0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BwZnsWLXjqxHVojbCUwCraTX9fFdw+qOsuTst5rUlG0=; b=jYUsSJpu994gUvxgcY1hZcT/DH
 XONDxIXAfosebUE8hKdQ/SRKXNMIsHiA9PLNezADaWDTMRswI9nQd57VfVvxJBafk5BNNcYfmLFb4
 bbMHGNOhBxlohZvaLBiQAo5SBj2N5Zmq/Q73SbH6ho25FMDVwgf2/elf3Th/dv5ltX5U=;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvhKK-0001LR-AC; Thu, 26 Feb 2026 19:47:13 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61QCiKIq2346119; Thu, 26 Feb 2026 19:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 pp1; bh=BwZnsWLXjqxHVojbCUwCraTX9fFdw+qOsuTst5rUlG0=; b=qnVe2h66
 1SoSN3GL47KeJ/fnH5UAl67+3UoXaJ5pzIX0btXNyPjbhom/nyilUmIS3uNX3ydD
 ZCR3rsnGljAkQhRxNnMnNhBVZSCeoVQnvB2H6CivNuXFOvu8vK08CXGeBzRaOLmi
 lqhl9T95SgBv73WVAtKtd0/tfkavkQyh39qYhZMeFzy10Kp/607ViYL56lCJX/AZ
 wIQyJRUFOKjaxGOA4QPEonp8uciULaNqyOAI1pVFPJl1Jpsqg/NCQIfkPCZ32SY0
 l15mjqDKVzUDgp0JzqQ4hVnxHJbPi4sI/Slu2xNePCTi/+dG9QHeIlGXZv1d0/T7
 dudfWz6/H9AkNQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11012067.outbound.protection.outlook.com
 [40.93.195.67])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ch858x463-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 26 Feb 2026 19:46:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJCVkfj+DicZ/pU9iXDGWzYIX8GYrcmyoH0MO4Gf/onM7WpMnyDaJ19UhZv3mc23npoZ4GZONmDhh4BUkVC9MgeLiHmUN09ek9e3F4cjdlPwpIAV6Lqv6NjlaUVki/H0fGNJ9/6yWxIAecN5/6WNTAFai0iwKCNETdWqbf8WAdg8TieQV0I9R+aZ/a8LW/WQpn5lL8TT1zMYrdAFbT2SzyP9d6qpOYVocJKsCOJ6+MAzRkZAg8kSi+4Vw4OvL3P4cnpaFdekxhJlggJfzWqKFJA2FKK3qxrpPFXiqF/bOc4dOQO6jNuEIROFuPXCSI12nA0zKsC90nNybAUkO47w7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwZnsWLXjqxHVojbCUwCraTX9fFdw+qOsuTst5rUlG0=;
 b=fdAS7fmpMJyh+i3s34H3GBM5QDHicjMR+ZKBAyimc5MYiHRdLPwdBuQbGQ5ljxAF6DL2qqTmnXtPJA5lotE9QV5zSlTJvIFAowmTx1M/td9P/kda3IG+S58p3xckdXKQLz3Cz6sNb5Z6h5GDMD7YM0218bJllS550YeA0uOlm40FeD2gJh0/se+MUJLFTOLMspYiC8Z59FMqWc+4Axk/4soPi/o4qObq6VdlbYzMkAWfBWsK37DbUrDd8DBQNAc9TUXFGf+Fhbwg3kv7um31u/NZq7cMXX84PcHlrdvwI1vxwaWu1Rc8ELAbiEyMS8eZ7JXy0TaH3JDe927lO8OFaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from SA1PR15MB5819.namprd15.prod.outlook.com (2603:10b6:806:338::8)
 by SA1PR15MB4324.namprd15.prod.outlook.com (2603:10b6:806:1af::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 19:46:36 +0000
Received: from SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539]) by SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539%7]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 19:46:35 +0000
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
Thread-Topic: [EXTERNAL] [PATCH 17/61] nilfs2: update for u64 i_ino
Thread-Index: AQHcpzyJpv8m+lQSEUyzpMLWkFran7WVYsAA
Date: Thu, 26 Feb 2026 19:46:35 +0000
Message-ID: <34b1d1f43043ca1b71a3ca9ea5ebce597a4c02aa.camel@ibm.com>
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
 <20260226-iino-u64-v1-17-ccceff366db9@kernel.org>
In-Reply-To: <20260226-iino-u64-v1-17-ccceff366db9@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5819:EE_|SA1PR15MB4324:EE_
x-ms-office365-filtering-correlation-id: 57079c5d-1f9f-40b1-4347-08de756fbfec
x-ld-processed: fcf67057-50c9-4ad4-98f3-ffca64add9e9,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020|38070700021; 
x-microsoft-antispam-message-info: vWcsAQgF6Gf2npYfhM1y1HUYmbVQzhwv/PXFwXYfBkWDvv0hDDqz5QRwPLRucX5MSmqufdxGRp9Mhyd8y67kGs1DUc8kgWzdHvYP5rJ2095PdNWqABnPW0aKcqqjKVpoY0a5oC7UXS9EbeiJ4zMgWC0mIJpzp0IcDa8ed2FG73X2dNrpXYAw/oF+1bk6Ftq1zv+i7bLJp1vSNi1vNp8Ks1q3WX1RfMIiZNtiK1HMo/VJiYz17UozHlQprW+9ZdyRdshJpWw54HMFXPsV71cRxMNyG7dEZgv7OfT2pv6BImgI2O5WA4cP3mGgg0AytaMnnkEY0SppaHNYqjxgTfYydpEhnaTMMFEPB7mTUOaLbJjbuYwSr29PLkfPfnsrRWScodxgbPuyCXwTm+YnZkgGzlj9IZwm4fNGRzeMlMF6faUCO06gWnacoHqg6+GJEHls2vFwSmBwGPWQd+Ohwiuan4UVnnYXYv7HEnFZtegcuk3WgZcOmDbVtSu7DQzvZpATuIC+nW9DlhRAAnzWrpI4oVMAR8uxj6hueHt1g7z/NGrMgCUfKoIkg7Dfyb1Selpwj/RjtT4MeyIfwh0cO0qJfJYVoFrIkRqkPKcgJQrizI4hbIndc/TMDeNnOGey7KQ8QbvNwHMejgPfj3b/hy4lswvFEvspDhq4EjfowRstn1K7k6EtpJWfwfBJQsmfrLn42054kB/RaxLEhzsqyK4tGqat/203B2xB4xWXNI6JjCg3neHDJhGJ4I+fSIdBlPaVWHr6WmRVzIIRNv0oJSwqr0vj4IMZXG16ubI0/It1S90=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5819.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmF6ZldKRjVGOU12dGVQejIzamJ5THd2TFYzT1BtLzVSYzI3ajR5aEF4RDBR?=
 =?utf-8?B?TGNVRmhtZm5KTTNkMWQvVE1EQ0d5M3pLbW9kbDlvU2VRWnovTjRESWNjb3Fj?=
 =?utf-8?B?UVcraVZtZG1NbXowcnJMbVY0VmN4SEV2NllBdW00N0VjMVdvMW5EckdlNUxY?=
 =?utf-8?B?WG1sOWF4N25Pa0w4RWhTQ0pQUUtrbFoyc1c0NjAzYXhQQi9SQkVMcDVYOVkv?=
 =?utf-8?B?ZGN3UkMvVnhZdlhJTGFEWmdmay80bFdMcjVXS0Q3Ymphc1hlOTRZNmRrcWNi?=
 =?utf-8?B?ZE9PbjM0OEtXUmRjOERvMHZWaEZFeUlYdWlvOHFkRGM0NTVpSWN4R3czR1o3?=
 =?utf-8?B?czVCZVV4NDZBbDg0dGtkVTljVk56a2IwUzdYbzVKVVJkOElpaUhGMlBwV3cw?=
 =?utf-8?B?Y3pxVTdRbUUyRXJ3MFVSS0VNVS9XcUd5K3M4SkFUVy9iN0RhRnhlWXFyZVRV?=
 =?utf-8?B?TWRmVFRPQU1tZzVQT0ZnK1hkRngzUGVhSDJYS3JTYmhmWDFEbHZ0K2hlL1pX?=
 =?utf-8?B?ZmREdVBPYXJiSEU4OTNoSGlXVWw4RFp6MlpMUUEvRE9TQ0tWeitYUnpvNW56?=
 =?utf-8?B?L3E5bkx2eHhQOEgzdC8zbGNJckRZUjY0WUt5aExaRzVrNEZ0aXcvVDlqTTM1?=
 =?utf-8?B?cjVmaHdoU0IwTWhxUW10cnRwY1JJbzdTWGFzM0wxZStUNUh6TXNqUDYzRWxh?=
 =?utf-8?B?TVlNamltRSt3M2FEVEN3QVR2cEEzUy9IbWNicDNUT3FwbHoxdHYyYTkyQlBn?=
 =?utf-8?B?SmhyU2VtMjV3N3dLSjIzdkJKOUpBOEFDcDNQaW8wQkdzUUF5L3hyTm5wQ3du?=
 =?utf-8?B?ZmpDWmw0a1hXZGU0NUhpVGJpdnRrVjdOYm45SGZ2QzNWTUZCQkM2czc5bDFk?=
 =?utf-8?B?TFVqcmh3bDBzV0N5dmRhMzd1blE4UXQ4UlZleE96UFZpN3d5OXlqS3dCSGRN?=
 =?utf-8?B?Z3RyaGU0ejNrV2RsODIzbDNWRW9wSjNvd0FrVWNySDRtWjdQcTd6UmJ3ZG05?=
 =?utf-8?B?a0VER2VYamVXVEtna3VJOThUY1hvNmtTOC9BM1ByT1RWSTBNMWhaYy9idlky?=
 =?utf-8?B?VWU0dlh5VlErUThaNFdaUVozUTY5cWVVbEF3dm4vdDF5SVBmbFhiSzkrZ2Fj?=
 =?utf-8?B?a0lhSW9PNXFMcE04LzBRdDFmSkljSmp6REhPa244ZlliMkdKaHRhVzB6YjVI?=
 =?utf-8?B?eUpJR0dXdnAwczk2eFZCYXJGa0ppRGlvMmEwNlRWOTgwdWtUSFlZZmRYWmpo?=
 =?utf-8?B?dXMrMVYrOUNYZW1rYzJRMmJCUGFhSStha3dSU2hsQmI3cTQxRkZQRm4ySU5z?=
 =?utf-8?B?NEN3aHVvdlFLNVJoRjZUSjBZeENISjcvWnZzdkF5TlY4NkxRcWV5SnhrNXRT?=
 =?utf-8?B?RG9MajFtclFmbkYrNzNJZmV0ZUQzdmNoTmJxb21Db0JESzVPKzl3dW55KzZ5?=
 =?utf-8?B?RStxb01RbWs2aFYrUDBCSExLOEY3U1Q1Zk9vcXhHZHNIcXdGNW5NOXpEVkdO?=
 =?utf-8?B?NkU5UlJ5M3IwQUhMbXFIL28vUzFRZk9rSDdsU3ZJRFRCN085cUJvbmhsSnBm?=
 =?utf-8?B?eFhQRlk2TXRRMUkya2cySnIySVEvdW9rK25aU0VQNmtjd0Z6bEhmTTBmUUsx?=
 =?utf-8?B?RWRCdFczdCtrdU8reTZSeXJYSWt5MC92cEkzb0RHbFN3MUs0S3VFVnJMSmZx?=
 =?utf-8?B?RTNnQ2dvaXI5U2pscFFkVENXeDhzQW53WDN3OWZuU0taUXZmY2ppMDJ1S3Vk?=
 =?utf-8?B?RC9sTkQxNVpmN3FTL1ZTNTlaVEZBOVZBMXdXcUdRR2VCODZpRCtwbFdFVzFq?=
 =?utf-8?B?UzNzVzdOcGw2QVJ4NnJTd3BLQVA3VHpRaEpLbWc0UFU3Y1NoQ3N0RHVDeHBl?=
 =?utf-8?B?Y3czNHVGN3Nqdy81c3BFTStDenRMcEtMRUpRQzZJNU85WTIwUmIvcmFnMVhR?=
 =?utf-8?B?eXdiNTFMbThzd2pjSUR6dmc1dUdjMVQvcnFSNHlXSlcyME1wOTgwTmJGM1NS?=
 =?utf-8?B?SGl1WklWeGI1QlpWZ1dUNUtqemFqQ0FKNktaTXZCalViS3hQZit0QTVyb2Er?=
 =?utf-8?B?NXdLZm5ZU1ZrcnkxNUpiLzdqd0x1TmxZTzlpTVYyNE1OQjgyNGZEUTIvdjlD?=
 =?utf-8?B?cWZvMTBpUUpERnZTQ3lvcVhPNlBVamRVeHhYZlprWXoxcy9IY2Uva1ZrVzA5?=
 =?utf-8?B?YjFXbnZlMHNWR3h3a0lLeVptS1FMWnF3U3dqaDQzc0VGMnJUMVR1RHREVDV6?=
 =?utf-8?B?dngzc1FOb0hYbFBsNzRkdmQrVVlsbm4zdmVqcVZLclBNSXJsQlNyOXBrSDJG?=
 =?utf-8?B?WXN0dEVNTkRIOC9ZYzJnMC8yQ0xMY29LTExzVEV5RnZydzlHZ3QzQT09?=
Content-ID: <992A0C5895A0CE40A43F816213D7A117@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5819.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57079c5d-1f9f-40b1-4347-08de756fbfec
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 19:46:35.4739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zUTFUR6auZkxIi8FW4j9d6CDz6OJUC0X+L6zQ2OFYQHJhG04J8mvC52XaUcWhmD+am/BP1iiwoTLItv5LdGiTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR15MB4324
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4MCBTYWx0ZWRfX1tkWG6DH+JWX
 6G7t4SFOYom77GlAT9mGRNL0pTMLthDq4guJf8WdmaC/QatydwunjjyxPd4JwdaNM1lXh7O9jWS
 IVJr5EgN/dch/Heh84SbirazSF9hdC98nmNwfBgjoblTxPy7+eqlsSPnFB1uTN1e52avV7hS801
 tuU5eqKxSFo6KNxNdeg2cMVXtG9J0kqnkwYNjJqbJUr4kcOWzP32KEvgzXypBFWNGp1g7hI9g7Z
 Q7a0t2LCbvYVwkYF65aK6lA0yZRbgxymPJa6NF5DHqQaqiZT7UAQikHf6TnN/v4q1XDh2S1anxD
 CIIjZMZuwaGzAgXZVMbX76TL1sLqn6yycBXQeFIA9gNC+Rm6WiBQbxqJuw+lY98DUba74xZVcpJ
 ntDASbGXUBB5tXCEelzVNTMp5FAKtI6ScBAQGe+cG/lnoQpHE6AV2yM5sHfsKZwm7pH4DcSUCzx
 wFCIi+WWFPf2xS7i2vg==
X-Proofpoint-GUID: CLa8-Oz9kReaca6z-p8wKPr6RTgm0Ahw
X-Authority-Analysis: v=2.4 cv=S4HUAYsP c=1 sm=1 tr=0 ts=69a0a321 cx=c_pps
 a=ButkoIHTjR5vDxq5MUTXqA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=1z-WkPR4Vt9w7pVVlBgA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: KSCiWijPrfwkaaWR8Cj1GWbK2vPb9cnq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602260180
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 2026-02-26 at 10:55 -0500,
 Jeff Layton wrote: > Update
 nilfs2 trace events and filesystem code for u64 i_ino: > > - Change
 __field(ino_t, 
 ...) to __field(u64, ...) in trace events > - Update f [...] 
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
 [148.163.156.1 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vvhKK-0001LR-AC
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
X-Rspamd-Queue-Id: A53D71AEA3E
X-Rspamd-Action: no action

On Thu, 2026-02-26 at 10:55 -0500, Jeff Layton wrote:
> Update nilfs2 trace events and filesystem code for u64 i_ino:
> 
> - Change __field(ino_t, ...) to __field(u64, ...) in trace events
> - Update format strings from %lu to %llu
> - Cast to (unsigned long long) in TP_printk
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/nilfs2/alloc.c             | 10 +++++-----
>  fs/nilfs2/bmap.c              |  2 +-
>  fs/nilfs2/btnode.c            |  2 +-
>  fs/nilfs2/btree.c             | 12 ++++++------
>  fs/nilfs2/dir.c               | 12 ++++++------
>  fs/nilfs2/direct.c            |  4 ++--
>  fs/nilfs2/gcinode.c           |  2 +-
>  fs/nilfs2/inode.c             |  8 ++++----
>  fs/nilfs2/mdt.c               |  2 +-
>  fs/nilfs2/namei.c             |  2 +-
>  fs/nilfs2/segment.c           |  2 +-
>  include/trace/events/nilfs2.h | 12 ++++++------
>  12 files changed, 35 insertions(+), 35 deletions(-)
> 
> diff --git a/fs/nilfs2/alloc.c b/fs/nilfs2/alloc.c
> index e7eebb04f9a4080a39f17d4123e58ed7df6b2f4b..7b1cd2baefcf21e54f9260845b02c7c95c148c64 100644
> --- a/fs/nilfs2/alloc.c
> +++ b/fs/nilfs2/alloc.c
> @@ -707,7 +707,7 @@ void nilfs_palloc_commit_free_entry(struct inode *inode,
>  
>  	if (!nilfs_clear_bit_atomic(lock, group_offset, bitmap))
>  		nilfs_warn(inode->i_sb,
> -			   "%s (ino=%lu): entry number %llu already freed",
> +			   "%s (ino=%llu): entry number %llu already freed",
>  			   __func__, inode->i_ino,
>  			   (unsigned long long)req->pr_entry_nr);
>  	else
> @@ -748,7 +748,7 @@ void nilfs_palloc_abort_alloc_entry(struct inode *inode,
>  
>  	if (!nilfs_clear_bit_atomic(lock, group_offset, bitmap))
>  		nilfs_warn(inode->i_sb,
> -			   "%s (ino=%lu): entry number %llu already freed",
> +			   "%s (ino=%llu): entry number %llu already freed",
>  			   __func__, inode->i_ino,
>  			   (unsigned long long)req->pr_entry_nr);
>  	else
> @@ -861,7 +861,7 @@ int nilfs_palloc_freev(struct inode *inode, __u64 *entry_nrs, size_t nitems)
>  			if (!nilfs_clear_bit_atomic(lock, group_offset,
>  						    bitmap)) {
>  				nilfs_warn(inode->i_sb,
> -					   "%s (ino=%lu): entry number %llu already freed",
> +					   "%s (ino=%llu): entry number %llu already freed",
>  					   __func__, inode->i_ino,
>  					   (unsigned long long)entry_nrs[j]);
>  			} else {
> @@ -906,7 +906,7 @@ int nilfs_palloc_freev(struct inode *inode, __u64 *entry_nrs, size_t nitems)
>  							      last_nrs[k]);
>  			if (ret && ret != -ENOENT)
>  				nilfs_warn(inode->i_sb,
> -					   "error %d deleting block that object (entry=%llu, ino=%lu) belongs to",
> +					   "error %d deleting block that object (entry=%llu, ino=%llu) belongs to",
>  					   ret, (unsigned long long)last_nrs[k],
>  					   inode->i_ino);
>  		}
> @@ -923,7 +923,7 @@ int nilfs_palloc_freev(struct inode *inode, __u64 *entry_nrs, size_t nitems)
>  			ret = nilfs_palloc_delete_bitmap_block(inode, group);
>  			if (ret && ret != -ENOENT)
>  				nilfs_warn(inode->i_sb,
> -					   "error %d deleting bitmap block of group=%lu, ino=%lu",
> +					   "error %d deleting bitmap block of group=%lu, ino=%llu",
>  					   ret, group, inode->i_ino);
>  		}
>  	}
> diff --git a/fs/nilfs2/bmap.c b/fs/nilfs2/bmap.c
> index ccc1a7aa52d2064d56b826058554264c498d592f..824f2bd91c167965ec3a660202b6e6c5f1fe007e 100644
> --- a/fs/nilfs2/bmap.c
> +++ b/fs/nilfs2/bmap.c
> @@ -33,7 +33,7 @@ static int nilfs_bmap_convert_error(struct nilfs_bmap *bmap,
>  
>  	if (err == -EINVAL) {
>  		__nilfs_error(inode->i_sb, fname,
> -			      "broken bmap (inode number=%lu)", inode->i_ino);
> +			      "broken bmap (inode number=%llu)", inode->i_ino);
>  		err = -EIO;
>  	}
>  	return err;
> diff --git a/fs/nilfs2/btnode.c b/fs/nilfs2/btnode.c
> index 56836712909201775907483887e8a0022851bbec..2e553d698d0f3980de98fced415dfd819ddbca0a 100644
> --- a/fs/nilfs2/btnode.c
> +++ b/fs/nilfs2/btnode.c
> @@ -64,7 +64,7 @@ nilfs_btnode_create_block(struct address_space *btnc, __u64 blocknr)
>  		 * clearing of an abandoned b-tree node is missing somewhere).
>  		 */
>  		nilfs_error(inode->i_sb,
> -			    "state inconsistency probably due to duplicate use of b-tree node block address %llu (ino=%lu)",
> +			    "state inconsistency probably due to duplicate use of b-tree node block address %llu (ino=%llu)",
>  			    (unsigned long long)blocknr, inode->i_ino);
>  		goto failed;
>  	}
> diff --git a/fs/nilfs2/btree.c b/fs/nilfs2/btree.c
> index dd0c8e560ef6a2c96515025321914e0d73f41144..3c03f5a741d144d22d1ffb5acf43a035e88c00dc 100644
> --- a/fs/nilfs2/btree.c
> +++ b/fs/nilfs2/btree.c
> @@ -353,7 +353,7 @@ static int nilfs_btree_node_broken(const struct nilfs_btree_node *node,
>  		     nchildren <= 0 ||
>  		     nchildren > NILFS_BTREE_NODE_NCHILDREN_MAX(size))) {
>  		nilfs_crit(inode->i_sb,
> -			   "bad btree node (ino=%lu, blocknr=%llu): level = %d, flags = 0x%x, nchildren = %d",
> +			   "bad btree node (ino=%llu, blocknr=%llu): level = %d, flags = 0x%x, nchildren = %d",
>  			   inode->i_ino, (unsigned long long)blocknr, level,
>  			   flags, nchildren);
>  		ret = 1;
> @@ -384,7 +384,7 @@ static int nilfs_btree_root_broken(const struct nilfs_btree_node *node,
>  		     nchildren > NILFS_BTREE_ROOT_NCHILDREN_MAX ||
>  		     (nchildren == 0 && level > NILFS_BTREE_LEVEL_NODE_MIN))) {
>  		nilfs_crit(inode->i_sb,
> -			   "bad btree root (ino=%lu): level = %d, flags = 0x%x, nchildren = %d",
> +			   "bad btree root (ino=%llu): level = %d, flags = 0x%x, nchildren = %d",
>  			   inode->i_ino, level, flags, nchildren);
>  		ret = 1;
>  	}
> @@ -453,7 +453,7 @@ static int nilfs_btree_bad_node(const struct nilfs_bmap *btree,
>  	if (unlikely(nilfs_btree_node_get_level(node) != level)) {
>  		dump_stack();
>  		nilfs_crit(btree->b_inode->i_sb,
> -			   "btree level mismatch (ino=%lu): %d != %d",
> +			   "btree level mismatch (ino=%llu): %d != %d",
>  			   btree->b_inode->i_ino,
>  			   nilfs_btree_node_get_level(node), level);
>  		return 1;
> @@ -521,7 +521,7 @@ static int __nilfs_btree_get_block(const struct nilfs_bmap *btree, __u64 ptr,
>   out_no_wait:
>  	if (!buffer_uptodate(bh)) {
>  		nilfs_err(btree->b_inode->i_sb,
> -			  "I/O error reading b-tree node block (ino=%lu, blocknr=%llu)",
> +			  "I/O error reading b-tree node block (ino=%llu, blocknr=%llu)",
>  			  btree->b_inode->i_ino, (unsigned long long)ptr);
>  		brelse(bh);
>  		return -EIO;
> @@ -2104,7 +2104,7 @@ static int nilfs_btree_propagate(struct nilfs_bmap *btree,
>  	if (ret < 0) {
>  		if (unlikely(ret == -ENOENT)) {
>  			nilfs_crit(btree->b_inode->i_sb,
> -				   "writing node/leaf block does not appear in b-tree (ino=%lu) at key=%llu, level=%d",
> +				   "writing node/leaf block does not appear in b-tree (ino=%llu) at key=%llu, level=%d",
>  				   btree->b_inode->i_ino,
>  				   (unsigned long long)key, level);
>  			ret = -EINVAL;
> @@ -2146,7 +2146,7 @@ static void nilfs_btree_add_dirty_buffer(struct nilfs_bmap *btree,
>  	    level >= NILFS_BTREE_LEVEL_MAX) {
>  		dump_stack();
>  		nilfs_warn(btree->b_inode->i_sb,
> -			   "invalid btree level: %d (key=%llu, ino=%lu, blocknr=%llu)",
> +			   "invalid btree level: %d (key=%llu, ino=%llu, blocknr=%llu)",
>  			   level, (unsigned long long)key,
>  			   btree->b_inode->i_ino,
>  			   (unsigned long long)bh->b_blocknr);
> diff --git a/fs/nilfs2/dir.c b/fs/nilfs2/dir.c
> index b243199036dfa1ab2299efaaa5bdf5da2d159ff2..3653db5cdb65137d1e660bb509c14ec4cbc8840b 100644
> --- a/fs/nilfs2/dir.c
> +++ b/fs/nilfs2/dir.c
> @@ -150,7 +150,7 @@ static bool nilfs_check_folio(struct folio *folio, char *kaddr)
>  
>  Ebadsize:
>  	nilfs_error(sb,
> -		    "size of directory #%lu is not a multiple of chunk size",
> +		    "size of directory #%llu is not a multiple of chunk size",
>  		    dir->i_ino);
>  	goto fail;
>  Eshort:
> @@ -169,7 +169,7 @@ static bool nilfs_check_folio(struct folio *folio, char *kaddr)
>  	error = "disallowed inode number";
>  bad_entry:
>  	nilfs_error(sb,
> -		    "bad entry in directory #%lu: %s - offset=%lu, inode=%lu, rec_len=%zd, name_len=%d",
> +		    "bad entry in directory #%llu: %s - offset=%lu, inode=%lu, rec_len=%zd, name_len=%d",

I think you missed 'inode=%lu' here. 

>  		    dir->i_ino, error, (folio->index << PAGE_SHIFT) + offs,
>  		    (unsigned long)le64_to_cpu(p->inode),
>  		    rec_len, p->name_len);
> @@ -177,7 +177,7 @@ static bool nilfs_check_folio(struct folio *folio, char *kaddr)
>  Eend:
>  	p = (struct nilfs_dir_entry *)(kaddr + offs);
>  	nilfs_error(sb,
> -		    "entry in directory #%lu spans the page boundary offset=%lu, inode=%lu",
> +		    "entry in directory #%llu spans the page boundary offset=%lu, inode=%lu",

Ditto. You missed 'inode=%lu' here.

Thanks,
Slava.

>  		    dir->i_ino, (folio->index << PAGE_SHIFT) + offs,
>  		    (unsigned long)le64_to_cpu(p->inode));
>  fail:
> @@ -251,7 +251,7 @@ static int nilfs_readdir(struct file *file, struct dir_context *ctx)
>  
>  		kaddr = nilfs_get_folio(inode, n, &folio);
>  		if (IS_ERR(kaddr)) {
> -			nilfs_error(sb, "bad page in #%lu", inode->i_ino);
> +			nilfs_error(sb, "bad page in #%llu", inode->i_ino);
>  			ctx->pos += PAGE_SIZE - offset;
>  			return -EIO;
>  		}
> @@ -336,7 +336,7 @@ struct nilfs_dir_entry *nilfs_find_entry(struct inode *dir,
>  		/* next folio is past the blocks we've got */
>  		if (unlikely(n > (dir->i_blocks >> (PAGE_SHIFT - 9)))) {
>  			nilfs_error(dir->i_sb,
> -			       "dir %lu size %lld exceeds block count %llu",
> +			       "dir %llu size %lld exceeds block count %llu",
>  			       dir->i_ino, dir->i_size,
>  			       (unsigned long long)dir->i_blocks);
>  			goto out;
> @@ -382,7 +382,7 @@ struct nilfs_dir_entry *nilfs_dotdot(struct inode *dir, struct folio **foliop)
>  	return next_de;
>  
>  fail:
> -	nilfs_error(dir->i_sb, "directory #%lu %s", dir->i_ino, msg);
> +	nilfs_error(dir->i_sb, "directory #%llu %s", dir->i_ino, msg);
>  	folio_release_kmap(folio, de);
>  	return NULL;
>  }
> diff --git a/fs/nilfs2/direct.c b/fs/nilfs2/direct.c
> index 2d8dc6b35b5477947ca12a70288d3a3cce858aab..8bd0b1374e25f8ff510f3b36dbde2acc01aafc1e 100644
> --- a/fs/nilfs2/direct.c
> +++ b/fs/nilfs2/direct.c
> @@ -338,7 +338,7 @@ static int nilfs_direct_assign(struct nilfs_bmap *bmap,
>  	key = nilfs_bmap_data_get_key(bmap, *bh);
>  	if (unlikely(key > NILFS_DIRECT_KEY_MAX)) {
>  		nilfs_crit(bmap->b_inode->i_sb,
> -			   "%s (ino=%lu): invalid key: %llu",
> +			   "%s (ino=%llu): invalid key: %llu",
>  			   __func__,
>  			   bmap->b_inode->i_ino, (unsigned long long)key);
>  		return -EINVAL;
> @@ -346,7 +346,7 @@ static int nilfs_direct_assign(struct nilfs_bmap *bmap,
>  	ptr = nilfs_direct_get_ptr(bmap, key);
>  	if (unlikely(ptr == NILFS_BMAP_INVALID_PTR)) {
>  		nilfs_crit(bmap->b_inode->i_sb,
> -			   "%s (ino=%lu): invalid pointer: %llu",
> +			   "%s (ino=%llu): invalid pointer: %llu",
>  			   __func__,
>  			   bmap->b_inode->i_ino, (unsigned long long)ptr);
>  		return -EINVAL;
> diff --git a/fs/nilfs2/gcinode.c b/fs/nilfs2/gcinode.c
> index 561c220799c7aee879ad866865e377799c8ee6bb..62d4c1b787e95c961a360a4214d621d564ad8b4c 100644
> --- a/fs/nilfs2/gcinode.c
> +++ b/fs/nilfs2/gcinode.c
> @@ -137,7 +137,7 @@ int nilfs_gccache_wait_and_mark_dirty(struct buffer_head *bh)
>  		struct inode *inode = bh->b_folio->mapping->host;
>  
>  		nilfs_err(inode->i_sb,
> -			  "I/O error reading %s block for GC (ino=%lu, vblocknr=%llu)",
> +			  "I/O error reading %s block for GC (ino=%llu, vblocknr=%llu)",
>  			  buffer_nilfs_node(bh) ? "node" : "data",
>  			  inode->i_ino, (unsigned long long)bh->b_blocknr);
>  		return -EIO;
> diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
> index 51bde45d586509dda3ef0cb7c46facb7fb2c61dd..51f7e125a311b868860e3e111700d49d4cb98fa6 100644
> --- a/fs/nilfs2/inode.c
> +++ b/fs/nilfs2/inode.c
> @@ -108,7 +108,7 @@ int nilfs_get_block(struct inode *inode, sector_t blkoff,
>  				 * be locked in this case.
>  				 */
>  				nilfs_warn(inode->i_sb,
> -					   "%s (ino=%lu): a race condition while inserting a data block at offset=%llu",
> +					   "%s (ino=%llu): a race condition while inserting a data block at offset=%llu",
>  					   __func__, inode->i_ino,
>  					   (unsigned long long)blkoff);
>  				err = -EAGAIN;
> @@ -789,7 +789,7 @@ static void nilfs_truncate_bmap(struct nilfs_inode_info *ii,
>  		goto repeat;
>  
>  failed:
> -	nilfs_warn(ii->vfs_inode.i_sb, "error %d truncating bmap (ino=%lu)",
> +	nilfs_warn(ii->vfs_inode.i_sb, "error %d truncating bmap (ino=%llu)",
>  		   ret, ii->vfs_inode.i_ino);
>  }
>  
> @@ -1026,7 +1026,7 @@ int nilfs_set_file_dirty(struct inode *inode, unsigned int nr_dirty)
>  			 * this inode.
>  			 */
>  			nilfs_warn(inode->i_sb,
> -				   "cannot set file dirty (ino=%lu): the file is being freed",
> +				   "cannot set file dirty (ino=%llu): the file is being freed",
>  				   inode->i_ino);
>  			spin_unlock(&nilfs->ns_inode_lock);
>  			return -EINVAL; /*
> @@ -1057,7 +1057,7 @@ int __nilfs_mark_inode_dirty(struct inode *inode, int flags)
>  	err = nilfs_load_inode_block(inode, &ibh);
>  	if (unlikely(err)) {
>  		nilfs_warn(inode->i_sb,
> -			   "cannot mark inode dirty (ino=%lu): error %d loading inode block",
> +			   "cannot mark inode dirty (ino=%llu): error %d loading inode block",
>  			   inode->i_ino, err);
>  		return err;
>  	}
> diff --git a/fs/nilfs2/mdt.c b/fs/nilfs2/mdt.c
> index 946b0d3534a5f22f34ac44a91fb121541881c548..09adb40c65e505d92012a3d2f5fe8a5696e10056 100644
> --- a/fs/nilfs2/mdt.c
> +++ b/fs/nilfs2/mdt.c
> @@ -203,7 +203,7 @@ static int nilfs_mdt_read_block(struct inode *inode, unsigned long block,
>  	err = -EIO;
>  	if (!buffer_uptodate(first_bh)) {
>  		nilfs_err(inode->i_sb,
> -			  "I/O error reading meta-data file (ino=%lu, block-offset=%lu)",
> +			  "I/O error reading meta-data file (ino=%llu, block-offset=%lu)",
>  			  inode->i_ino, block);
>  		goto failed_bh;
>  	}
> diff --git a/fs/nilfs2/namei.c b/fs/nilfs2/namei.c
> index 40f4b1a28705b6e0eb8f0978cf3ac18b43aa1331..40ac679ec56e400b1df98e9be6fe9ca338a9ba51 100644
> --- a/fs/nilfs2/namei.c
> +++ b/fs/nilfs2/namei.c
> @@ -292,7 +292,7 @@ static int nilfs_do_unlink(struct inode *dir, struct dentry *dentry)
>  
>  	if (!inode->i_nlink) {
>  		nilfs_warn(inode->i_sb,
> -			   "deleting nonexistent file (ino=%lu), %d",
> +			   "deleting nonexistent file (ino=%llu), %d",
>  			   inode->i_ino, inode->i_nlink);
>  		set_nlink(inode, 1);
>  	}
> diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
> index 098a3bd103e04cd09b0689fe2017380d74664496..4b1bf559f3524b1cc3965dae9fd3e5745718569d 100644
> --- a/fs/nilfs2/segment.c
> +++ b/fs/nilfs2/segment.c
> @@ -2024,7 +2024,7 @@ static int nilfs_segctor_collect_dirty_files(struct nilfs_sc_info *sci,
>  				ifile, ii->vfs_inode.i_ino, &ibh);
>  			if (unlikely(err)) {
>  				nilfs_warn(sci->sc_super,
> -					   "log writer: error %d getting inode block (ino=%lu)",
> +					   "log writer: error %d getting inode block (ino=%llu)",
>  					   err, ii->vfs_inode.i_ino);
>  				return err;
>  			}
> diff --git a/include/trace/events/nilfs2.h b/include/trace/events/nilfs2.h
> index 8880c11733dd307c223cc62ee34ebeff650ecb12..86a0011c9eeaf031cfa0b79875b2b106ef8b7cfd 100644
> --- a/include/trace/events/nilfs2.h
> +++ b/include/trace/events/nilfs2.h
> @@ -165,14 +165,14 @@ TRACE_EVENT(nilfs2_segment_usage_freed,
>  
>  TRACE_EVENT(nilfs2_mdt_insert_new_block,
>  	    TP_PROTO(struct inode *inode,
> -		     unsigned long ino,
> +		     u64 ino,
>  		     unsigned long block),
>  
>  	    TP_ARGS(inode, ino, block),
>  
>  	    TP_STRUCT__entry(
>  		    __field(struct inode *, inode)
> -		    __field(unsigned long, ino)
> +		    __field(u64, ino)
>  		    __field(unsigned long, block)
>  	    ),
>  
> @@ -182,7 +182,7 @@ TRACE_EVENT(nilfs2_mdt_insert_new_block,
>  		    __entry->block = block;
>  		    ),
>  
> -	    TP_printk("inode = %p ino = %lu block = %lu",
> +	    TP_printk("inode = %p ino = %llu block = %lu",
>  		      __entry->inode,
>  		      __entry->ino,
>  		      __entry->block)
> @@ -190,7 +190,7 @@ TRACE_EVENT(nilfs2_mdt_insert_new_block,
>  
>  TRACE_EVENT(nilfs2_mdt_submit_block,
>  	    TP_PROTO(struct inode *inode,
> -		     unsigned long ino,
> +		     u64 ino,
>  		     unsigned long blkoff,
>  		     enum req_op mode),
>  
> @@ -198,7 +198,7 @@ TRACE_EVENT(nilfs2_mdt_submit_block,
>  
>  	    TP_STRUCT__entry(
>  		    __field(struct inode *, inode)
> -		    __field(unsigned long, ino)
> +		    __field(u64, ino)
>  		    __field(unsigned long, blkoff)
>  		    /*
>  		     * Use field_struct() to avoid is_signed_type() on the
> @@ -214,7 +214,7 @@ TRACE_EVENT(nilfs2_mdt_submit_block,
>  		    __entry->mode = mode;
>  		    ),
>  
> -	    TP_printk("inode = %p ino = %lu blkoff = %lu mode = %x",
> +	    TP_printk("inode = %p ino = %llu blkoff = %lu mode = %x",
>  		      __entry->inode,
>  		      __entry->ino,
>  		      __entry->blkoff,

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
