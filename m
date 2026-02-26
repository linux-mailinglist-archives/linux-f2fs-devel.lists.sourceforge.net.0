Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kQveMIOtoGnDlgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 21:30:59 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CBD1AF258
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 21:30:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLJiDkge7hDv/z2Gcf3LCqNqUdkBk8KNZFC49XrfjQQ=; b=MXRwikIwKurqeI/1KC+uetqSwr
	kY6+QczynlFLLetNxtZ6gHf9KaIalljIpz5RvT3EIB6F2EXNtrwI1S84pyHGkImkFlDgGJPS7SaOF
	7togIPND8xpllreA75Ak5rcTixh59xJq7gXPZqttcGahnECMS/rJxAFML9Ldx/NChyRg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvi0a-0006Qp-Bq;
	Thu, 26 Feb 2026 20:30:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Slava.Dubeyko@ibm.com>) id 1vvi0V-0006QS-SS;
 Thu, 26 Feb 2026 20:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:CC:To:From:
 Sender:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EAcRJUjA6qFQ3Qprj+u9ydkV9nD17myYo+iArta8jf0=; b=WCi0Wn0yxAgWONR5wqECH73DK1
 Yq1QSB6Sa2miJiCDIpMyxMa9dNjI/qLjp2N6V+h0J1MdoxwEhk43pwg0hzmo7lBooVGTNDnXGm3ve
 K+1EwpIOlwTv6Kwx1SEGIqtiFD7tzTLAsqfh3avsRLsUbD2jtJegF9S3w9JvZ5tSv/F8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EAcRJUjA6qFQ3Qprj+u9ydkV9nD17myYo+iArta8jf0=; b=RGSNFrsGawUUzjEGaObU2/16Cz
 G/FqyVyR4kQJqJ351GV8s+GPQZW0YZuLhm84EOJJmRQzebszQMHZAZFwb4U+2Dyjz6jzPn+jlV/m6
 /wovHK2hDJsf9go6pHtJhF+ZviVji7z93HCc87jAI/YQ7qK2LD/TnJe5zVkESQEEEVtw=;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvi0V-0003KL-EC; Thu, 26 Feb 2026 20:30:47 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61QIh2sI2347021; Thu, 26 Feb 2026 19:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 pp1; bh=EAcRJUjA6qFQ3Qprj+u9ydkV9nD17myYo+iArta8jf0=; b=U81oa8Dx
 VJIYahgTlQ1qw5SGtBpnX4KPgnD/2Y+JxaDfR0UfMM3k0iVxoqDDTaoMuYWQNQqG
 Z0qmfg4uzUXv094Nlbo5gq3PkTN4hK4Eosu4xyXGv2CfViQx7ZlmMYGoHJ0AfHC9
 8mEvAxYHTTS5mBDHlM/H0Md46Dlmq4pHqKKJ0pVDfRCNTyh1E4s5/1wJFtDdsh3H
 5onUtygOGBfFtVGDLWEWK9MP5fFDRgW43cemoauSyoXwMPcVs48psw0g470ZOUjT
 eicMER9xhebqV00xLhXEo/8sOGpJ2xWYhv93/o2Qb5byVp/Sp0F5ECT2RilpPUBd
 3+5cHNvIMJPEWQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012010.outbound.protection.outlook.com [52.101.43.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ch858x2vp-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 26 Feb 2026 19:37:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXi5Fzt9BklonDHRH745U2Kp6t/tb9gcuMex6xhBDTrWzURc4UxQb+zIKT8z1diPnkzycQWwl2zCyjfJ8V/lQ+DHtb/hUECvHXd99QsiyWI/mWSUaz6BWoJyHCJ2m2lz02yr1WnIFGcMcwQISlvtn1677zL8A7rF6WEbLPUA2Pei9KeDkjJGOYfzYvzV3TSmNBBWuLWl9YpApayNMLs7VIoeEjTTA/fyYhnc8RgUy6SkUiQbpZWasdGj2HF4GIsrLzD5ZG0+Q0Fg2MQPwBLKexH0BOslTwLg+9QSUXo8JszR8Nmat/aks6ZE5p3josNvhR3haiT2gW74Tiswd7x17w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAcRJUjA6qFQ3Qprj+u9ydkV9nD17myYo+iArta8jf0=;
 b=MlXssxLyAsZ3VmaxA9ev73BmW41KyrTkGmBy7Ozz2OUlwROfBN0aNM6gtfKH7Aar1o86eEvYyI2vkRLz9GF4IBYrk2PVPQFvpX1I2ytHXHu0s9EOELJ2puKRaFcLam4SOlTAT0lnxBIJ+5lPe90SyGLRQQxHmXKhKhBbys15DTE0eZiLBjDOPtIzpSXwasrKcnhdE6KqG2rTnlaA6TLzjh+Eh317uKWH+7zdwSExFQXIkCby7z0bRSUXzBJ9U4tl79BbfzYAa4Lg+ITtv2/NycIVKBXJ8gyk4lKp25evRU/nEHVFQ1/ix9hLbti2wScpWxPUkmhN4tHj6RH666j2jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from SA1PR15MB5819.namprd15.prod.outlook.com (2603:10b6:806:338::8)
 by MW3PR15MB3979.namprd15.prod.outlook.com (2603:10b6:303:4b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 19:37:12 +0000
Received: from SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539]) by SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539%7]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 19:37:12 +0000
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
Thread-Topic: [EXTERNAL] [PATCH 25/61] ceph: update format strings for u64
 i_ino
