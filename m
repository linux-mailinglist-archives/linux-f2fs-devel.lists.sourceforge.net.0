Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFdxDgERpmnlJgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 23:36:49 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 307061E5B13
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 23:36:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2py1oWs5u68QzyIKP32coxRmD896A/cFz5NLkglvVfU=; b=QkaCaN0eaDZEzLm9cKVICk2FAl
	Zs4V8j0BxYc1zVWrt4oiIKn9cZSQWVVV5r7YEN/a/GoN1Zt5/3pqKQGqDCwbydVd/un7N2E8VOWLq
	guXzR4IJUwHkuoD30G83iDYYk0wm6azA1OSdb1pZg4BygONKqmEkLGBrl9PNzDLIWffA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxBsa-0007wR-FD;
	Mon, 02 Mar 2026 22:36:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Slava.Dubeyko@ibm.com>) id 1vxBsZ-0007w2-Dt;
 Mon, 02 Mar 2026 22:36:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:CC:To:From:
 Sender:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0PKTLEeP4Tx9A96nY8i3BwXfQLUOJVGNDzDnFjj7ESs=; b=DeQEQoo/4IH0CW31uJYH9XCIVR
 MFIEDzZ40sJeLE5FAZjhhucR+m6U/zEwR94sFsdL5bQgQh89fA1YiQszxXdJ5wBGSH2pWUW/tZZqf
 MTeaHCHjYqMWzhijlx8dOEf+1+iyzBCLsIunhdnV5puygwF6f4aECGel+QO5AZ/KEbFk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0PKTLEeP4Tx9A96nY8i3BwXfQLUOJVGNDzDnFjj7ESs=; b=C4b8hArAVqMVfrNTCTakF9CUE/
 M5OWpB8wHJS/QRPPCIa26msC+Mme2aynYaRiVAwstqGnAStzyJFuABy1MzryTVe+0Tum3hpBp2Xv8
 BWv49vR45g1kf70pzJjKDZPoK2GXiYV4ClDVZK6R4BDddedQEG1z4pKYJW6Lz9+b5Cc0=;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxBsZ-0004ef-C9; Mon, 02 Mar 2026 22:36:44 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 622EYAtk2165137; Mon, 2 Mar 2026 22:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 pp1; bh=0PKTLEeP4Tx9A96nY8i3BwXfQLUOJVGNDzDnFjj7ESs=; b=RRHykEpj
 9MDPPjMZaP2txMNKCn4mj6Gqg7eRXRc++bC46+fXJW72IGBHqHlfi3q8+KNq3LgF
 Me9y9bvp2zH+nBoZIabmA6krVB4xZlA7mVVHbEbDORftrDJCaVlEAK5qqZWXfMTB
 eHHyjBQEUWxvP+2jFe3T4nGWtJsf+6QfI+AyS228DKjxN9bipQOOrTU2H4r49Qeb
 5mmlxWQFUf+WjlOarorrR95iZFH41rN1uStfk8PSpV6DhcGbfiXxvbCAfypW5kMB
 lCTyB6tgswGZZwnox4tNcgV4jDiLkZA0GfYWVAvqItXRJZls+v2cptrkMu3Mjs0N
 SXUNJQY3nUo4OA==
