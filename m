Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCUrK7gQpmlRJwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 23:35:36 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A70C71E5A65
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 23:35:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ErdBbI0/+Nki+rFIPUqJOsLjnfJ9AAMuly9Ptvog1k=; b=frdUXoJPGyysDvN17W/iuhYl4U
	UKnvfNw2ZArS3nCBbRUePgFXW/lk5A+sZ2mYLSOTLwy+fYB5dN/NyNLfoh1rITqwUqJym54w4xJNZ
	Hqns/nWB8b0TwbU6smusq06sazC6dlCOPqHCQICnZf45KaQA8ucXVFUFxTtkL5ZwqSNc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxBrO-0006vK-67;
	Mon, 02 Mar 2026 22:35:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Slava.Dubeyko@ibm.com>) id 1vxBrM-0006v1-6C;
 Mon, 02 Mar 2026 22:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:CC:To:From:
 Sender:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vDsuLKCSUzn9/6h7Xgj+KY7G2hTsAHT32tVyBSuo5Gc=; b=m7mO3VmzQrbSd+TZuhtmeG2zCy
 upoZV4EJa3bRX2HGEQuQ5uQmxvAEsKFEbYXyGMlltZxp8tPqgdZ/3SknTkPPXPaxxOXXdumWgGz7b
 fL1TvtKxpsMiVaOBMz2QCJviizgYxs8wEd2Pd797G+bNIN4HXxOnu1eLoYo+Ixxpe3R0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vDsuLKCSUzn9/6h7Xgj+KY7G2hTsAHT32tVyBSuo5Gc=; b=MziLoE2zFN1lTduJb3VKhjzgPU
 azqSwm6Gh29xVSNJs7/YTeRu8X4HIYv45DT0fgezo1bobGVAIT5G6JSsMJyZfjcBtRGOgno1fDFNK
 LljvtniFxCR+6YPMoZzMNuii5IwhXP5LB3ZhdegL2zdTYlRDTS/pLUO1gnk9RTMkIbUM=;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxBrK-0004ZQ-UN; Mon, 02 Mar 2026 22:35:28 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 622KLS7l614134; Mon, 2 Mar 2026 22:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 pp1; bh=vDsuLKCSUzn9/6h7Xgj+KY7G2hTsAHT32tVyBSuo5Gc=; b=SJCWJnp6
 AqmATCEZ+8251RnnrqxexeJqRuu87Xri5t2ItJAy54T9zQ17pFb2wgPzSLulLySl
 GXVr/iYaFf1s3Yj/JFgZkFrN0zKg/Sq8u8p9LqhKXZzrMk9wa+N2LwOu4BeRExBt
 1PJNz+pwpsna3akOj/d+62bq2TsAvc/zo6mN95lB+xBmF1LK/kFOkJSJJgetYJBw
 jxkSgcE01Nl7shUfj/uIT8ZsfQaBUAcWSXRKoAqF/x1rhAdnCXmkVVRDKlj4IIVu
 S7oNQHmV75qbv0j1/YT4AIUlqNy+k0eM8Uyso8+K396w5e7gBqjs3SwKsTTZyTM4
 OxEx7xdGKQ9FfA==
Received: from mw6pr02cu001.outbound.protection.outlook.com
 (mail-westus2azon11012007.outbound.protection.outlook.com [52.101.48.7])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ckssmgfwm-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 02 Mar 2026 22:34:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFDVksJBMERlu9Fy6oiFkXxvFfvbIEPB1dO2daYv1q053ldMFEqNZqP1RVv4aj9cPzvWsqlGKwgmiwr2irQErZUdegFQFk9RN4XBfaC6Z+X61KoApdZ4C8gXc0YPBiFBJ3xU8X6qaItqrYtoWkYkRcgw84qFIgIwqSHlFxsUc2dTYxi8eDCXZ2jxDdnKPfb/7yGTmUy2ZW57VoqBH75fkHqp7dKOGVQvtruSVwVdQxLDqjItsEBd4mqQTFmoUQz5+5QJprRilnjJ/Nj3V90vAZCeEU8lmCKp4ngsg/r01jLonO3ObhcgmS5clc0dvQh5ICd56evbtMBt/Xaxm7yj2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDsuLKCSUzn9/6h7Xgj+KY7G2hTsAHT32tVyBSuo5Gc=;
 b=sCiM/PhiVnRjH9I6VgHBmzcmCeWuRfOHhj95KN/Ui2lN4wbCob17yLfJVstjddQWDO5aEC8j0z6zpSKHZ/zw3akLw6Ll0rTYe2Kt3hzvfd0gcid1sdQ3UG9vej6Ih4M4BmVqFIqhkHadC7kxqjHNV013OrsswKsgityLQCsJFLj4HEx5gIIXQmF+UEUUEterjscQOWdK5LHDNSyWLM69pYWs4+OcjYaG70DxuyuoLmxgGbU2LXO3RQrtx7RoKEOE/nGINRsCJ6JHL4q+83Il5fL4XyyOFO6X8ytJM0n/4bgtzw+sZVz+sMuuuKW1/NXuUGiIUPd6UC0X+ri66TSmng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from SA1PR15MB5819.namprd15.prod.outlook.com (2603:10b6:806:338::8)
 by SJ0PR15MB4155.namprd15.prod.outlook.com (2603:10b6:a03:2ee::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 22:34:46 +0000
Received: from SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539]) by SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539%7]) with mapi id 15.20.9632.017; Mon, 2 Mar 2026
 22:34:46 +0000
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
Thread-Topic: [EXTERNAL] [PATCH v2 015/110] nilfs2: use PRIino format for i_ino
Thread-Index: AQHcqoQRgDHOLEzPOEupU0/5WkpicbWb1IAA
Date: Mon, 2 Mar 2026 22:34:45 +0000
Message-ID: <399d2efe1490481738549c02aa2f6abc87058c88.camel@ibm.com>
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
 <20260302-iino-u64-v2-15-e5388800dae0@kernel.org>