Thread-Index: AQHcpz/qP+5RsTPDR0u+eFzUdkpQnbWVYBsA
Date: Thu, 26 Feb 2026 19:37:12 +0000
Message-ID: <2dc7436752b669bc89d6dd93383c2d39984c46c5.camel@ibm.com>
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
 <20260226-iino-u64-v1-25-ccceff366db9@kernel.org>
In-Reply-To: <20260226-iino-u64-v1-25-ccceff366db9@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5819:EE_|MW3PR15MB3979:EE_
x-ms-office365-filtering-correlation-id: a5adee3c-c3f3-4ed9-2e8a-08de756e7071
x-ld-processed: fcf67057-50c9-4ad4-98f3-ffca64add9e9,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003|921020|38070700021; 
x-microsoft-antispam-message-info: 5fAop6Y+c0rBIIAM5zdAFzmRMfjmCzBGaVG/qQGQ6CjcvM886WFhhh76f+2dLvyUUXJhpxgKsGUckO8EKr6r16GCPPZU/m/yNeJt9zBBaz5uKsDgz0T3NeN8fXCavMt73c1cMsJiM8VaOhs4/m7lZU86aOuON1CHtOcJJrV11dQvmK6wkEzMTFAeFkecCPqaor0+1woQGNsEUexs0r5GUL7jg+qlIbgL7yrBNu9R5mULR8wsnVTa8P0V8vSILW6Sz9grUwkA/ieJuakRCHxy+vE9j7n4E1vpK2w4+j34+WOa3uDbT9ZUe2zJmXC+BvhMzchZ7MpZAr1f3DeyTCQRwiYOM1r25l1lryhZwkqZATx4nfvS3sFUrt+xDqW6j3RdyYbPLVHVR/zZGg6u8zOaZc6pKozMuYbkAuIl6JhYcfBGW7GyVofjaEdHPHf5Z381ElhJAfNc3/Eg1hLSqnQLFgOztGVWoK4MW2YbcPQLVxkL/a88b6ox+gwTrpD2lA5NmsyA6oIfP/Aeal7QZJV2eWgElQvWGqXLnJZvzpOlEVBfLgjIUGlx0EEYBQc584solqtSIZETwocFATv6cIBS34xI+Hpdm2ZI4W95hymoW9yBuipViqiAs6LOyoIoTQC+v3Csmya9JWFobwSYKoUBYOnARA0yDXyBGGrJ4efdDFs/Eh/Fheg8bcFMX8lI2OrDzokzS/G/xO8bWxrIavaWdnr+1Sm2WcqkLLK7JWSliX5Acs68D+F+c5qrsR+GCqq6nxtxy3bbUQWJEUDYsT8vVz9QH0d/RB6hoPIV6QIeaNkqtNy8Uf06PuOZ8ADGIpX2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5819.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cC9aQVZOZWtnc1h5REptT0hOZ1F3VitIeVFDOUtGdCtDcjJiZTkxVWZEeFBO?=
 =?utf-8?B?RVdFMUlUbzJIbzRDZ3QySERRZk1JbGtZYnowbUMvY2FxaWlBdldoVlFYMXpk?=
 =?utf-8?B?MzlOSGVFT3Y0R2U4em9Mc2J6eS8yTXZ4TWRWZTVTb0tGa0dwVzJobXRDVXdV?=
 =?utf-8?B?TXllNHp0Zjl1czRnbHFWc2tsSERtRzVYQVJ1aDE0Q2g5OUFDakZhYzlaVTlz?=
 =?utf-8?B?NjVDVEcwWmVaWjhsQXI1TWpWcmh2cE5ScEE4MmZGaVd1SFJuU2g2emlhMy9o?=
 =?utf-8?B?RFExNzZGdXdOOVpoZEJkdHM0YUs0ZWZKLytOaURKbGVhRTEySmZFdGhjUEJl?=
 =?utf-8?B?RnNQRG1qZTBFN1lkcHFTZ2wzcUp1SEg0TFQ4N0dxT2dXZzRWdGRiakRkbkV3?=
 =?utf-8?B?bGJIUEtDY05La05QNTA0K0YySFNTbDhpT3MrM3Jna0tnRXZHL1V1K0k0ZU55?=
 =?utf-8?B?RS9vd2RNbDlUNlhCMFovYXMzVC9JUm9Kc3EzSVUxNXRvK0RIdElsV3lISlFX?=
 =?utf-8?B?SW9Va1lNb2ZBNzNkS2R2bEZXUmlmMm9wdEVnQkc3TElRNXE5Ylh4UC9Sak5C?=
 =?utf-8?B?N3NiczN5emc5b3NuQ3IvbG5ndUx3MUVlcXg4cVZ4cWRpbmZ1cW9ibVIxN0hm?=
 =?utf-8?B?bGFiRVlCUVVzUHZYUWsyaEhRaHhDMC91V3JHZVlqcEJVb0lhRWlXNFR2RHpi?=
 =?utf-8?B?Vm9uaG1rVURXV0QxUDhIdHZ2d1psa3FrOWNHSFhZMXQxK1BwWHN5cGhVZy9X?=
 =?utf-8?B?Tnp4QTQ0dDlQS1ZYTG9UK3g5b1hwS2dMV3VYWWdNNGY0ajJxYnhBMm4vdnhl?=
 =?utf-8?B?UDN2a3pha2hKWVZDQ2E4MnRTMFRyMk9RR3g3dlNlN2FqNTJQOGY3Qi9sb1JQ?=
 =?utf-8?B?TVdyNlpWc2hSa0o2aStGZ3crc244R0hhY2JvSUhMSzhpajROREIxUm5na0pw?=
 =?utf-8?B?L29mT3NNcTlNL0dQOVM2ZE1RVmVESUgrRWNuUk1HOVJJT0tWNGpGUzJHT2tv?=
 =?utf-8?B?L09OMjFhTVZqY29hT09oUzhXNVYwWVpqdm1PZ3hEcUd3eForMVpqdTYxSm42?=
 =?utf-8?B?bVVQSUJoa1ozYnZTMzdwMzZ0TWcwTmMwdHI0UjMwU1hnd29NNHRwYlhRbXR4?=
 =?utf-8?B?TTNDaTJPbGVZemFyQWJNS2dVa2VSNDFzSnREbTZNcDNKQmN0NitYc3ZoZmpG?=
 =?utf-8?B?V0xoTnBnL3BjQ2t3SjdHZXJ6ZGFiQU9NQUVBRlQvZkdqTnJuT0o2VUdoNDg2?=
 =?utf-8?B?YUVDc3VqVjN6NS9Fc21TQXNSNFNkSjVNYm1WSXZxaXVhV05jSEJQV0lvVW0r?=
 =?utf-8?B?QUpsY2pmSmVyUTk1cXluc25QUjNkdlBWZGRiL2hzOVVjbmJTKzB4WS9zKzRi?=
 =?utf-8?B?cEpyNnFsaGNsYi9mNVdZVlJnVlBacDZsR2U3U3A2Q0hvU1FmWnBGcUI5ZDB3?=
 =?utf-8?B?anI3aDI1SzRNUGdSUkw4aHRNOHIxSlRmVnplcFN3K3ZGcm5Na1BpMmxsaXVl?=
 =?utf-8?B?U3NHcjJSWFUvRmNkcGUrOTVyV21DOS9sNjlESE9TY0FrQU00ZktrWGhmVFBh?=
 =?utf-8?B?RG80ZG9KNXEyT2JxdjZtSVBQdHEyc0lxRUU3YXhPTDBaVU9nNG12T3QrZ3pM?=
 =?utf-8?B?bkhxNlJhUm9lbHZMaVFUdmhsd0FkRi9ydzZJQ21VaHY3OFFheWNtano1Yys2?=
 =?utf-8?B?c1ZrRCtFNVhMT0Y2K1ZUOTRkY3RPRzlTejQ2YmlITnRBSzN5U2NsdlhiNjBB?=
 =?utf-8?B?SG5SWXNmYUZBUzhVUFdMSHVmUm0zKy9kOEcrM3Q0aStieXhEQ0FOUWxRczRV?=
 =?utf-8?B?OThycHF4d1ZnLzVjdTJqckFHNXZXUVVhK1k3eHZRYUtlV1hsWVZHRkhqaStL?=
 =?utf-8?B?VkU3Tjd0NUNVZUt2a3VNc1NQckhEWnYxaEh6T0NJQ0ZBUTFEeC9SOVFKbU0y?=
 =?utf-8?B?a1pSNnNMMDRMbFg3aWM3K2RoU1NZNElocUhxUXRGMnZxYjY3VW9waDNGeE9l?=
 =?utf-8?B?MUUzSmxicUp5Rm5LNnhGVlJxekV6RHpLVXlndDkxUXNRN3RUbEZha2ZwMHd0?=
 =?utf-8?B?M1BsM3dPTFdHdXRGQzhLdjdMS0VrMzBMUy9tNlc2Wm93ZzhkK0JJeDBJcG5n?=
 =?utf-8?B?L3NSSmY5ZEJ0RVVjOStLUXp1VkQ4RDdDVThPblVlTXA0eVVGY3VVQ0o1cVpm?=
 =?utf-8?B?SVgvbUNlRDlYZFpvZ3dmRnZ3Vm93WG5hODZZaERyTXBhRnFmRWhibHBKTEU1?=
 =?utf-8?B?MjZ3VU9vR1ExdFpYV3gybGtQWmkyUkpNL3FJU0lVQWxMVTRpUCtld3drajRH?=
 =?utf-8?B?dnFTeEpVQU8yYThkbzJMYlBERGJRbTJLVTRsUXlCVUcwZjFTaW5Sa2Nmd1ND?=
 =?utf-8?Q?Q/PNynifrdCZV+7AIWflqeYiP/1hBJ6+f7CkR?=