Received: from mw6pr02cu001.outbound.protection.outlook.com
 (mail-westus2azon11012026.outbound.protection.outlook.com [52.101.48.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksjd8qpj-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 02 Mar 2026 22:36:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+voMDjYmu62tnO+xyuks06DW624lpOzFVJ/dbG8A/4GQpWirojdVLOtoZcBdMjuIUkQV5E/YvpwUqoPLzXT6T4V4eilOpFtUQIduc2XxeR/2B+vWBqLLn8cQznV5opWKMVyTG6qmXY1NSYNbk6AqGV74DRNQep05C+V7Jw0wBZYcBRg2cY9KzcvTdTm+rncDcPTG5Mh1PN8p2eF3nMtVW4GuO6aOuMjKLcgNzh6knmEYCDf8xNZf5MQz3SvsofcabS/tN+21IRrfU1Scx9iU1dc1DgUE2icDSRJXNsSOOk4DvCU+AjQuugnxSlQukAQEYx0V2cIAVfhj7h/UtX70g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PKTLEeP4Tx9A96nY8i3BwXfQLUOJVGNDzDnFjj7ESs=;
 b=Aw2FrhQuWONSXn4YTFjqAtjhjwDSQITQHpLSjCEgyqKY62fFQ9JtujxCOYAHwGOuHnFBJx8Wh5govNrtmNyAhidi9yqYb1GVy3k9WbCeIyr4QMdnz4eo2Y/+eDjVBpNFeHtcFn4L3DtbrCWLeZLlKy3s/u/aXPJPAG4tcYM9p3/7TZZW9eup1hDXxVYOqLvFP9J3GpWVxvAPgMB9sI/9WDGXoDlo2jRwfPYXAXMiseklfS676izdtSUYgj88o5Ky+JWodTuh4ut2dChVY4oMduuVjft2q+IucgeVM7ey8rSDMWMrqYpZDFeHiIA1r75nPC383Dzwedpzo/884hRrfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from SA1PR15MB5819.namprd15.prod.outlook.com (2603:10b6:806:338::8)
 by SJ0PR15MB4155.namprd15.prod.outlook.com (2603:10b6:a03:2ee::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 22:36:09 +0000
Received: from SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539]) by SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539%7]) with mapi id 15.20.9632.017; Mon, 2 Mar 2026
 22:36:09 +0000
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
Thread-Topic: [EXTERNAL] [PATCH v2 032/110] hfsplus: use PRIino format for
 i_ino
Thread-Index: AQHcqobOGSQlvE2NLkaLDaZOgevjgLWb1N2A
Date: Mon, 2 Mar 2026 22:36:08 +0000
Message-ID: <25821493fe809c348a24231518c53d493c37674b.camel@ibm.com>
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
 <20260302-iino-u64-v2-32-e5388800dae0@kernel.org>