In-Reply-To: <20260302-iino-u64-v2-15-e5388800dae0@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5819:EE_|SJ0PR15MB4155:EE_
x-ms-office365-filtering-correlation-id: 6cdda2f5-1759-4436-50b2-08de78abe7f2
x-ld-processed: fcf67057-50c9-4ad4-98f3-ffca64add9e9,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020|38070700021; 
x-microsoft-antispam-message-info: baa7gcpAsfOf3p8EBkdUuo+xbox+G5XbYh1/Zj24Ia8dxS53bNXO3HYYfqldoPsYBdhn1Q4dJgwtIYp0+2TzJHXe4K2/69CUskf7L4Uh+to4hT5UK+RVqIzZ53tpCpEXXm7/W3pz/KOqgNZ0NedyUCie3McUIBcC7nXXub54fLThYadav0Z3ICaTL3ULBYlC8T5IIIPVnplaNrAY4jL1GwLXoU1h2UPXbIbnlT9biP+NO0cG934ggqM7DmzdbgCIMxjDY1pIRqzEapD1eiQRoWYao8VEDRLfR7uBdpSVFltwgw8uyq0r05wiogiZLwMGY9HFdoyvCWU/w4Y01cpcbVlRhYnjkqVR8FdDQyaO12Xz2YVfjwa83orAH2mdxgsjd3BpNUhlEYX4IbIgE33cFoFoyORg1nLk+COnNY8Za0Oqnf2tsPLrGDgFOMY99aVb+fH1/5y2EkNXHtlPcECzLdaro4ijrDiSTZ53WjCivgDhpr7BXlUIe2XxHrFql94K1wn3ZI3ZcxXv8sEKEQZ2bbVp42KQJ9cTK2E5fS6wB8j1wKgnr/u/4PpiE6H2/JhsUugAHRFO3yzc5f6r0pENWRqS4uuHvpjgWebWjXrxto1z1ZpVP8XGinbADzO6vCThSV3Q0Gg/WqicWEXYzk355vYPU4pyspcSSpTLO2CWSj0ymxzuFmi0YASuyAMRGcOSLsH3hckJT1VMUL7aOzAC3hln1Yz+DR1p5fo6G8FIoKrwMXPScAJh24tufhbRjH4uhHW7507plWZTwW1+f5fNhnQvmcaYFAjNXFazC4mcd4g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5819.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTNsU29DMXFDakhyeWhDamlaRmRJdlJKZ2JyRGNGbWxVdXA5MnVoQ1Y0cjNr?=
 =?utf-8?B?TENQMFE5cm1CVHM5UDlVTmYzMzdVc3pMZkplcWJ0MWZONlAyQ0lEYi9DQzhB?=
 =?utf-8?B?ZExJSUNIZkVmYk1YUjI2WGpROHFwVFdNdTZpb3dpSXhHbjJUQ014VnIycnBJ?=
 =?utf-8?B?UC9mM3daVjhyeXJDbHUzVW9hbWpwRElwWTBrcEpvL3l0bkxwSXQ5OGQwdnZ0?=
 =?utf-8?B?Rm1jaVE5QVhYVmZrc08xU3pzT3RMaUtYRUFjRURwSkxLdHNSZUxLam1KTzNW?=
 =?utf-8?B?Zk8zVjdIZ2hRc3N3S2tKQVVqcitMeEVsTEFoTnpTbHdybWFTRGJ6RUlhYWlO?=
 =?utf-8?B?L25ySjBZUWR3WTh2M1lnbmhlbDBRcisxRTg1bEc5NTlNdjVYaTRCczdvVUty?=
 =?utf-8?B?aVMxOXhsNHVrOVNBbUdHNi9PdlVjTVNmUTFPcy80c2p4RndYTVExOTROelE5?=
 =?utf-8?B?L2ZhZzFxOGg3VVBHRzVyWW5ZVFdYSlRHMTdGdjNqQ2JnL1dxUmVrbVV0RkRC?=
 =?utf-8?B?YUZlblYrVkxyWS92ME01MG5jc2lEbC8vU0RkeUxtV0NWWFUyMjZhbDRzVGxD?=
 =?utf-8?B?L3NhRktyc0trUk54Q1hyengyVkJoZ0J2VEdTL3pmMXBMZXBqWTd3bk5kWTdO?=
 =?utf-8?B?cnFybWxuOGJySEdUc2tMdVhuNFRvSzJZcUFhYXlaeU9WNERydmNNc0pjSjJh?=
 =?utf-8?B?OWVMZzZ0L1R6bU1XbS9kc0trWTlndE02aS9YWG9xSWY1Zy9DbVJqbkdRN3Fn?=
 =?utf-8?B?ZUx5Q21HZ2VzK1FDMS91NGZHTnRTVGlvSWtMRDhXbi9ycGhYb3czbksxS2x4?=
 =?utf-8?B?VVBQY3Y0NWQwYW9JdzFwcUpiMWlSVEI4NUNkc1ZEekROeHB3b29pVVpMYmhO?=
 =?utf-8?B?UWt6WCtQZjRHZFRjRjZ2Tml5MktzTURjWmczbzkrUWdpNlprMC9lWFJERVJZ?=
 =?utf-8?B?c1pOZkpRK0xmTHhBUzVtblN3YWhWZjhLK3pEOVZWbXJqZkxZcnZvQzFhWWNw?=
 =?utf-8?B?RC9jamxCSVhpSXJYcGNqUXpiRzVXa3k1K1ZLQ0RSNytOMk5hSUJnMGF4cjRG?=
 =?utf-8?B?N0g1TDRNUU1xS0JuZkhTcjZCTysySER4dDY2REZ0SXFGcUM4VTVBbUlKWGly?=
 =?utf-8?B?T05lTEp4bDNya1ViS2txL29yUzVOM3pmUjZqTm1CeHFyRG01dStFWnZENjdk?=
 =?utf-8?B?bFFwQ21vNmV4NjVzemdBOUx3WDY0Y0xBc2tUT282bkpYNUFXQ01rN245K1Zm?=
 =?utf-8?B?UEtlSGZoeGI4Vzlsc2NiaW5HTHluTWNkOUlEbFV2K25ya21UL1FraDFWSUxy?=
 =?utf-8?B?WktXY3IrRXA1M3NGMXBiMXhpN0tSN0c1YVUrY2Z1ajNWNVJmWlVlY1U0RzZ4?=
 =?utf-8?B?R1QxanMxVlNWU1A2NVNyL2Y4YzRrOWN6VFpVVTBqMnBWWjRyZ2t6dUszK2ty?=
 =?utf-8?B?N281V29CNkp2TnJBcHYrVW9lYzFxdEJ4RDczMVlzQ3VuUEU3REszUjgwS1BH?=
 =?utf-8?B?MnZ6QVplVXMrY3J3OXlVYXZuYUpYellmVWwxTzZ2MEZSZ3lpM2RNT0tjSHNr?=
 =?utf-8?B?NzMwQXhDQ2xIeGVtcE1yN1R1a2ZTMGhya0RNZkxpR1J5cnhZdkdJQ3FlWVpi?=
 =?utf-8?B?WTdhalZCWjhNWEh5bUx4QXBKTE1UVUplWitldWdQOUI5amc2MkZNWDF1VUtC?=
 =?utf-8?B?Z253aFc4Yi9XZ2Z0dS82WFIyYlZNZ0NFbXVhWVRuc1NVWXdteWJ5aVAzS2tx?=
 =?utf-8?B?cUZhbU9LSXhYT085dm1qQTNDSFB1dUM4VFdaMnJYMVFsN2d2TUgrK2hOem1j?=
 =?utf-8?B?WlFEUTdHcTNHSVVzV2tTTW9sR3laLy9BWVJaeEl5c0xpcGd1K0lEaWh5dStv?=
 =?utf-8?B?WmdnNExNeStiTEM4eXJRUkJ0Wmo2QUU4WURGMXcxTFVWRTJla1Q0SjZ6aXFq?=
 =?utf-8?B?OGZuRUQ0Njhiamp1N1RJMWdqQTZLR0wxTjQwSUFXNkRyN3YrLyt3dHFwaThI?=
 =?utf-8?B?YkI1VVlZL0w2TnJ6cTg1VGM0cXV1SnVOV2ZFSkJUQ1lNbEZaTjM1UHZZRC9i?=
 =?utf-8?B?K3duR3EvNzViVWdablROWUF0enhrK0poTk5zT2tyckVzMjZOczFiQmFlSW16?=
 =?utf-8?B?Zm5MbVp5SENnWHhQb041MW8zSmllZFAxNlhZK1lnWFZNMWt0UURFQ3Z6UWZv?=
 =?utf-8?B?NWpkTjJwZnZqbW1uVndDQUF0TzBhWkpUak5XVis3UFgxdlJnRFl4Tml5SWNR?=
 =?utf-8?B?emI5Ry9rbWh4eWRKc2JQRVdkUnUrbDluWGNYa2gvcFJScUVwSGtKSzNpRXpD?=
 =?utf-8?B?azB5RGhhQnhJNXJVRXRMcnhjUGRpMUJJVzJzYlBoNGlsc3oraGo3bVJETUVE?=
 =?utf-8?Q?Z1cYHh43WNWrSm6dE62cZjVJHMl/MPovAqEo7?=
