Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJzWNFkOpmmFJgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 23:25:29 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B62E51E550A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 23:25:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TaleOnFKipB253CeNUV5Qdpo/UsHOrRcBRlAhozIdHQ=; b=b1CV8Z2Q0IlxEKJJ4QTKCRs92d
	p1YB2gffe51bgqPBbDMoiH99u4+4npGuTroCKFm1NCg997s5m3yOXaXtk7z+85wZ1//9dO8Ku7Qu2
	fg/APHHuzqImDXUqd9JfgVlD499iydZwRGuClZX1L9ypT/PoxyFsn0dreq2ybTJw1Kjo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxBhZ-0006EX-Cr;
	Mon, 02 Mar 2026 22:25:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Slava.Dubeyko@ibm.com>) id 1vxBhX-0006E7-9P;
 Mon, 02 Mar 2026 22:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:CC:To:From:
 Sender:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l0dcDC+O7W0aDklkK2cKVSi+A0+5Z+JWwv4GBK6THQA=; b=ClBHoQKEhQiie6TyHzujzxgOAx
 Apa27LH1jYbUDK+V9ZRZ/9K8wTLXaxBkRJsZ+5+PivoKghIqxHx6Bepx5ejV5zVBQGFAQpR6KP8yd
 Ujx2xhBVS/EJW9jyfYnswGCagobiEbaQJX9D3cNbRVM2fubaH2DamEBO9KfOFqxLtB78=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l0dcDC+O7W0aDklkK2cKVSi+A0+5Z+JWwv4GBK6THQA=; b=KIw7kByTChokwpV10qSrct/4Ue
 H/x5UusXTAnra1sh61cURa8GNKtwwE/ljx1eIIzLZcIwrkwGemAqdpVyrhpavodZfcTQpBlLZwPi4
 ZslDcZdFWy3XHEOmVYgyNRq0jKcOTuQ2QHKKR0V4qSIQi90agRcKKtlHapgvWKh43ZQo=;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxBhW-00043W-OQ; Mon, 02 Mar 2026 22:25:19 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 622FP1gm2104794; Mon, 2 Mar 2026 22:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 pp1; bh=l0dcDC+O7W0aDklkK2cKVSi+A0+5Z+JWwv4GBK6THQA=; b=ewGud6kx
 0aArwU38lEu1ddfv0FNTb3PfvSNJVdNKkIp/x0uLTqQjJrHWSmUfw0hcl3baTqjp
 AWAfXs+7iPA55faatm1OGR8RlPyrSRGprjmYu7NoqktBwMqVfARgM2v40Nj40gJ7
 KSnx47ak7C0SccKgfjMGWuAar9TU4sjVpylE6bFtnHoTHqAGR4rcq2oajCCJBqQs
 erF5BNeWjSjBceeLt9dys0wATXqs5Cu1ET2GgQfCG0OV1c2jCaIQUSlG9ZNCz14D
 9+3eWDbPqSdbe+KVF24W00GUQ16MusdB6D/gzkpHZ5LIRKZe4q+HF6qca1XinkpE
 HQCp40u9JQJ9wA==
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazon11011053.outbound.protection.outlook.com [52.101.52.53])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksjd8prg-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 02 Mar 2026 22:24:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1CDRonlGTPJIPiIz3yA/iGJ0jITt7cOCIW4EgR3QhW7Yp7pNWpcWBRqJQMntR3ulxW7kGRxA7L9lqqQcmGhxdKvoaRk2eRUVVZRU6JYN8wJ/TlcFf/6/lOBMvZBg7cLpCgxufi1AKnQpbHnLoiY2gY/PwkuAn9LoCpp32Jo5ToD1MVYDN/ZPmanjGOIhXRkVz+lmKMsE7mI8lzKh5lFhPkRkdMKPFG02PmuezCRKmetBDEWP7D9Qf8sBa1GPbNX9VPN7Ggl3v4DQn7SmZfHYfMrJgYcrUYx3+5v7QxuOXuuueo6JAH+LRqqg4ajbU27pwRVFL/y79puheAfUXvcQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0dcDC+O7W0aDklkK2cKVSi+A0+5Z+JWwv4GBK6THQA=;
 b=vZR88VwgS2HhAp2V8HTyweVQ039gzhWhv6iEoGH3rzY7Qkc1Eu3gV8TKJ+axUUzJL0XgaQ/xDFLfxgNb2VL9ciY5rQlaYIf1enJiICTnXwQR83ww8uXzGQ5fhVCDVQOzw5MglnFXZ70apG9UuT4vab2hMTKqeE1z4UpMpdbXn2euKmAdxvJ0jk37pdpdXqkUcdT2aRUWZ9I4u/wR1ulg59Y+Fxuc8FFVezlnFEfj+Ae76LuWKBwdJrmlkg03jK1/CkztGnzPABiPuRhDAkNAENwiLBPMfQrcf1NCUSXvT2iB/ul+MC8VZ90A0aInmLeCan7r+ST5bqlO74b776t1Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from SA1PR15MB5819.namprd15.prod.outlook.com (2603:10b6:806:338::8)
 by SJ0PR15MB4423.namprd15.prod.outlook.com (2603:10b6:a03:374::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 22:24:36 +0000
Received: from SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539]) by SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539%7]) with mapi id 15.20.9632.017; Mon, 2 Mar 2026
 22:24:36 +0000