Content-ID: <9AADC9488CFA3047AEEB4B0F579550AD@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5819.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5adee3c-c3f3-4ed9-2e8a-08de756e7071
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 19:37:12.5896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9KMX2W1ASDUFAixb3cwXeAo4woeyJLGEvs/YWKCYUMSHP/utu3m71iZmf0Yus9pG48RkVfQ0cHwonftiiqUksQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3979
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE3NSBTYWx0ZWRfXwWDeEe6zew1W
 YEpIK0j3jdO55oVI9qeTD38bEU//DVyz4p043cMiRQcBE3h+BH9nz9XLY27c80cCrJVafpymeLu
 H9OEP+7tkpSfHAsPYeYyHkO92MCwALW1OqOWNmbaPuVtWuCmsm/boQF5/TdElEynQbpCXlAmQk5
 e5E+EH7mpbZgT1TToziEDxU5iYoHu5OdV11uM9ZYEAQ54zCinx9+uJ+beofJx0rbm0IRu4ShlP2
 kSsfx1T12m1c9ZjsHgFmqvoNZbfzfAlyIJGVO2jTcHbHl2eyctGsQpLBywTgPrXwj7EvK6jiDjc
 Lx5hc88JN/DO4uy+HasFamVxmUzo57nFFoHJFcAX0tADOAzfdoIwJgRCnQHlEAQaE8W5bGUUBFz
 ukSaDGMefdktKLfhtHIJOm63RfvNqbQ7IhX5CxhpOk60LGzuMD8876+4//+YLBttcsJZEsI1jgY
 xdBqMzmigHLxlEgtZSg==