Content-ID: <7BEFFFA29157BC4D94F1C67D38DDA4CF@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5819.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cdda2f5-1759-4436-50b2-08de78abe7f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 22:34:45.9291 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MpjgQJsZlkWaylefBuxfaKNZf4yBj/+xwCzJoLXJK92xbDVhv7/1hQ6Arle3RHFFsneUK1TyQqluB6Z0oqtAkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4155
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE2NCBTYWx0ZWRfX2Ou3lwnAYEjq
 /x0BkrjXTEq+fZWdhfTUZvx0dkXnzbWq4PTRXrvFjE1sV0LSFqSKanO6A6OEoR0m13xE298hQ0j
 CW/mCRBSbKAaz/0kArkTc5Jtwol2DtntHxSQgV9sUoaC7t+VHPGXE6/vqY5dHWX9y9MBi7Jc5vt
 +wReSlQ5a+plYcy6ycDJopBEOUtTTPxziph6KHLTWUba7Jglld39o+57/+efMLm9znzP5hr89pG
 ztqNo6UR1e+5wGHvZu5IRACH/Bz55AnqsWYnvhdak4fgGuQJHINBaFsz/jP+UH6E7CiZb3RMjFU
 dwTcaWP2Gbcs1mx8CKlrX9u3jeRe1DBIcFzwSYX7IWWMb9iWC3zO7zKhOFtwf2DvAlOB9p0A/It
 UKuVIb3orLdKdkoRxKNUwHqWB5UkB3zMpp5CkjQPzjmd/ti2OyB6gsdLBccUDg6UeVkax3muuKt
 nucP+dYaQaYQMiRFmKg==