To: "socketcan@hartkopp.net" <socketcan@hartkopp.net>,
 "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
 "jolsa@kernel.org" <jolsa@kernel.org>,
 "jreuter@yaina.de" <jreuter@yaina.de>,
 "Dai.Ngo@oracle.com" <Dai.Ngo@oracle.com>, Ondrej Mosnacek
 <omosnace@redhat.com>, "davem@davemloft.net" <davem@davemloft.net>,
 "dlemoal@kernel.org" <dlemoal@kernel.org>, "trondmy@kernel.org"
 <trondmy@kernel.org>, "namhyung@kernel.org" <namhyung@kernel.org>,
 "almaz.alexandrovich@paragon-software.com"
 <almaz.alexandrovich@paragon-software.com>, "miklos@szeredi.hu"
 <miklos@szeredi.hu>, "john.johansen@canonical.com"
 <john.johansen@canonical.com>, "stephen.smalley.work@gmail.com"
 <stephen.smalley.work@gmail.com>, "nico@fluxnic.net" <nico@fluxnic.net>,
 "maciej.fijalkowski@intel.com" <maciej.fijalkowski@intel.com>, Olga
 Kornievskaia <okorniev@redhat.com>, "amir73il@gmail.com"
 <amir73il@gmail.com>, "tom@talpey.com" <tom@talpey.com>,
 "joseph.qi@linux.alibaba.com" <joseph.qi@linux.alibaba.com>,
 "paul@paul-moore.com" <paul@paul-moore.com>, "asmadeus@codewreck.org"
 <asmadeus@codewreck.org>, "alexander.shishkin@linux.intel.com"
 <alexander.shishkin@linux.intel.com>, "mark@fasheh.com" <mark@fasheh.com>,
 "linux_oss@crudebyte.com" <linux_oss@crudebyte.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "willy@infradead.org"
 <willy@infradead.org>, "ebiggers@kernel.org" <ebiggers@kernel.org>,
 "lucien.xin@gmail.com" <lucien.xin@gmail.com>, "bharathsm@microsoft.com"
 <bharathsm@microsoft.com>, "marcel@holtmann.org" <marcel@holtmann.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, Eric Paris
 <eparis@redhat.com>, "djwong@kernel.org" <djwong@kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "hawk@kernel.org" <hawk@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "james.clark@linaro.org"
 <james.clark@linaro.org>, "john.fastabend@gmail.com"
 <john.fastabend@gmail.com>, "dsterba@suse.com" <dsterba@suse.com>,
 "kuniyu@google.com" <kuniyu@google.com>, "hch@infradead.org"
 <hch@infradead.org>, "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "ncardwell@google.com" <ncardwell@google.com>,
 "sprasad@microsoft.com" <sprasad@microsoft.com>,
 "marcelo.leitner@gmail.com" <marcelo.leitner@gmail.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "jack@suse.com" <jack@suse.com>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>, "frank.li@vivo.com"
 <frank.li@vivo.com>, "alex.aring@gmail.com" <alex.aring@gmail.com>,
 "luisbg@kernel.org" <luisbg@kernel.org>,
 "ms@dev.tdt.de" <ms@dev.tdt.de>, "jth@kernel.org" <jth@kernel.org>,
 "jlbec@evilplan.org" <jlbec@evilplan.org>,
 "aivazian.tigran@gmail.com" <aivazian.tigran@gmail.com>, "anna@kernel.org"
 <anna@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>,
 "tytso@mit.edu" <tytso@mit.edu>, "willemb@google.com" <willemb@google.com>,
 "eric.snowberg@oracle.com" <eric.snowberg@oracle.com>,
 "johan.hedberg@gmail.com" <johan.hedberg@gmail.com>, "acme@kernel.org"
 <acme@kernel.org>, "ronniesahlberg@gmail.com" <ronniesahlberg@gmail.com>,
 "jaharkes@cs.cmu.edu" <jaharkes@cs.cmu.edu>, David Howells
 <dhowells@redhat.com>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "courmisch@gmail.com" <courmisch@gmail.com>, "martin@omnibond.com"
 <martin@omnibond.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "jmorris@namei.org" <jmorris@namei.org>, "adilger.kernel@dilger.ca"
 <adilger.kernel@dilger.ca>, "idryomov@gmail.com" <idryomov@gmail.com>,
 "brauner@kernel.org" <brauner@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>,
 "magnus.karlsson@intel.com" <magnus.karlsson@intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "coda@cs.cmu.edu" <coda@cs.cmu.edu>,
 "casey@schaufler-ca.com" <casey@schaufler-ca.com>, "raven@themaw.net"
 <raven@themaw.net>, "horms@kernel.org" <horms@kernel.org>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>, "kuba@kernel.org"
 <kuba@kernel.org>, "muchun.song@linux.dev" <muchun.song@linux.dev>,
 "chao@kernel.org" <chao@kernel.org>, "mathieu.desnoyers@efficios.com"
 <mathieu.desnoyers@efficios.com>, "hubcap@omnibond.com"
 <hubcap@omnibond.com>, "jlayton@kernel.org" <jlayton@kernel.org>,
 "sdf@fomichev.me" <sdf@fomichev.me>, "roberto.sassu@huawei.com"
 <roberto.sassu@huawei.com>, Alex Markuze <amarkuze@redhat.com>,
 "chengzhihao1@huawei.com" <chengzhihao1@huawei.com>,
 "mikulas@artax.karlin.mff.cuni.cz" <mikulas@artax.karlin.mff.cuni.cz>,
 "ericvh@kernel.org" <ericvh@kernel.org>, "salah.triki@gmail.com"
 <salah.triki@gmail.com>, "osalvador@suse.de" <osalvador@suse.de>,
 "dmitry.kasatkin@gmail.com" <dmitry.kasatkin@gmail.com>,
 "sfrench@samba.org" <sfrench@samba.org>,
 "serge@hallyn.com" <serge@hallyn.com>,
 "wufan@kernel.org" <wufan@kernel.org>, "al@alarsen.net" <al@alarsen.net>,
 "pc@manguebit.org" <pc@manguebit.org>,
 "ast@kernel.org" <ast@kernel.org>, "oleg@redhat.com" <oleg@redhat.com>,
 "slava@dubeyko.com" <slava@dubeyko.com>,
 "konishi.ryusuke@gmail.com" <konishi.ryusuke@gmail.com>, "lucho@ionkov.net"
 <lucho@ionkov.net>, "dsahern@kernel.org" <dsahern@kernel.org>,
 "shaggy@kernel.org" <shaggy@kernel.org>, "richard@nod.at" <richard@nod.at>,
 "marc.dionne@auristor.com" <marc.dionne@auristor.com>, "neil@brown.name"
 <neil@brown.name>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "mkl@pengutronix.de" <mkl@pengutronix.de>, "david@kernel.org"
 <david@kernel.org>, Ingo Molnar <mingo@redhat.com>, "jack@suse.cz"
 <jack@suse.cz>, "code@tyhicks.com" <code@tyhicks.com>,
 "steffen.klassert@secunet.com" <steffen.klassert@secunet.com>,
 "naohiro.aota@wdc.com" <naohiro.aota@wdc.com>, "zohar@linux.ibm.com"
 <zohar@linux.ibm.com>, "chuck.lever@oracle.com" <chuck.lever@oracle.com>,
 "irogers@google.com" <irogers@google.com>