In-Reply-To: <20260302-iino-u64-v2-32-e5388800dae0@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5819:EE_|SJ0PR15MB4155:EE_
x-ms-office365-filtering-correlation-id: 8f8f1127-0bee-4b79-8224-08de78ac1967
x-ld-processed: fcf67057-50c9-4ad4-98f3-ffca64add9e9,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020|38070700021; 
x-microsoft-antispam-message-info: liri0jEh5M5wGbC4pxkNU0y01oCzOU744CzLQ7rQbRTGMlcUVvz0gbe6DDbFEmvJSDKjkVuBYuavDjbNSFFAnrxKpX0C0Ywp9Lo9kRJwmppRfDSaMm52Q2SPMvu4Z10iuBcYIylR2WGo0J9mvQAVywFZQa3UGrrvmWxyGP3t1D17abZ1qBuIl3BnaePBIrd53jhaFeRxF3507uD0nT1a/xZQqq/U/1pj3kzd3lD3n6R+nSwKcRAWFd7rxQM0bu74DYK77kPimsl+lujD7VyQaaYjHRshpc6jQN9wYVS08AgyaC6hjlK5w+QeSEygM+FCGXHPKZLSe9wuY00WNxO4W9hK5ChMwFXQAntSmZZtwD/iA40CIg4oSUMrpFHAu+m/zrJ4mcuX8+2OIZhV4QnChtOubr7T0mUSEHpNLCWS0gRZzi3OzMJgi7Kbqo0qyqK5EIJqPyAHJzF0BydPAuYe58n+wTq6FJdaFoPCIZaDeYjoLSKVPKLCDUe/4z4paTV6sGHu/A3eWfceC0C/NH6Pwhd1ORKTclQKLVQlTCJrquzGjaqz6OWa6Yxg7SSadhU4GevDzHKJk8djN8GTbXiiyoxFccTDRM/g/830KCIkrl03kGvXGm5q8NZ6ZlQ6cdudkLyeUFEpPngcE+KElYuDWmlUMHIuVt8oEErjFoBH31YWsnwzNtxrQ7++CJTlPWIQcVf/DH+KCvEtHwa+4M45GXFQcE2RiebWHsoZkj+bdB1kbManXthWh5ruYWjKMNLFvtFGC7dW8as4R70A0CqjWJkgsRSCky/hVdVOXUPe8OZPKJ3GRSLyNjvgB1VmUWUD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5819.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nm4wc0QvUThrV0wyZW13and5THBtWjdQTmozYnVYS0RpS3duL1pMSkUxTlVj?=
 =?utf-8?B?U2tLTWhKdnBNbmNFUm43cnBYVGNDV0IzSjVEMEhmeFFSSmFxekxWZElidG53?=
 =?utf-8?B?SzN0K1Z1QUprdVhlWjZUVm9qUVQxTHZNbFZKVCt6NGxlK015cGw2bGZZKzlW?=
 =?utf-8?B?aDhEQnVqK0JKNXlTRk54S0hxdnkrUU9abW1WKzdrRGJzZ01tMURwalg2QUFu?=
 =?utf-8?B?NFUxQnZiaHFzb3Z0bGJxb1ZuWWs0dFFTeEc4MWU3Y2U5UUllbmxWRlhzNW9r?=
 =?utf-8?B?V3p6V05udkQzdWNCdThvajdmNDZLTk9LMkl3bmNuN2NDdUd4ZmpyYWdpQ3Zk?=
 =?utf-8?B?N1FJdW9KVmFhYnhjOTl3bmY5OWpCY2wrbno3U3RSN1pnaWNrWDZhWmFTM0lm?=
 =?utf-8?B?L1pOV3hQY296TlJtRnAwdENzMlhXV2dnd0VpRFArR3JJVnNqY0UvejNsdjBS?=
 =?utf-8?B?UUdyRTlwdGc1bWRzVkcySGlHTmcwOXhocnp4QUhoa0MrNXhtbWVJb3AvQTNI?=
 =?utf-8?B?VW9rMmF6YmVHS0xiT1RJYkVwS3pSSHlwblhRQ25Ga2wyRDdBQVFGeWlVejlY?=
 =?utf-8?B?bXQra0tuR3JHRVVUSVlhaXBrY292dU1iOEtpWjFDc0FJWUpDWVFiMFJDWTNl?=
 =?utf-8?B?Z0tLdEtMdGpsUWlsVXVqcWdyV1FBbllFQnhacE5jcDMxQ21LZEJHT3BTY1R3?=
 =?utf-8?B?Q3hGclljOU1KR1VMSG55K2RuWWtTbVBvM3VFajc1MERsQSt1OS9Da05BTE84?=
 =?utf-8?B?QUtVZG1mazB0M3VtajNDLzBEaGg0eTdCNWxyWnFqUE5ab3V1ME4yOWhkaDUv?=
 =?utf-8?B?RHZhNGJvNnFKMFVPeEJyVXQzUWE1TEJKOTNPcGROSiszMzhrUkgrVHNMR2dJ?=
 =?utf-8?B?RlEvY0ZvNklwcXhIRU1KN2VERTNWR25TOWE0YnliWjJyZlpsdDVSWTQ1MDFP?=
 =?utf-8?B?NEhXS3RrUytTUFNnL2UrUk5GcW5XalhWK0k4R3VCVHB0VzQ3aWVCK3QwdEcz?=
 =?utf-8?B?Z21mOHlKOUVBNlphMWx6aDZVVTI2SjhNQ1p4YVd3TWlYSmtwSnhOVG82MWVh?=
 =?utf-8?B?dUN6M24vM3JYcXpHY211Z1JlZW1JbTVCdFVTS0UvUmd5azk1K3VpRDk5MDVO?=
 =?utf-8?B?aDFLeHpWOVVhbzhoTjhzMXJibjMvRE1SbFMyK3NRYi9aQlBBOVdxZktGcjNI?=
 =?utf-8?B?TFV3TFl2eFlCM0taeGkvY3ZpK2U1d0doNVRaQi9kc0JPb3VORnNCQTU5WjdX?=
 =?utf-8?B?d2IwdDcwVDBmMWtKZTFibDZqeHFZVlRJUFUzYjJCTEdNM3lHaENia1ViSVlD?=
 =?utf-8?B?bFpHcVR0N0RSbVF6VktFKzJmTVNodTc0dFZOWEZvOHU5aElCZTQweS9WaXIx?=
 =?utf-8?B?elczTnNoM0ErcGxoenlMNFJ4eDhwd1FHalNDVEhzaWFBWWdaNXBBckJ6Wm9Y?=
 =?utf-8?B?Q0NNMVZISWZMZEttMk9jcHZNTlFOM3pITlVwb3JyRkc2VFJBdlU1RHV1OHh4?=
 =?utf-8?B?by9CUlFyWnR6aXpkdjloaVBnZTJubnRTWm0xSkx3QWdxaENuaEJZV1ZXZ0x0?=
 =?utf-8?B?bFMzTGdENW5QalEvbjdpQzBCcUdtVXk2VXNOOUw2RkYvYnBoVkFsNzN2a2hJ?=
 =?utf-8?B?SGxzZnZvSVFqZEc3UEc1dHQwcURWTngzTXg2b2UwNC95dUlPOW8zQkVSUmNt?=
 =?utf-8?B?VTU0OVR0a1AzMFR4emxiQlIxYWhjYXBVVjJzcjdubVYycisyL3VUK0k5M1ZV?=
 =?utf-8?B?aWpLU3h0OTRGY2o1R2hTTm5nL1NWUXpPbW1CeDVadFl0SUxjOXlLdjA1MVFr?=
 =?utf-8?B?Q1puU2JPSWdTNmdKaVNJbVNkdHNLalNzOFl4UlpyV1ZlNVRrZnZaaHVQWno3?=
 =?utf-8?B?MGxoNEJwaE43Q25xUzBSbGt3UlJvblQ5QlYrTWh2eHI3b2Z2ZFNaUFlmY0Nr?=
 =?utf-8?B?VXlzOUJzQmZkVHdGSXhsR1paR3U3clF4R3JKZHNyTFJTZUlKdUdKWXFUTGFr?=
 =?utf-8?B?MmRhUU5CTDVIM3dXKytLdnAwcmdPanMxU0NqaTBxSlVpTXZzYzV5ZG53RDlC?=
 =?utf-8?B?Rk9pWjlxK01nYkNRL1VwbjhiemlTd1hBS1pxVjAyWUxYMG1UR0VNVnVLdGJj?=
 =?utf-8?B?NDFoMlg4VnRUVVBta1hyZTBuUlFuMmU5a1cxMW9LMHp0OHhJb0FLSmg0SDBF?=
 =?utf-8?B?R2s1Uk9hMitsNFBGd3NDa0RNSXJNVW9YK0VMQVVkZ2V0bnkwVTNCMzJ6clpT?=
 =?utf-8?B?ZWczK0Rjd3ZnNjNtZ01pWTZJT0puZXI5Tit1eHhBNTZxd0xuNDY4b1J3WDMw?=
 =?utf-8?B?aDNsSmx6dGsvSnhLcDRFYXBuc2ZCODYxTVhsbE5FQUI1VUF4MTBYZEdrZGRy?=
 =?utf-8?Q?FzhdrfgINKINxzCFRTeDluNJpjZ8xzKCNvsgm?=