X-Proofpoint-GUID: EGvDmIpAFepwg6tEAP_3Za_C34G24qcy
X-Authority-Analysis: v=2.4 cv=S4HUAYsP c=1 sm=1 tr=0 ts=69a0a0ec cx=c_pps
 a=a15oepxCFtbapkdjUscCyA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=zr94bLkQGwJZMLBWZqwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 9voucK_jFeHexuibvw3JeTspnur0tvyu
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
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 2026-02-26 at 10:55 -0500,
 Jeff Layton wrote: > Update
 format strings and local variable types in ceph for the > i_ino type change
 from unsigned long to u64. > > Signed-off-by: Jeff Layton <jl [...] 
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
X-Headers-End: 1vvi0V-0003KL-EC
Subject: Re: [f2fs-dev] [PATCH 25/61] ceph: update format strings for u64
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
X-Rspamd-Queue-Id: B5CBD1AF258
X-Rspamd-Action: no action

On Thu, 2026-02-26 at 10:55 -0500, Jeff Layton wrote:
> Update format strings and local variable types in ceph for the
> i_ino type change from unsigned long to u64.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/ceph/crypto.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ceph/crypto.c b/fs/ceph/crypto.c
> index f3de43ccb470ddbd7945426d79f9024ae615c127..3c8a21a572d8230b558f20bb02721184cae35ee6 100644
> --- a/fs/ceph/crypto.c
> +++ b/fs/ceph/crypto.c
> @@ -272,7 +272,7 @@ int ceph_encode_encrypted_dname(struct inode *parent, char *buf, int elen)
>  	/* To understand the 240 limit, see CEPH_NOHASH_NAME_MAX comments */
>  	WARN_ON(elen > 240);
>  	if (dir != parent) // leading _ is already there; append _<inum>
> -		elen += 1 + sprintf(p + elen, "_%ld", dir->i_ino);
> +		elen += 1 + sprintf(p + elen, "_%lld", dir->i_ino);
>  
>  out:
>  	kfree(cryptbuf);
> @@ -377,7 +377,7 @@ int ceph_fname_to_usr(const struct ceph_fname *fname, struct fscrypt_str *tname,
>  	if (!ret && (dir != fname->dir)) {
>  		char tmp_buf[BASE64_CHARS(NAME_MAX)];
>  
> -		name_len = snprintf(tmp_buf, sizeof(tmp_buf), "_%.*s_%ld",
> +		name_len = snprintf(tmp_buf, sizeof(tmp_buf), "_%.*s_%lld",
>  				    oname->len, oname->name, dir->i_ino);
>  		memcpy(oname->name, tmp_buf, name_len);
>  		oname->len = name_len;

Looks good.

Reviewed-by: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>

Thanks,
Slava.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