Thread-Topic: [EXTERNAL] [PATCH v2 023/110] ceph: use PRIino format for i_ino
Thread-Index: AQHcqoXKM4Zi3kyuqUK+uAhoRZrmrLWb0aUA
Date: Mon, 2 Mar 2026 22:24:35 +0000
Message-ID: <da18663467d93a61e99cd4dfeadca88d25df739b.camel@ibm.com>
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
 <20260302-iino-u64-v2-23-e5388800dae0@kernel.org>
In-Reply-To: <20260302-iino-u64-v2-23-e5388800dae0@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5819:EE_|SJ0PR15MB4423:EE_
x-ms-office365-filtering-correlation-id: 28eda2af-4d03-402d-f7e4-08de78aa7c59
x-ld-processed: fcf67057-50c9-4ad4-98f3-ffca64add9e9,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|38070700021|921020; 
x-microsoft-antispam-message-info: MKmYxQnBkoDWsH9ac9qJ4KWzrYFzARTQvLQUqhVW/TOnH1N2seZ2NCni3Kp9pJvkfcU9YagaiYK850PBRrArS1QpF0Gadeo/DxEq0J3Mufs5cFBOzKQ2qboBImlYOVWvJCSm1CbLs0TEQxpijVRaIhPPD3FxDBbJFMLCFA8+saVLMKzDjQkbSNoBvH1xd7Ne8XOY7xOVxiTHBWUVUcwpgDn0TUaZa89W2HTZGMcfNd0lRp6m5Wn9g4aNVjmEPYoMmwTfAJM/aUfuWtvLKVLAuwbSY3E3XUb0LEKOFGxxAJI2t6H/5sm3G4CeRoBfxdl2RmW4Db634dgROLQz5UpCfIDF5muEv25+h1QzwhuTj+y1H4U5KVFjBPHz3G1Bqf0uBa6HOXkX3RBFf7ox9tToScqgWnHMhWX9EY1Tkn912mrc1ytmWq6x5H7shbUUW+xqUM3eB7/iTwI/DmQv3x+ssweEIZr3Orhrdld0oPb+0uMaCjvvlTYMwFewYxnDklOAy1A1vBH0iqnb4DkRehNEMmkZST5bMdrDNW/YgYdXp9n9FTDlKbDSXNBLdnRI19czAkkMDotJIarOecYAYxDKxWFFDG8X6gONvpe3ZEMMWD7rA0DRMhbFihviIRdaCkL9s/T2rIgYdc6oUTSCTK1JTTgKWZbcivSVyIaHVpu2LP+4Q/uoWlbV8Lkotlq5i33XmSA7M5d6Z1W0AKwz42uK42yPEmBDat4CB8K5BoAEwg+7JeWKAE6WadpaTnX/ntxVAg+kWbdVLQK6nCR9H43Q7AOqKZRYlpHRewyS51HhbuiET499oQ/eL/NowB/e0iD2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5819.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zm1CT25ySGt5YWxyekNRVCt5R0txQXpzUmpiZS9ITkYrN1RSOEk5VUhncUhN?=
 =?utf-8?B?YTRJUWlsZmt4RTBMR0N5TzQvaTZNazVMUDNPY3JXL0RiWS9Bb2dNbGlFcC9B?=
 =?utf-8?B?cC96OUQrTUFjOWhmR0hObFNxUGdBTnZwbzVYRkdJZWNoaG9iNnFGNkRYdmh5?=
 =?utf-8?B?NFF2dUxyYjNZVXVpZjJTTjVrL0N1MmpZN2FZTk4zcnAzUzhQUlk5ZExYK1do?=
 =?utf-8?B?WXp5R3R5Q3RSWFNQWVBpcUNEK01rZWppWVJRTXVuVGF5VzdXclhtK2tKU2JQ?=
 =?utf-8?B?bUZnMGkycUE5cjloOUhpdTAvWjh4bVJFdnFsSlhLQ2Q1c0VkOW16SjhycnpD?=
 =?utf-8?B?RWZzQ1ltYWhTUk9YY2tzemh4U0w5YkxZZUtNNk82em9MWEp6MVpRMy8xK05t?=
 =?utf-8?B?YlFrbUppbUd5YlhsK0VUV29hMVJQRkdNbkY0OC9ydWo2aEtkY2paY3dFNzda?=
 =?utf-8?B?a3BMaTU1VmNxK1lJVFJ4SDV6eW5rZDVJU1QwRzB6dHQzSkFqbkF0cEROZFFo?=
 =?utf-8?B?YlI3QXdVMXc1Z1ZFUmNkT0pmaHF3Yk5rTHoxb1o4Sm8rMEl4UFpCMVorbU84?=
 =?utf-8?B?NkFJYk5GYlV4bzNmZEhsZE53OTJkMWYrNnhLbGFDYTNZS2V3OEZUbWlwU0FY?=
 =?utf-8?B?bitlZ1dYaE1kV21DWVdrRkJNUVFIZmtQcXJFcjIrSDRaSXcwZXczbVE3a1hJ?=
 =?utf-8?B?OU9Lb0hqc2FacWFvUzRGRjk5ODJtOFZKWGtETGRma2NNQ2QvVnVLL0svbit5?=
 =?utf-8?B?SW04QzRvVWFFaURybDlDVWwzSlBsZSs3Y3BIbmE3WjFUc1ZwMlVRdm5SODRY?=
 =?utf-8?B?b21ERTVzM1lyVEZzQW9RSStyNjllR0VBZS9jemNqRk1VOExvVlFmQktMLzA1?=
 =?utf-8?B?VU9YUGN5R1lvR0VNL1VxWlZLM3grcVhXWHRsNUVnblB6VWZpNjFrWmpaaVRi?=
 =?utf-8?B?MlN4K0FqZW9rNlM2bW16TkVVdDZKNHA4ZkNyQUZVZUpNc3c5T0dXaTdKZWZ4?=
 =?utf-8?B?MWEvL2Q5cEZhMW9FYUlPaWVzMmlEckRScnlId3Zocm5qMXY1bXpBeHVESGR4?=
 =?utf-8?B?N21tTXp2bEJwWEkwdFVLRUhEekdrOXR5T3gyZGRkQWNGaU1kTmluN05iaG5p?=
 =?utf-8?B?MkRCK2tDT1JYeDNqaFhOckd5elV6TnZCd0h2QVNUaVg5SENIcVI2dzMvaWdq?=
 =?utf-8?B?Q0VMbkRaUWJUTWhxNzYyMmkwZmlYLzZiUFdMdCtjT2V4RktNdDg2ZktscTY2?=
 =?utf-8?B?OUxWNnlRclFoaWpLb0N5S2RrNG1WR2M3WlIzRHpiMlN4SStMa3dTVDY1TWxT?=
 =?utf-8?B?K3FQUnQyVEJyWTY3cys4aHNIZFdmYlJqRWViSTBWektnZGN5aE1oN2dMVlN0?=
 =?utf-8?B?d3BRaHhqYnMvRVJBWU83cEFuenRCWjhzZDlDbWZ6ajZhbmUvVjBmUWtJWDJ2?=
 =?utf-8?B?THBvdERYbUxVTVMwbVR0VHR3SkowZ29Ia0xOdHRxTzRsTm90eWM3M2NRa24y?=
 =?utf-8?B?MHlEcUxDTDFnL1RUclVMR0FQN1pmMTNjczUvYldyREV0UWlvL0FiVUhqdFFl?=
 =?utf-8?B?ay8vd09LNFl4VGd6TVdHUXN3dldZSFNNc1NYNk0xOEx0ZVRES1FPUTlFZGwy?=
 =?utf-8?B?bnhETkNFUFplL1VHWDdWT1dPU1pYZEpQZ2NiZGt2WDN5L1VHT2lFZkNDc1My?=
 =?utf-8?B?NUtoWmNXWEpLeU84VkdkVVJIMXE1UkwxT0g3SkpXdG9wK3VweFhZQ05yRTdI?=
 =?utf-8?B?ZnRVK01JakhrT0tHZEg0d2hIS2lWbG82azhPNUJ0K1VHaG9pKzF1cmdsMXJM?=
 =?utf-8?B?T2RMcXRqVzJPRnhUbUJDUHA4UjRRQTJnWk9ud0dFcXRFdUQydis2d0hxdWNZ?=
 =?utf-8?B?UGIzSjI3ZDI5angvMmdhK3Y5ZG0xUENYbm9BQlF0RHlmcXBpTUJXNHdwN2Zv?=
 =?utf-8?B?VHExZDZDSld3eGZDTHVBWW9UTlErMGgwZWNSQXJONE9iTDZSa2F0bHFMU2ls?=
 =?utf-8?B?TmlJeE5kK3lqYkdTWC9TREc0dTFXaDJ3ejZCVlpmdGQwS3kvbDl3Q2dPQUV6?=
 =?utf-8?B?Tkd1RWgyU1Y2ZTJqcEd1UWtDZjV6ODRTMzY5SDhiVXpGMzlDdGtWTGlKNTJT?=
 =?utf-8?B?OG52aDFkTUVkS0pHa01ZUXpQNjYyNFlId2RybXp4UVJRaW0zSkFjRytJd3hl?=
 =?utf-8?B?OFFodFNBMlIzdWxYajZ1V0V2Z2haTUxBemJLWVlqQnlDUytpcWZtRDlmdHBD?=
 =?utf-8?B?ZjhySXNKVVVvWHlmaFRIRUptTHQ4THpQSjkwNXFQUGx0RmVUNkk2bkN2V2kv?=
 =?utf-8?B?QkxhQy9ZcGtjeHBoWWVoUWhaVVl5bjJWYnJ5eXpLOWlGTkFRV25ycFNWY3Fk?=
 =?utf-8?Q?/vRuxHvx6GTIaaSFBVZKVJygB7ZnW2+3AqFFm?=