Content-ID: <DFDC9A9F2A3EC144BE37C0068935254C@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5819.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8f1127-0bee-4b79-8224-08de78ac1967
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 22:36:08.8527 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ib+ltyxk4clMYYMsAZHWOx0KaEFvLfCaDk0uPr1zSgejRLoUx7ioeW+AKU5Zf0gZuOyp67VU7RcHPTmFFhe3HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4155
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=M9BA6iws c=1 sm=1 tr=0 ts=69a610de cx=c_pps
 a=NPM8+NhlmoQiEOpqaaNCjw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8 a=wCmvBT1CAAAA:8
 a=TooETclPppUkavAUpccA:9 a=QEXdDO2ut3YA:10 a=6z96SAwNL0f8klobD5od:22
X-Proofpoint-ORIG-GUID: glA8nXs6PGjLL15TqRkEikFC0nNRiIpg
X-Proofpoint-GUID: XJ3Ky6SEB_key2GF0K69GNh4ocy7hiOh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE2NCBTYWx0ZWRfX2JFXAaLhC392
 Kwc1+dR93YB2BZCH0RVJ4TONXFzEuVGwGWpGV0K8zHu7+nx5TJp+pv6LxLrCWE4ltO7lresz0//
 EcsTRTs/qp5k5GJun/EHoGrVmvNIrlhrn5GjY0ueMYYtUXhywm3X1A+FGjSfDJKXieq7gwztYRs
 icOso7WrxXJjEgaLj2IFKI6V/MOG4Ce8770SrA0eDcEp+8xU2GJ9RNYACA0NUdhEON11tHNWbyL
 8aKKwbiVW2oHjqlROYpmu63uwr4GrGRfeNo6AONDN7QUiCBKHOpMGgM/JbLgHn3Q8zziNbYk0Bc
 d6zMrBadzclxp2aQa4tx+dY+Uy90yb6nFjyauKl4VzsYrEP/iExjRhOPmxaydoWq3QkUoP6aL3P
 GGgVMeyT+/EaW3RoXNrwet+hsWwRrn6fe1EazPPwSGMLQ7954isKRxgyv2L8H1HAYXf7zErcktS
 sNSl6YpOOm7mFPktcDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020164
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 2026-03-02 at 15:24 -0500,
 Jeff Layton wrote: > Convert
 hfsplus i_ino format strings to use the PRIino format > macro in preparation
 for the widening of i_ino via kino_t. > > Also correct sign [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_VALID              Message has a valid ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [148.163.156.1 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vxBsZ-0004ef-C9
Subject: Re: [f2fs-dev] [PATCH v2 032/110] hfsplus: use PRIino format for
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
X-Rspamd-Queue-Id: 307061E5B13
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
	FREEMAIL_TO(0.00)[hartkopp.net,gondor.apana.org.au,kernel.org,yaina.de,oracle.com,redhat.com,davemloft.net,paragon-software.com,szeredi.hu,canonical.com,gmail.com,fluxnic.net,intel.com,talpey.com,linux.alibaba.com,paul-moore.com,codewreck.org,linux.intel.com,fasheh.com,crudebyte.com,amd.com,zeniv.linux.org.uk,infradead.org,microsoft.com,holtmann.org,linaro.org,ffwll.ch,arm.com,suse.com,google.com,iogearbox.net,goodmis.org,vivo.com,dev.tdt.de,evilplan.org,mit.edu,cs.cmu.edu,omnibond.com,namei.org,dilger.ca,physik.fu-berlin.de,schaufler-ca.com,themaw.net,linux.dev,efficios.com,fomichev.me,huawei.com,artax.karlin.mff.cuni.cz,suse.de,samba.org,hallyn.com,alarsen.net,manguebit.org,dubeyko.com,ionkov.net,nod.at,auristor.com,brown.name,pengutronix.de,suse.cz,tyhicks.com,secunet.com,wdc.com,linux.ibm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,ibm.com:s=pp1];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,ibm.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dubeyko.com:email,str.name:url,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
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

On Mon, 2026-03-02 at 15:24 -0500, Jeff Layton wrote:
> Convert hfsplus i_ino format strings to use the PRIino format
> macro in preparation for the widening of i_ino via kino_t.
> 
> Also correct signed format specifiers to unsigned, since inode
> numbers are unsigned values.
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
> index 4b79cd606276e31c20fa18ef3a099596f50e8a0f..d0b3f58166a057c0a5bf2e41cf6fc839798c0ded 100644
> --- a/fs/hfsplus/attributes.c
> +++ b/fs/hfsplus/attributes.c
> @@ -203,7 +203,7 @@ int hfsplus_create_attr_nolock(struct inode *inode, const char *name,
>  	int entry_size;
>  	int err;
>  
> -	hfs_dbg("name %s, ino %ld\n",
> +	hfs_dbg("name %s, ino %" PRIino "u\n",
>  		name ? name : NULL, inode->i_ino);
>  
>  	if (name) {
> @@ -255,7 +255,7 @@ int hfsplus_create_attr(struct inode *inode,
>  	hfsplus_attr_entry *entry_ptr;
>  	int err;
>  
> -	hfs_dbg("name %s, ino %ld\n",
> +	hfs_dbg("name %s, ino %" PRIino "u\n",
>  		name ? name : NULL, inode->i_ino);
>  
>  	if (!HFSPLUS_SB(sb)->attr_tree) {
> @@ -337,7 +337,7 @@ int hfsplus_delete_attr_nolock(struct inode *inode, const char *name,
>  	struct super_block *sb = inode->i_sb;
>  	int err;
>  
> -	hfs_dbg("name %s, ino %ld\n",
> +	hfs_dbg("name %s, ino %" PRIino "u\n",
>  		name ? name : NULL, inode->i_ino);
>  
>  	if (name) {
> @@ -367,7 +367,7 @@ int hfsplus_delete_attr(struct inode *inode, const char *name)
>  	struct super_block *sb = inode->i_sb;
>  	struct hfs_find_data fd;
>  
> -	hfs_dbg("name %s, ino %ld\n",
> +	hfs_dbg("name %s, ino %" PRIino "u\n",
>  		name ? name : NULL, inode->i_ino);
>  
>  	if (!HFSPLUS_SB(sb)->attr_tree) {
> @@ -436,7 +436,7 @@ int hfsplus_replace_attr(struct inode *inode,
>  	hfsplus_attr_entry *entry_ptr;
>  	int err = 0;
>  
> -	hfs_dbg("name %s, ino %ld\n",
> +	hfs_dbg("name %s, ino %" PRIino "u\n",
>  		name ? name : NULL, inode->i_ino);
>  
>  	if (!HFSPLUS_SB(sb)->attr_tree) {
> diff --git a/fs/hfsplus/catalog.c b/fs/hfsplus/catalog.c
> index 02c1eee4a4b86059ceaab7a7c68ab65adba6fa26..d422f117c60dee6fd8ece0d01d4ce66e04421e4a 100644
> --- a/fs/hfsplus/catalog.c
> +++ b/fs/hfsplus/catalog.c
> @@ -441,7 +441,7 @@ int hfsplus_rename_cat(u32 cnid,
>  	int entry_size, type;
>  	int err;
>  
> -	hfs_dbg("cnid %u - ino %lu, name %s - ino %lu, name %s\n",
> +	hfs_dbg("cnid %u - ino %" PRIino "u, name %s - ino %" PRIino "u, name %s\n",
>  		cnid, src_dir->i_ino, src_name->name,
>  		dst_dir->i_ino, dst_name->name);
>  	err = hfs_find_init(HFSPLUS_SB(sb)->cat_tree, &src_fd);
> diff --git a/fs/hfsplus/dir.c b/fs/hfsplus/dir.c
> index d559bf8625f853d50fd316d157cf8afe22069565..e701b11437f09172f88d68b4e4f5998591572b38 100644
> --- a/fs/hfsplus/dir.c
> +++ b/fs/hfsplus/dir.c
> @@ -313,7 +313,7 @@ static int hfsplus_link(struct dentry *src_dentry, struct inode *dst_dir,
>  	if (!S_ISREG(inode->i_mode))
>  		return -EPERM;
>  
> -	hfs_dbg("src_dir->i_ino %lu, dst_dir->i_ino %lu, inode->i_ino %lu\n",
> +	hfs_dbg("src_dir->i_ino %" PRIino "u, dst_dir->i_ino %" PRIino "u, inode->i_ino %" PRIino "u\n",
>  		src_dir->i_ino, dst_dir->i_ino, inode->i_ino);
>  
>  	mutex_lock(&sbi->vh_mutex);
> @@ -385,7 +385,7 @@ static int hfsplus_unlink(struct inode *dir, struct dentry *dentry)
>  	if (HFSPLUS_IS_RSRC(inode))
>  		return -EPERM;
>  
> -	hfs_dbg("dir->i_ino %lu, inode->i_ino %lu\n",
> +	hfs_dbg("dir->i_ino %" PRIino "u, inode->i_ino %" PRIino "u\n",
>  		dir->i_ino, inode->i_ino);
>  
>  	mutex_lock(&sbi->vh_mutex);
> @@ -393,7 +393,7 @@ static int hfsplus_unlink(struct inode *dir, struct dentry *dentry)
>  	if (inode->i_ino == cnid &&
>  	    atomic_read(&HFSPLUS_I(inode)->opencnt)) {
>  		str.name = name;
> -		str.len = sprintf(name, "temp%lu", inode->i_ino);
> +		str.len = sprintf(name, "temp%" PRIino "u", inode->i_ino);
>  		res = hfsplus_rename_cat(inode->i_ino,
>  					 dir, &dentry->d_name,
>  					 sbi->hidden_dir, &str);
> diff --git a/fs/hfsplus/extents.c b/fs/hfsplus/extents.c
> index 8e886514d27f1e5d4d94be75142f197669e62234..1dbfdf44f954f2768852678d1e386a91758848f9 100644
> --- a/fs/hfsplus/extents.c
> +++ b/fs/hfsplus/extents.c
> @@ -275,7 +275,7 @@ int hfsplus_get_block(struct inode *inode, sector_t iblock,
>  	mutex_unlock(&hip->extents_lock);
>  
>  done:
> -	hfs_dbg("ino %lu, iblock %llu - dblock %u\n",
> +	hfs_dbg("ino %" PRIino "u, iblock %llu - dblock %u\n",
>  		inode->i_ino, (long long)iblock, dblock);
>  
>  	mask = (1 << sbi->fs_shift) - 1;
> @@ -476,7 +476,7 @@ int hfsplus_file_extend(struct inode *inode, bool zeroout)
>  			goto out;
>  	}
>  
> -	hfs_dbg("ino %lu, start %u, len %u\n", inode->i_ino, start, len);
> +	hfs_dbg("ino %" PRIino "u, start %u, len %u\n", inode->i_ino, start, len);
>  
>  	if (hip->alloc_blocks <= hip->first_blocks) {
>  		if (!hip->first_blocks) {
> @@ -545,7 +545,7 @@ void hfsplus_file_truncate(struct inode *inode)
>  	u32 alloc_cnt, blk_cnt, start;
>  	int res;
>  
> -	hfs_dbg("ino %lu, phys_size %llu -> i_size %llu\n",
> +	hfs_dbg("ino %" PRIino "u, phys_size %llu -> i_size %llu\n",
>  		inode->i_ino, (long long)hip->phys_size, inode->i_size);
>  
>  	if (inode->i_size > hip->phys_size) {
> diff --git a/fs/hfsplus/inode.c b/fs/hfsplus/inode.c
> index 922ff41df042a83d47364f2d941c45dabda29afb..f61397db976e8b15fa186c3b31af71e55f9e26a6 100644
> --- a/fs/hfsplus/inode.c
> +++ b/fs/hfsplus/inode.c
> @@ -230,7 +230,7 @@ static int hfsplus_get_perms(struct inode *inode,
>  		inode->i_flags &= ~S_APPEND;
>  	return 0;
>  bad_type:
> -	pr_err("invalid file type 0%04o for inode %lu\n", mode, inode->i_ino);
> +	pr_err("invalid file type 0%04o for inode %" PRIino "u\n", mode, inode->i_ino);
>  	return -EIO;
>  }
>  
> @@ -328,7 +328,7 @@ int hfsplus_file_fsync(struct file *file, loff_t start, loff_t end,
>  	struct hfsplus_vh *vhdr = sbi->s_vhdr;
>  	int error = 0, error2;
>  
> -	hfs_dbg("inode->i_ino %lu, start %llu, end %llu\n",
> +	hfs_dbg("inode->i_ino %" PRIino "u, start %llu, end %llu\n",
>  		inode->i_ino, start, end);
>  
>  	error = file_write_and_wait_range(file, start, end);
> @@ -639,7 +639,7 @@ int hfsplus_cat_write_inode(struct inode *inode)
>  	hfsplus_cat_entry entry;
>  	int res = 0;
>  
> -	hfs_dbg("inode->i_ino %lu\n", inode->i_ino);
> +	hfs_dbg("inode->i_ino %" PRIino "u\n", inode->i_ino);
>  
>  	if (HFSPLUS_IS_RSRC(inode))
>  		main_inode = HFSPLUS_I(inode)->rsrc_inode;
> @@ -716,7 +716,7 @@ int hfsplus_cat_write_inode(struct inode *inode)
>  	if (!res) {
>  		res = hfs_btree_write(tree);
>  		if (res) {
> -			pr_err("b-tree write err: %d, ino %lu\n",
> +			pr_err("b-tree write err: %d, ino %" PRIino "u\n",
>  			       res, inode->i_ino);
>  		}
>  	}
> diff --git a/fs/hfsplus/super.c b/fs/hfsplus/super.c
> index 7229a8ae89f9469109b1c3a317ee9b7705a83f8b..b76865e2eac5260b681fc46b297f1665f1bc10da 100644
> --- a/fs/hfsplus/super.c
> +++ b/fs/hfsplus/super.c
> @@ -156,7 +156,7 @@ static int hfsplus_system_write_inode(struct inode *inode)
>  		int err = hfs_btree_write(tree);
>  
>  		if (err) {
> -			pr_err("b-tree write err: %d, ino %lu\n",
> +			pr_err("b-tree write err: %d, ino %" PRIino "u\n",
>  			       err, inode->i_ino);
>  			return err;
>  		}
> @@ -169,7 +169,7 @@ static int hfsplus_write_inode(struct inode *inode,
>  {
>  	int err;
>  
> -	hfs_dbg("ino %lu\n", inode->i_ino);
> +	hfs_dbg("ino %" PRIino "u\n", inode->i_ino);
>  
>  	err = hfsplus_ext_write_extent(inode);
>  	if (err)
> @@ -184,7 +184,7 @@ static int hfsplus_write_inode(struct inode *inode,
>  
>  static void hfsplus_evict_inode(struct inode *inode)
>  {
> -	hfs_dbg("ino %lu\n", inode->i_ino);
> +	hfs_dbg("ino %" PRIino "u\n", inode->i_ino);
>  	truncate_inode_pages_final(&inode->i_data);
>  	clear_inode(inode);
>  	if (HFSPLUS_IS_RSRC(inode)) {
> diff --git a/fs/hfsplus/xattr.c b/fs/hfsplus/xattr.c
> index 9904944cbd54e3d326591fa65a5ed678f38ca583..ef9121843482e81961fa541c53c906ab04d6fc33 100644
> --- a/fs/hfsplus/xattr.c
> +++ b/fs/hfsplus/xattr.c
> @@ -277,7 +277,7 @@ int __hfsplus_setxattr(struct inode *inode, const char *name,
>  	u16 folder_finderinfo_len = sizeof(DInfo) + sizeof(DXInfo);
>  	u16 file_finderinfo_len = sizeof(FInfo) + sizeof(FXInfo);
>  
> -	hfs_dbg("ino %lu, name %s, value %p, size %zu\n",
> +	hfs_dbg("ino %" PRIino "u, name %s, value %p, size %zu\n",
>  		inode->i_ino, name ? name : NULL,
>  		value, size);
>  
> @@ -447,7 +447,7 @@ int hfsplus_setxattr(struct inode *inode, const char *name,
>  		NLS_MAX_CHARSET_SIZE * HFSPLUS_ATTR_MAX_STRLEN + 1;
>  	int res;
>  
> -	hfs_dbg("ino %lu, name %s, prefix %s, prefixlen %zu, "
> +	hfs_dbg("ino %" PRIino "u, name %s, prefix %s, prefixlen %zu, "
>  		"value %p, size %zu\n",
>  		inode->i_ino, name ? name : NULL,
>  		prefix ? prefix : NULL, prefixlen,
> @@ -607,7 +607,7 @@ ssize_t hfsplus_getxattr(struct inode *inode, const char *name,
>  	int res;
>  	char *xattr_name;
>  
> -	hfs_dbg("ino %lu, name %s, prefix %s\n",
> +	hfs_dbg("ino %" PRIino "u, name %s, prefix %s\n",
>  		inode->i_ino, name ? name : NULL,
>  		prefix ? prefix : NULL);
>  
> @@ -717,7 +717,7 @@ ssize_t hfsplus_listxattr(struct dentry *dentry, char *buffer, size_t size)
>  	size_t strbuf_size;
>  	int xattr_name_len;
>  
> -	hfs_dbg("ino %lu\n", inode->i_ino);
> +	hfs_dbg("ino %" PRIino "u\n", inode->i_ino);
>  
>  	if (!is_xattr_operation_supported(inode))
>  		return -EOPNOTSUPP;
> @@ -819,7 +819,7 @@ static int hfsplus_removexattr(struct inode *inode, const char *name)
>  	int is_xattr_acl_deleted;
>  	int is_all_xattrs_deleted;
>  
> -	hfs_dbg("ino %lu, name %s\n",
> +	hfs_dbg("ino %" PRIino "u, name %s\n",
>  		inode->i_ino, name ? name : NULL);
>  
>  	if (!HFSPLUS_SB(inode->i_sb)->attr_tree)

Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>

Thanks,
Slava.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