X-Proofpoint-ORIG-GUID: Cm-t3NK1pt6s23IAvB84zaLPlK7rZrgG
X-Proofpoint-GUID: Z32dTpnyulzny6wZAzPCvIJMKyTCuJgZ
X-Authority-Analysis: v=2.4 cv=AobjHe9P c=1 sm=1 tr=0 ts=69a6108e cx=c_pps
 a=F1HhE1toGRAZ88wdd1wKFg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8 a=wCmvBT1CAAAA:8
 a=uJr3N5FLDLMZiT7H3mwA:9 a=QEXdDO2ut3YA:10 a=6z96SAwNL0f8klobD5od:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020164
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 2026-03-02 at 15:23 -0500,
 Jeff Layton wrote: > Convert
 nilfs2 i_ino format strings to use the PRIino format > macro in preparation
 for the widening of i_ino via kino_t. > > In trace events, c [...] 
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
 [148.163.158.5 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vxBrK-0004ZQ-UN
Subject: Re: [f2fs-dev] [PATCH v2 015/110] nilfs2: use PRIino format for
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
X-Rspamd-Queue-Id: A70C71E5A65
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
	FREEMAIL_TO(0.00)[hartkopp.net,gondor.apana.org.au,kernel.org,yaina.de,oracle.com,redhat.com,davemloft.net,paragon-software.com,szeredi.hu,canonical.com,gmail.com,fluxnic.net,intel.com,talpey.com,linux.alibaba.com,paul-moore.com,codewreck.org,linux.intel.com,fasheh.com,crudebyte.com,amd.com,zeniv.linux.org.uk,infradead.org,microsoft.com,holtmann.org,linaro.org,ffwll.ch,arm.com,suse.com,google.com,iogearbox.net,goodmis.org,vivo.com,dev.tdt.de,evilplan.org,mit.edu,cs.cmu.edu,omnibond.com,namei.org,dilger.ca,physik.fu-berlin.de,schaufler-ca.com,themaw.net,linux.dev,efficios.com,fomichev.me,huawei.com,artax.karlin.mff.cuni.cz,suse.de,samba.org,hallyn.com,alarsen.net,manguebit.org,dubeyko.com,ionkov.net,nod.at,auristor.com,brown.name,pengutronix.de,suse.cz,tyhicks.com,secunet.com,wdc.com,linux.ibm.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[dubeyko.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	RCPT_COUNT_GT_50(0.00)[172];
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
X-Rspamd-Action: no action

On Mon, 2026-03-02 at 15:23 -0500, Jeff Layton wrote:
> Convert nilfs2 i_ino format strings to use the PRIino format
> macro in preparation for the widening of i_ino via kino_t.
> 
> In trace events, change __field(ino_t, ...) to __field(u64, ...)
> and update TP_printk format strings to %llu/%llx to match the
> widened field type.
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
> index e7eebb04f9a4080a39f17d4123e58ed7df6b2f4b..a3c559c86e5a4c63b1c9dd4ca137f24749c3ee87 100644
> --- a/fs/nilfs2/alloc.c
> +++ b/fs/nilfs2/alloc.c
> @@ -707,7 +707,7 @@ void nilfs_palloc_commit_free_entry(struct inode *inode,
>  
>  	if (!nilfs_clear_bit_atomic(lock, group_offset, bitmap))
>  		nilfs_warn(inode->i_sb,
> -			   "%s (ino=%lu): entry number %llu already freed",
> +			   "%s (ino=%" PRIino "u): entry number %llu already freed",
>  			   __func__, inode->i_ino,
>  			   (unsigned long long)req->pr_entry_nr);
>  	else
> @@ -748,7 +748,7 @@ void nilfs_palloc_abort_alloc_entry(struct inode *inode,
>  
>  	if (!nilfs_clear_bit_atomic(lock, group_offset, bitmap))
>  		nilfs_warn(inode->i_sb,
> -			   "%s (ino=%lu): entry number %llu already freed",
> +			   "%s (ino=%" PRIino "u): entry number %llu already freed",
>  			   __func__, inode->i_ino,
>  			   (unsigned long long)req->pr_entry_nr);
>  	else
> @@ -861,7 +861,7 @@ int nilfs_palloc_freev(struct inode *inode, __u64 *entry_nrs, size_t nitems)
>  			if (!nilfs_clear_bit_atomic(lock, group_offset,
>  						    bitmap)) {
>  				nilfs_warn(inode->i_sb,
> -					   "%s (ino=%lu): entry number %llu already freed",
> +					   "%s (ino=%" PRIino "u): entry number %llu already freed",
>  					   __func__, inode->i_ino,
>  					   (unsigned long long)entry_nrs[j]);
>  			} else {
> @@ -906,7 +906,7 @@ int nilfs_palloc_freev(struct inode *inode, __u64 *entry_nrs, size_t nitems)
>  							      last_nrs[k]);
>  			if (ret && ret != -ENOENT)
>  				nilfs_warn(inode->i_sb,
> -					   "error %d deleting block that object (entry=%llu, ino=%lu) belongs to",
> +					   "error %d deleting block that object (entry=%llu, ino=%" PRIino "u) belongs to",
>  					   ret, (unsigned long long)last_nrs[k],
>  					   inode->i_ino);
>  		}
> @@ -923,7 +923,7 @@ int nilfs_palloc_freev(struct inode *inode, __u64 *entry_nrs, size_t nitems)
>  			ret = nilfs_palloc_delete_bitmap_block(inode, group);
>  			if (ret && ret != -ENOENT)
>  				nilfs_warn(inode->i_sb,
> -					   "error %d deleting bitmap block of group=%lu, ino=%lu",
> +					   "error %d deleting bitmap block of group=%lu, ino=%" PRIino "u",
>  					   ret, group, inode->i_ino);
>  		}
>  	}
> diff --git a/fs/nilfs2/bmap.c b/fs/nilfs2/bmap.c
> index ccc1a7aa52d2064d56b826058554264c498d592f..e12979bac3c3ee5eb7fcc2bf156fe6e48fc65a7d 100644
> --- a/fs/nilfs2/bmap.c
> +++ b/fs/nilfs2/bmap.c
> @@ -33,7 +33,7 @@ static int nilfs_bmap_convert_error(struct nilfs_bmap *bmap,
>  
>  	if (err == -EINVAL) {
>  		__nilfs_error(inode->i_sb, fname,
> -			      "broken bmap (inode number=%lu)", inode->i_ino);
> +			      "broken bmap (inode number=%" PRIino "u)", inode->i_ino);
>  		err = -EIO;
>  	}
>  	return err;
> diff --git a/fs/nilfs2/btnode.c b/fs/nilfs2/btnode.c
> index 56836712909201775907483887e8a0022851bbec..3d64f3a9223e5601dc2332ae6e1007edd5b4827b 100644
> --- a/fs/nilfs2/btnode.c
> +++ b/fs/nilfs2/btnode.c
> @@ -64,7 +64,7 @@ nilfs_btnode_create_block(struct address_space *btnc, __u64 blocknr)
>  		 * clearing of an abandoned b-tree node is missing somewhere).
>  		 */
>  		nilfs_error(inode->i_sb,
> -			    "state inconsistency probably due to duplicate use of b-tree node block address %llu (ino=%lu)",
> +			    "state inconsistency probably due to duplicate use of b-tree node block address %llu (ino=%" PRIino "u)",
>  			    (unsigned long long)blocknr, inode->i_ino);
>  		goto failed;
>  	}
> diff --git a/fs/nilfs2/btree.c b/fs/nilfs2/btree.c
> index dd0c8e560ef6a2c96515025321914e0d73f41144..57163e991fbc49e2bfba2fa543f1b8dbd77718f4 100644
> --- a/fs/nilfs2/btree.c
> +++ b/fs/nilfs2/btree.c
> @@ -353,7 +353,7 @@ static int nilfs_btree_node_broken(const struct nilfs_btree_node *node,
>  		     nchildren <= 0 ||
>  		     nchildren > NILFS_BTREE_NODE_NCHILDREN_MAX(size))) {
>  		nilfs_crit(inode->i_sb,
> -			   "bad btree node (ino=%lu, blocknr=%llu): level = %d, flags = 0x%x, nchildren = %d",
> +			   "bad btree node (ino=%" PRIino "u, blocknr=%llu): level = %d, flags = 0x%x, nchildren = %d",
>  			   inode->i_ino, (unsigned long long)blocknr, level,
>  			   flags, nchildren);
>  		ret = 1;
> @@ -384,7 +384,7 @@ static int nilfs_btree_root_broken(const struct nilfs_btree_node *node,
>  		     nchildren > NILFS_BTREE_ROOT_NCHILDREN_MAX ||
>  		     (nchildren == 0 && level > NILFS_BTREE_LEVEL_NODE_MIN))) {
>  		nilfs_crit(inode->i_sb,
> -			   "bad btree root (ino=%lu): level = %d, flags = 0x%x, nchildren = %d",
> +			   "bad btree root (ino=%" PRIino "u): level = %d, flags = 0x%x, nchildren = %d",
>  			   inode->i_ino, level, flags, nchildren);
>  		ret = 1;
>  	}
> @@ -453,7 +453,7 @@ static int nilfs_btree_bad_node(const struct nilfs_bmap *btree,
>  	if (unlikely(nilfs_btree_node_get_level(node) != level)) {
>  		dump_stack();
>  		nilfs_crit(btree->b_inode->i_sb,
> -			   "btree level mismatch (ino=%lu): %d != %d",
> +			   "btree level mismatch (ino=%" PRIino "u): %d != %d",
>  			   btree->b_inode->i_ino,
>  			   nilfs_btree_node_get_level(node), level);
>  		return 1;
> @@ -521,7 +521,7 @@ static int __nilfs_btree_get_block(const struct nilfs_bmap *btree, __u64 ptr,
>   out_no_wait:
>  	if (!buffer_uptodate(bh)) {
>  		nilfs_err(btree->b_inode->i_sb,
> -			  "I/O error reading b-tree node block (ino=%lu, blocknr=%llu)",
> +			  "I/O error reading b-tree node block (ino=%" PRIino "u, blocknr=%llu)",
>  			  btree->b_inode->i_ino, (unsigned long long)ptr);
>  		brelse(bh);
>  		return -EIO;
> @@ -2104,7 +2104,7 @@ static int nilfs_btree_propagate(struct nilfs_bmap *btree,
>  	if (ret < 0) {
>  		if (unlikely(ret == -ENOENT)) {
>  			nilfs_crit(btree->b_inode->i_sb,
> -				   "writing node/leaf block does not appear in b-tree (ino=%lu) at key=%llu, level=%d",
> +				   "writing node/leaf block does not appear in b-tree (ino=%" PRIino "u) at key=%llu, level=%d",
>  				   btree->b_inode->i_ino,
>  				   (unsigned long long)key, level);
>  			ret = -EINVAL;
> @@ -2146,7 +2146,7 @@ static void nilfs_btree_add_dirty_buffer(struct nilfs_bmap *btree,
>  	    level >= NILFS_BTREE_LEVEL_MAX) {
>  		dump_stack();
>  		nilfs_warn(btree->b_inode->i_sb,
> -			   "invalid btree level: %d (key=%llu, ino=%lu, blocknr=%llu)",
> +			   "invalid btree level: %d (key=%llu, ino=%" PRIino "u, blocknr=%llu)",
>  			   level, (unsigned long long)key,
>  			   btree->b_inode->i_ino,
>  			   (unsigned long long)bh->b_blocknr);
> diff --git a/fs/nilfs2/dir.c b/fs/nilfs2/dir.c
> index b243199036dfa1ab2299efaaa5bdf5da2d159ff2..b182da076c58c4813145bc3e501a1e9a188bce85 100644
> --- a/fs/nilfs2/dir.c
> +++ b/fs/nilfs2/dir.c
> @@ -150,7 +150,7 @@ static bool nilfs_check_folio(struct folio *folio, char *kaddr)
>  
>  Ebadsize:
>  	nilfs_error(sb,
> -		    "size of directory #%lu is not a multiple of chunk size",
> +		    "size of directory #%" PRIino "u is not a multiple of chunk size",
>  		    dir->i_ino);
>  	goto fail;
>  Eshort:
> @@ -169,7 +169,7 @@ static bool nilfs_check_folio(struct folio *folio, char *kaddr)
>  	error = "disallowed inode number";
>  bad_entry:
>  	nilfs_error(sb,
> -		    "bad entry in directory #%lu: %s - offset=%lu, inode=%lu, rec_len=%zd, name_len=%d",
> +		    "bad entry in directory #%" PRIino "u: %s - offset=%lu, inode=%lu, rec_len=%zd, name_len=%d",
>  		    dir->i_ino, error, (folio->index << PAGE_SHIFT) + offs,
>  		    (unsigned long)le64_to_cpu(p->inode),
>  		    rec_len, p->name_len);
> @@ -177,7 +177,7 @@ static bool nilfs_check_folio(struct folio *folio, char *kaddr)
>  Eend:
>  	p = (struct nilfs_dir_entry *)(kaddr + offs);
>  	nilfs_error(sb,
> -		    "entry in directory #%lu spans the page boundary offset=%lu, inode=%lu",
> +		    "entry in directory #%" PRIino "u spans the page boundary offset=%lu, inode=%lu",
>  		    dir->i_ino, (folio->index << PAGE_SHIFT) + offs,
>  		    (unsigned long)le64_to_cpu(p->inode));
>  fail:
> @@ -251,7 +251,7 @@ static int nilfs_readdir(struct file *file, struct dir_context *ctx)
>  
>  		kaddr = nilfs_get_folio(inode, n, &folio);
>  		if (IS_ERR(kaddr)) {
> -			nilfs_error(sb, "bad page in #%lu", inode->i_ino);
> +			nilfs_error(sb, "bad page in #%" PRIino "u", inode->i_ino);
>  			ctx->pos += PAGE_SIZE - offset;
>  			return -EIO;
>  		}
> @@ -336,7 +336,7 @@ struct nilfs_dir_entry *nilfs_find_entry(struct inode *dir,
>  		/* next folio is past the blocks we've got */
>  		if (unlikely(n > (dir->i_blocks >> (PAGE_SHIFT - 9)))) {
>  			nilfs_error(dir->i_sb,
> -			       "dir %lu size %lld exceeds block count %llu",
> +			       "dir %" PRIino "u size %lld exceeds block count %llu",
>  			       dir->i_ino, dir->i_size,
>  			       (unsigned long long)dir->i_blocks);
>  			goto out;
> @@ -382,7 +382,7 @@ struct nilfs_dir_entry *nilfs_dotdot(struct inode *dir, struct folio **foliop)
>  	return next_de;
>  
>  fail:
> -	nilfs_error(dir->i_sb, "directory #%lu %s", dir->i_ino, msg);
> +	nilfs_error(dir->i_sb, "directory #%" PRIino "u %s", dir->i_ino, msg);
>  	folio_release_kmap(folio, de);
>  	return NULL;
>  }
> diff --git a/fs/nilfs2/direct.c b/fs/nilfs2/direct.c
> index 2d8dc6b35b5477947ca12a70288d3a3cce858aab..1084d4d586e078ab6825167976dd2a71d52bc8aa 100644
> --- a/fs/nilfs2/direct.c
> +++ b/fs/nilfs2/direct.c
> @@ -338,7 +338,7 @@ static int nilfs_direct_assign(struct nilfs_bmap *bmap,
>  	key = nilfs_bmap_data_get_key(bmap, *bh);
>  	if (unlikely(key > NILFS_DIRECT_KEY_MAX)) {
>  		nilfs_crit(bmap->b_inode->i_sb,
> -			   "%s (ino=%lu): invalid key: %llu",
> +			   "%s (ino=%" PRIino "u): invalid key: %llu",
>  			   __func__,
>  			   bmap->b_inode->i_ino, (unsigned long long)key);
>  		return -EINVAL;
> @@ -346,7 +346,7 @@ static int nilfs_direct_assign(struct nilfs_bmap *bmap,
>  	ptr = nilfs_direct_get_ptr(bmap, key);
>  	if (unlikely(ptr == NILFS_BMAP_INVALID_PTR)) {
>  		nilfs_crit(bmap->b_inode->i_sb,
> -			   "%s (ino=%lu): invalid pointer: %llu",
> +			   "%s (ino=%" PRIino "u): invalid pointer: %llu",
>  			   __func__,
>  			   bmap->b_inode->i_ino, (unsigned long long)ptr);
>  		return -EINVAL;
> diff --git a/fs/nilfs2/gcinode.c b/fs/nilfs2/gcinode.c
> index 561c220799c7aee879ad866865e377799c8ee6bb..714962d010da4a23e9b5f40de8aaaca8b95a74da 100644
> --- a/fs/nilfs2/gcinode.c
> +++ b/fs/nilfs2/gcinode.c
> @@ -137,7 +137,7 @@ int nilfs_gccache_wait_and_mark_dirty(struct buffer_head *bh)
>  		struct inode *inode = bh->b_folio->mapping->host;
>  
>  		nilfs_err(inode->i_sb,
> -			  "I/O error reading %s block for GC (ino=%lu, vblocknr=%llu)",
> +			  "I/O error reading %s block for GC (ino=%" PRIino "u, vblocknr=%llu)",
>  			  buffer_nilfs_node(bh) ? "node" : "data",
>  			  inode->i_ino, (unsigned long long)bh->b_blocknr);
>  		return -EIO;
> diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
> index 51bde45d586509dda3ef0cb7c46facb7fb2c61dd..0bc1c5141ec596b3c31e7d18e4ba3541bf618406 100644
> --- a/fs/nilfs2/inode.c
> +++ b/fs/nilfs2/inode.c
> @@ -108,7 +108,7 @@ int nilfs_get_block(struct inode *inode, sector_t blkoff,
>  				 * be locked in this case.
>  				 */
>  				nilfs_warn(inode->i_sb,
> -					   "%s (ino=%lu): a race condition while inserting a data block at offset=%llu",
> +					   "%s (ino=%" PRIino "u): a race condition while inserting a data block at offset=%llu",
>  					   __func__, inode->i_ino,
>  					   (unsigned long long)blkoff);
>  				err = -EAGAIN;
> @@ -789,7 +789,7 @@ static void nilfs_truncate_bmap(struct nilfs_inode_info *ii,
>  		goto repeat;
>  
>  failed:
> -	nilfs_warn(ii->vfs_inode.i_sb, "error %d truncating bmap (ino=%lu)",
> +	nilfs_warn(ii->vfs_inode.i_sb, "error %d truncating bmap (ino=%" PRIino "u)",
>  		   ret, ii->vfs_inode.i_ino);
>  }
>  
> @@ -1026,7 +1026,7 @@ int nilfs_set_file_dirty(struct inode *inode, unsigned int nr_dirty)
>  			 * this inode.
>  			 */
>  			nilfs_warn(inode->i_sb,
> -				   "cannot set file dirty (ino=%lu): the file is being freed",
> +				   "cannot set file dirty (ino=%" PRIino "u): the file is being freed",
>  				   inode->i_ino);
>  			spin_unlock(&nilfs->ns_inode_lock);
>  			return -EINVAL; /*
> @@ -1057,7 +1057,7 @@ int __nilfs_mark_inode_dirty(struct inode *inode, int flags)
>  	err = nilfs_load_inode_block(inode, &ibh);
>  	if (unlikely(err)) {
>  		nilfs_warn(inode->i_sb,
> -			   "cannot mark inode dirty (ino=%lu): error %d loading inode block",
> +			   "cannot mark inode dirty (ino=%" PRIino "u): error %d loading inode block",
>  			   inode->i_ino, err);
>  		return err;
>  	}
> diff --git a/fs/nilfs2/mdt.c b/fs/nilfs2/mdt.c
> index 946b0d3534a5f22f34ac44a91fb121541881c548..8629c72b62db33217d4747124885b6f727f182be 100644
> --- a/fs/nilfs2/mdt.c
> +++ b/fs/nilfs2/mdt.c
> @@ -203,7 +203,7 @@ static int nilfs_mdt_read_block(struct inode *inode, unsigned long block,
>  	err = -EIO;
>  	if (!buffer_uptodate(first_bh)) {
>  		nilfs_err(inode->i_sb,
> -			  "I/O error reading meta-data file (ino=%lu, block-offset=%lu)",
> +			  "I/O error reading meta-data file (ino=%" PRIino "u, block-offset=%lu)",
>  			  inode->i_ino, block);
>  		goto failed_bh;
>  	}
> diff --git a/fs/nilfs2/namei.c b/fs/nilfs2/namei.c
> index 40f4b1a28705b6e0eb8f0978cf3ac18b43aa1331..29edb84a0663caa4b29fa488c0495fc53358ca00 100644
> --- a/fs/nilfs2/namei.c
> +++ b/fs/nilfs2/namei.c
> @@ -292,7 +292,7 @@ static int nilfs_do_unlink(struct inode *dir, struct dentry *dentry)
>  
>  	if (!inode->i_nlink) {
>  		nilfs_warn(inode->i_sb,
> -			   "deleting nonexistent file (ino=%lu), %d",
> +			   "deleting nonexistent file (ino=%" PRIino "u), %d",
>  			   inode->i_ino, inode->i_nlink);
>  		set_nlink(inode, 1);
>  	}
> diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
> index 098a3bd103e04cd09b0689fe2017380d74664496..9a8bc3fa35ce9b447abbc2fb56cbd2b0cc5f76de 100644
> --- a/fs/nilfs2/segment.c
> +++ b/fs/nilfs2/segment.c
> @@ -2024,7 +2024,7 @@ static int nilfs_segctor_collect_dirty_files(struct nilfs_sc_info *sci,
>  				ifile, ii->vfs_inode.i_ino, &ibh);
>  			if (unlikely(err)) {
>  				nilfs_warn(sci->sc_super,
> -					   "log writer: error %d getting inode block (ino=%lu)",
> +					   "log writer: error %d getting inode block (ino=%" PRIino "u)",
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

Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>

Thanks,
Slava.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