Content-ID: <11372946878A2A48B4EADE11ED050B63@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5819.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28eda2af-4d03-402d-f7e4-08de78aa7c59
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 22:24:35.8976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qtcwvbh0BCd4YX5vIFR6um9LwUmyDlAt3ml/bIW1nWwu6/FHq7rKz5lBez9AnjDWaRGeT+bn4krqG3w/KfIuSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4423
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=M9BA6iws c=1 sm=1 tr=0 ts=69a60e31 cx=c_pps
 a=H9d2Io+6O/etw3jU54J+0Q==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=zr94bLkQGwJZMLBWZqwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: PFWSAsnw0brlXo9EnpYfqsEcTE9Rpahr
X-Proofpoint-GUID: BiQSWPEWufxgDqkR8Ie9RStlAR2IAwUE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE2NCBTYWx0ZWRfXzeNSYIxFouRI
 iCJZJ6d4LU7s6ixWPqhKMK3FLnjZcXXOYlZb9NpKKjEWeFQ61W1q1h6OUh622kFoEeo/6ReJh+i
 r6TabuSA4sMPRoYDA+Sydf/Jzc7aiQ3ei23ohABu8228FtN3VtMynWB++gCOyUVF03KEG6EKwNY
 oI0jrGLmvwWW9YoZU189ievBzOo9TqcXX8a1xTV66mh4F5mOaJabejZ+HYzG6+gcm2R8HPx4Akl
 /BA+d4guT4ulkae58tCq3fHXF3M6D9SrIbhR+DGqS+79Yjw6wLezIxoO51p53rTkNlirJ5bjH6y
 bqqQDEQrm31YkOZkj4RF0Cs3GTMuZvZ0a13PkVMKtcsi4OuxUmQXSwA8igMAqpzgcU8MQyYEzul
 JaX9pqGwaSNDXOHEvfHmtichL6KmKfLRJRVL6Om81laCf91R+dwsFVjCBy9KnLLikHDnBkyzJ80
 sO3V7fMzLSzNsnOlEpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020164
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 2026-03-02 at 15:24 -0500,
 Jeff Layton wrote: > Convert
 ceph i_ino format strings to use the PRIino format > macro in preparation
 for the widening of i_ino via kino_t. > > Also correct signed [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [148.163.156.1 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vxBhW-00043W-OQ
Subject: Re: [f2fs-dev] [PATCH v2 023/110] ceph: use PRIino format for i_ino
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
 "linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
 "linux-x25@vger.kernel.org" <linux-x25@vger.kernel.org>,
 "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
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
 "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "ocfs2-devel@lists.linux.dev" <ocfs2-devel@lists.linux.dev>,
 "linux-fscrypt@vger.kernel.org" <linux-fscrypt@vger.kernel.org>,
 "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "fsverity@lists.linux.dev" <fsverity@lists.linux.dev>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "v9fs@lists.linux.dev" <v9fs@lists.linux.dev>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "audit@vger.kernel.org" <audit@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "netfs@lists.linux.dev" <netfs@lists.linux.dev>,
 "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
 "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: B62E51E550A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[hartkopp.net,gondor.apana.org.au,kernel.org,yaina.de,oracle.com,redhat.com,davemloft.net,paragon-software.com,szeredi.hu,canonical.com,gmail.com,fluxnic.net,intel.com,talpey.com,linux.alibaba.com,paul-moore.com,codewreck.org,linux.intel.com,fasheh.com,crudebyte.com,amd.com,zeniv.linux.org.uk,infradead.org,microsoft.com,holtmann.org,linaro.org,ffwll.ch,arm.com,suse.com,google.com,iogearbox.net,goodmis.org,vivo.com,dev.tdt.de,evilplan.org,mit.edu,cs.cmu.edu,omnibond.com,namei.org,dilger.ca,physik.fu-berlin.de,schaufler-ca.com,themaw.net,linux.dev,efficios.com,fomichev.me,huawei.com,artax.karlin.mff.cuni.cz,suse.de,samba.org,hallyn.com,alarsen.net,manguebit.org,dubeyko.com,ionkov.net,nod.at,auristor.com,brown.name,pengutronix.de,suse.cz,tyhicks.com,secunet.com,wdc.com,linux.ibm.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_GT_50(0.00)[172];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,ibm.com:s=pp1];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[Slava.Dubeyko@ibm.com];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,ibm.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, 2026-03-02 at 15:24 -0500, Jeff Layton wrote:
> Convert ceph i_ino format strings to use the PRIino format
> macro in preparation for the widening of i_ino via kino_t.
> 
> Also correct signed format specifiers to unsigned, since inode
> numbers are unsigned values.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/ceph/crypto.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ceph/crypto.c b/fs/ceph/crypto.c
> index f3de43ccb470ddbd7945426d79f9024ae615c127..718c194ba5d8ce22c6a5d1dd687ec3761263e7e1 100644
> --- a/fs/ceph/crypto.c
> +++ b/fs/ceph/crypto.c
> @@ -272,7 +272,7 @@ int ceph_encode_encrypted_dname(struct inode *parent, char *buf, int elen)
>  	/* To understand the 240 limit, see CEPH_NOHASH_NAME_MAX comments */
>  	WARN_ON(elen > 240);
>  	if (dir != parent) // leading _ is already there; append _<inum>
> -		elen += 1 + sprintf(p + elen, "_%ld", dir->i_ino);
> +		elen += 1 + sprintf(p + elen, "_%" PRIino "u", dir->i_ino);
>  
>  out:
>  	kfree(cryptbuf);
> @@ -377,7 +377,7 @@ int ceph_fname_to_usr(const struct ceph_fname *fname, struct fscrypt_str *tname,
>  	if (!ret && (dir != fname->dir)) {
>  		char tmp_buf[BASE64_CHARS(NAME_MAX)];
>  
> -		name_len = snprintf(tmp_buf, sizeof(tmp_buf), "_%.*s_%ld",
> +		name_len = snprintf(tmp_buf, sizeof(tmp_buf), "_%.*s_%" PRIino "u",
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
