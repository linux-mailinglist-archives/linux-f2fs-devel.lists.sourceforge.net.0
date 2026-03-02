Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCq4FZsRpmnlJgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 23:39:23 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BCB1E5C26
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 23:39:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDc2j669EJxB6y/WCzp8NFObxzWlaDFMt1wDH4FXwVQ=; b=ADkbimuzSiG+llJ0qvRsHMbGpm
	acgKMzQKNBv5QbBLQvG4mBNFvEL+nCVvj9D0WvMWBtZeNWRiN2JLlbKnJY0gdaI8m4NfdkdsxJr93
	A2KvHahq/dJ07+gpHujkpEUyf2o99Xvg/D3XLUstB20OJ8kqSOEeFUmJbZgsajYvAX0c=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxBv5-0006es-Js;
	Mon, 02 Mar 2026 22:39:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Slava.Dubeyko@ibm.com>) id 1vxBv3-0006eM-Ci;
 Mon, 02 Mar 2026 22:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:CC:To:From:
 Sender:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h7I7wjgcUqISfPVWpWjKqRnS9Lv/J3K4YnumqX9WKiA=; b=DSn3rJAUY2sazd7X8vRp9Dg2Ij
 LLHh1kG2KFxQxUMstgXVcPk08x7V5LDwuPXhGOu8LUWR0nIQSMhwBbvXBEeG5OQ29RAjG8ggr6z64
 Tq6lZPfkUH5NHYuZj+grKTK5mJTVxGHPoBJsxXySv4vwXmB7uURtf0MiTRccpQT8FS8U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h7I7wjgcUqISfPVWpWjKqRnS9Lv/J3K4YnumqX9WKiA=; b=MGcw2EP4ZOsiMPvRr88Bf/8SxV
 OLbxC585ihARPsEoNrtSR50oIbXOmBNAE7oy7XepY4YhW2e/ylWrVeqsuOwAHAGhxplh8ZfPQGsFv
 C7frgn5YiAacQkGUpMNIwnhiOvO4X8EUFvtTF+tbPUk05n2DVzdkXTY6q5jpnI5ppgwY=;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxBv2-0004mx-AC; Mon, 02 Mar 2026 22:39:17 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 622EdxYQ2438123; Mon, 2 Mar 2026 22:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 pp1; bh=h7I7wjgcUqISfPVWpWjKqRnS9Lv/J3K4YnumqX9WKiA=; b=br1YtjuC
 VnJYs5uIhqf26EBJXh9VRoa5dTvrLjySCROg3YdRoRRUn8BLFwnVe2KcwteHEML5
 YkMLXDfkw1pi/qMQ94QqDBFeMWe0EZxLIEigCN6VGMXAzhm/NQTEtnQBPQQFfcGR
 zoNeKuZdO2EYB9MKx4mqZKQsCOAYpMkU48YUiCIxo6m/tRd9aw38+Od2NqTMAZoU
 StoY/ZHu6IPzDuwHm2C2Ur+HKg5DdV7dp9PogNcmlcEDp10stKD2m7yzrEj1CA1F
 OMK2IMs/QLOrPZfYIYYnV//b+R12C1Cwo4GxUEfMN5nja+uGaUGFjgQfLyD1NWW1
 oZV4+DCmb3c68g==
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010042.outbound.protection.outlook.com [52.101.61.42])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksrj0qcs-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 02 Mar 2026 22:38:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1KwGFCL1F3MU5b9FItWe50DI4Jc7GptoQNxAZOWjFOutW/Xbo+3X5xWb9LabXKi53WrBDteEXT952xe4rJ0is8Dhl5zNNW9Xm8qq6MK/pfX3wzi8ML3WgjGs7p4JbQcUP36oeyQcy4yRSDd6cSKpco7FNMONHbD3CzgocDqaIEekbk7EqoRKUYs40dpgc+y9W1cmdCoDlUDHI0fOmXRkWmMN++vl7Iy9SNlgT9aXgczTqCA7vft/jbc6AAtxRh4NRgAjwV6T9DuV/+4eXuMnekFKFM2il+Dt8gkRKYUhyT8rqOlK/bo4gcPgs0g8Lzj7CqQA0YLV8J1RLn2tscU7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7I7wjgcUqISfPVWpWjKqRnS9Lv/J3K4YnumqX9WKiA=;
 b=xWsrgfiVK5vQGJJRyrqe9y9fU8ky2YGtAEXxnJ0nfMLa/0PYlU9VdNsziQ2NR+5f+GcgGOOabxk7ygIVaeeOHfhMUEh8/6MgCn/Y740Eqnc2KevczFxN0rFmx32KvVXJGDBiMCue3aDk0Q1KYqRng/zwSE4mf/hxhLC+z+B5qZJppw4Bb2Hpomj9g0Tlc4PE5kuD07p09izjnY6xKos2Ad3eQOm8SwfNMPgCsTc40T08PHBqKb0qbwtzhn/GGux9kZE+vSyH3iiUO4/6urI++Ps9uc2tUyN7fm0/bjHqZXKEuaCXm0IO5MvTYZjnJJbBP7Hz1S8y/3bT6stArwyIFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from SA1PR15MB5819.namprd15.prod.outlook.com (2603:10b6:806:338::8)
 by PH3PPFE061D9768.namprd15.prod.outlook.com (2603:10b6:518:1::4cd)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 22:38:41 +0000
Received: from SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539]) by SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539%7]) with mapi id 15.20.9632.017; Mon, 2 Mar 2026
 22:38:40 +0000
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
Thread-Topic: [EXTERNAL] [PATCH v2 068/110] nilfs2: replace PRIino with
 %llu/%llx format strings
Thread-Index: AQHcqpH1veHvAidnr0qVoTrVuSHHfLWb1XsA
Date: Mon, 2 Mar 2026 22:38:40 +0000
Message-ID: <8800abc03ee286db813b902f1c32300962381dea.camel@ibm.com>
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
 <20260302-iino-u64-v2-68-e5388800dae0@kernel.org>
In-Reply-To: <20260302-iino-u64-v2-68-e5388800dae0@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5819:EE_|PH3PPFE061D9768:EE_
x-ms-office365-filtering-correlation-id: 638af32c-265e-4f20-d04e-08de78ac73d5
x-ld-processed: fcf67057-50c9-4ad4-98f3-ffca64add9e9,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024|38070700021|921020; 
x-microsoft-antispam-message-info: qg5tOpyFMlWHx7QSsCOFGeOSusoHGwrW7/BifelEfBRbedjVwEJuWZvRs1J6sYngDRoCyO8NcyAYCqkz4nM1v0+lRdCYw2I5VASGl1SGsUAkrpmNNXakQtIkq3vPKvpvYnn7BTggjq/6T7WAYMNokh3Kp+noFTT1A5XJxjrUi6T4eiBGwVGo/gFdLiZmqBZ0iBU4I9zOhJ8uBzr6MXHmbU2GoZlyG+Xte7mv+HIjIDDUrNpq8j2avR3r+LSqLUlSwgz0K8pheviXnBkYeiC44HY3Fi6CX0LOnDPkBnADadJ38dvu9EPCnLxly43xV0v6G3PaSkgup49wZPKyMc7UVmQ8UDfC/88nEund6jINGTbaKCQbPCO4eeiad9YBedNERDid4VeNWjB2ZrW5Kc+NbChGQHMeIiVUfu7wiBuEZjkREUtJjx+Zs86atNC5qSCYCMLEx3Ann52dlRFBt91eL9pcDZD8bXs2o/0ymDa2MJ6llwlLfkMQJ3gbPpAhAWP8aLxv5FPoEBRteNZ9XKA7ifT5HH7JNTY2YagRT1krWP50X3z1Ale9qmJQkF0MktFNf1BNPRNISv6Yq/w7JsrewOnIsM1fb0gwTMiq+uD39cdcWSCWx/tIQBkV3GBASl9GDROFoww0h6JYX7izxQmCobgiQ1YjZ1usKBfoVA+Y8pFV6bGVp7arOEEiLAu5TxjFrZI6RWJ+BfejPgt2Nvt7MwuIxvn/w3KYoZR0phdiR9OUkh0+CKPKOUiLB4tUNx0f9mBivYHI4iaNNW9dfv/EJ9nG+hZZ8xgJfOVd/3SE1vg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5819.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WlNPRUxsbnVsNGtnWTZUV3V2UE5vZVA0NGlFbk9DT2x3ai9oeUF1NXJuYTNF?=
 =?utf-8?B?TVZRaUFTa3BQUmR6dllENVJmaE52cDJGdlZQRDlFM2oraUxVWmpNTWlPTXd1?=
 =?utf-8?B?M3p6VnRUOWZuUm1tcHRlNUJDbjNoUmNFeWVCSVRkWUZTWVZYOUlsWEtBdXVJ?=
 =?utf-8?B?Z1loSURvTitON2tCNUdSQzh0Y1k5SGJBNXVzb1FpOXJKYkVnR2dBSERaQkx3?=
 =?utf-8?B?NHAzYmZoanNra3A2WE9JaUh4U0hpNDA3Z2hGbWZHb0NJeTM1NER6NWxLTW1p?=
 =?utf-8?B?WnFkR1E3U0Z6M2xGTk1OeU5sSUJpbndYUGl2VUttODRDVUF2MXoyMnFlQStp?=
 =?utf-8?B?NW9JZVpPWlc0S3ZBQ1JtMnJlUUxBVkc0OHV5NnNwSUxVMlFpQUI4ZUcvTXhz?=
 =?utf-8?B?UVdseS9hZWFqSHNBWnhwcGd3T2U5OU5teEpTL0U3azlFL2RaNk9UcDVlZUdF?=
 =?utf-8?B?bFdsRnRKbnBYZmFGL0NoeE44K0x2OXV6UUxONVlPK2k4dWVyaFpiMTNwSndS?=
 =?utf-8?B?MnZRZzgwM2h0QjBwSHprUFNWV3JaQ0xCZDhEMjJSMnRwNGRTSDZNMG5teldp?=
 =?utf-8?B?VytLNHRPeFBmdFFDU3FTNU9Gc0YxTmdkWUNObyszZXlxSDJUdzIwRjBCK01C?=
 =?utf-8?B?QlNlMzZVRzlmaTVHTGxkcWFQYjZJSHhYMlNPMi9jSUtHNDM1K2NmTkl3S3NI?=
 =?utf-8?B?UVNzYVlRZWxjZWcrb1dhMVdsR21IOHdrNmVIU0lEVEluNmZKdHpYZlNLU3JP?=
 =?utf-8?B?MWkydHZBTEpGTVBteTZnR0dSSHFDdU1IMXVuUmpGcWg2UWg3T2ovSmVMR1Bk?=
 =?utf-8?B?UTRxd2pHbldXcTlibUNra2pYWmxySXdnL3Y1enJUOCtySStJbTdFUzQwVTBR?=
 =?utf-8?B?WTdMRTY1T1prVFBFZ0NhOElFdmdVRzRLeXRWN1psSk5tYkxrTUlZRUl3MGlT?=
 =?utf-8?B?L2dyUzBWQ1F0ZEJqdW16STNFNDNCMnk5WmFJdEdtL1hrRy9MeGk4NGMrOURu?=
 =?utf-8?B?bThFMU1saUF0U1NVRDVDWTc2WHJPOTg0M2Vycyt3cDBtb25aSTdCeE1VYzQr?=
 =?utf-8?B?ZGVHRTg1ajJUV2xuL1RFeTJtaTZXeFNERkFjaHc0cTZKcXd0czJ5RVhMaGda?=
 =?utf-8?B?bXVZRnFkWXdJZmltUXZoWW9YbEtrQkRiQytGQ3RjbFZsWENGWnIrQVptZ28v?=
 =?utf-8?B?NXdxQ21yNWx5Snd4L1BiTEtsd0dYeDBQTm1mNXpEcHQwYVhmQjUzVE15aTJY?=
 =?utf-8?B?U3pDc1d4eW1IK2wySWMrUEg3STl3WXlRRmFsakhEMHNjemt0ODh5ZHFLZjlC?=
 =?utf-8?B?MDBGd3R5enA0STFkSWFkbzZKRHRQYTRUWXNMaDY5dUtHZkRkNkV3WkpGRThL?=
 =?utf-8?B?OFhYRFBxSVhQd1UzN3B2Y2FlNmxIZmFuQ0hnRW50VW5tRmRXelhUTnA0Vjh0?=
 =?utf-8?B?RitYbDRmOGd0ZkhGMUIvNFVMMm1XOFpSRzFGN2lXUjhBQVhEUnl2K2YrNS9Q?=
 =?utf-8?B?OW9iU2xMSmpMTzdydTY0dGw5aU5kbE15N3g3TXFuVHR3N0l5Wm95U1Vmelln?=
 =?utf-8?B?amN0MVhSWVNKeXRRT3BjWGFlbUNac0FDaTRMaEl0d25oQUpNVDVmMzF5b2lk?=
 =?utf-8?B?dTFGVnM2eEFwaUFRWk5ua1VqN3V4WDBPcmZpWmNmTE9lVFVOSCtyNU5PMCt6?=
 =?utf-8?B?Z3VlZ2V0ckU0eDB1dWVnZCtTV3FNcWRzRlc3VERnSy9UT1V3TkdrQnl4ZXRQ?=
 =?utf-8?B?M3RwMFp0RXJpVXFIdzE5UFFxMExMcXloQVF3RXk5NHJYdzNtRFlhaHh1NUFX?=
 =?utf-8?B?UUNNVkhRK3YwT2Z3Vjg4dmlqT2lyNytYRldXRFlxaW9LYkJzS0JCUlc5VW5B?=
 =?utf-8?B?VDVTS3EvYWhCSUZpNjBud0o2Q3Y5ZkxBaHl6L2c2cVMzcm9uSG8xdElFVUdk?=
 =?utf-8?B?TlVTZDg4REhhYm1QQWYwVHM4Y3RTZ21lanZUL2VRak9ERkJGRW1zWDNBUVdq?=
 =?utf-8?B?bkJjZ2ZORDdmV2lsRjVLUWdVNzU5dlZGNzhxUTZFWmlvQnhEUUR5TkFjQlpK?=
 =?utf-8?B?SS9BeUhrZHNRZjJhK1ZxUEZmckp0VXNqVW1IQXNMT3R2RmRtKytBM09jcm54?=
 =?utf-8?B?YW1YZU10bHQ2Zk45VTBud0JGb2lWTE5RK0JZKy9IQW5abTRYUXlFNGF1Yng1?=
 =?utf-8?B?Y2dydEN2MzRmc1VFSG8vaC81OVVZTWY3ckpkcWh3Ylkvc0VoZ3d5aDg0cHZW?=
 =?utf-8?B?Q0ZESGdoTm83dyt1L1BtaWxoMGJ0amszWnljb3h6T00zR09UeWRSaStZVjRH?=
 =?utf-8?B?a2N4NzJXYVhFeWF3OVZDYU4rQWFMSVlrbStpQ2QwdURxekhDVForcXJHckkx?=
 =?utf-8?Q?8em0l4CGDzUplP9dVcDgv/bEk2D3za16kNnxh?=
Content-ID: <664D2E1D3580A24698ABC711B55984CB@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5819.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 638af32c-265e-4f20-d04e-08de78ac73d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 22:38:40.6239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ujg2UeUfPihWwvhBUqhvDS8Kxh4MSayZL4EBwsygLQ03M4iOh8foehVIqV1rMjLEZLRDRsva+P5vLkxMMr2i/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE061D9768
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Rp/I7SmK c=1 sm=1 tr=0 ts=69a61177 cx=c_pps
 a=ggyiYYPOIDPuJa++h0h3+w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8 a=wCmvBT1CAAAA:8
 a=1Koa7OJEvVN96EddKCQA:9 a=QEXdDO2ut3YA:10 a=6z96SAwNL0f8klobD5od:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE2NyBTYWx0ZWRfX9OmTZ5v55DML
 38XrIclCEXvNUIHIDGCfy2FUVfrd+wxdG+kgNoNTTn6dhDzwYtN0XLenLycRfKVi7YPJNLrzAut
 +slGlKUzanRn+svTZL4+ru8r3Do6Svomq7elur7qJxP7/Ab1cbqt8ggOJmYsf1pP3tMA5tHccPe
 Y5LMi4nRN51pZFNJnnK0UmSaO2NtGWc2xoml02Glq+d8f84eZdHq5QGFlioeAuThmH7w3Y54FTK
 nJ/DQxswgsdDgbMsJm1Q6vbh2qLOwj1IV5tUbRbchua3jAzIJ4jPGGA1dTKGWEnePR1Oy06uG8D
 r7MnmCNRCB1Ety4seL2oDR6Ly8IXf2XWsvFHVBey+JcI5+zwRUaGP4LNFd+EzpQ26zMKwHtH/KE
 FlTRW+TAA5MyvdiFTFzq+S6euSOmHslSmQjOhml3tGiEILRbPXKoqeR8pSfg9GkyMCV9OTiMt42
 b8kjHBMoinVB9khDQAw==
X-Proofpoint-GUID: SYkWJ6TCO5AIr3IVxWs2cRDM1HMq0pl9
X-Proofpoint-ORIG-GUID: 3uG7sZ71mfYRremJjcb0bgEF-ZR1G-iW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020167
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 2026-03-02 at 15:24 -0500, Jeff Layton wrote: > Now
 that i_ino is u64 and the PRIino format macro has been removed, > replace
 all uses in nilfs2 with the concrete format strings. > > Signed-of [...] 
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
X-Headers-End: 1vxBv2-0004mx-AC
Subject: Re: [f2fs-dev] [PATCH v2 068/110] nilfs2: replace PRIino with
 %llu/%llx format strings
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
X-Rspamd-Queue-Id: 55BCB1E5C26
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

On Mon, 2026-03-02 at 15:24 -0500, Jeff Layton wrote:
> Now that i_ino is u64 and the PRIino format macro has been removed,
> replace all uses in nilfs2 with the concrete format strings.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/nilfs2/alloc.c   | 10 +++++-----
>  fs/nilfs2/bmap.c    |  2 +-
>  fs/nilfs2/btnode.c  |  2 +-
>  fs/nilfs2/btree.c   | 12 ++++++------
>  fs/nilfs2/dir.c     | 12 ++++++------
>  fs/nilfs2/direct.c  |  4 ++--
>  fs/nilfs2/gcinode.c |  2 +-
>  fs/nilfs2/inode.c   |  8 ++++----
>  fs/nilfs2/mdt.c     |  2 +-
>  fs/nilfs2/namei.c   |  2 +-
>  fs/nilfs2/segment.c |  2 +-
>  11 files changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/fs/nilfs2/alloc.c b/fs/nilfs2/alloc.c
> index a3c559c86e5a4c63b1c9dd4ca137f24749c3ee87..7b1cd2baefcf21e54f9260845b02c7c95c148c64 100644
> --- a/fs/nilfs2/alloc.c
> +++ b/fs/nilfs2/alloc.c
> @@ -707,7 +707,7 @@ void nilfs_palloc_commit_free_entry(struct inode *inode,
>  
>  	if (!nilfs_clear_bit_atomic(lock, group_offset, bitmap))
>  		nilfs_warn(inode->i_sb,
> -			   "%s (ino=%" PRIino "u): entry number %llu already freed",
> +			   "%s (ino=%llu): entry number %llu already freed",
>  			   __func__, inode->i_ino,
>  			   (unsigned long long)req->pr_entry_nr);
>  	else
> @@ -748,7 +748,7 @@ void nilfs_palloc_abort_alloc_entry(struct inode *inode,
>  
>  	if (!nilfs_clear_bit_atomic(lock, group_offset, bitmap))
>  		nilfs_warn(inode->i_sb,
> -			   "%s (ino=%" PRIino "u): entry number %llu already freed",
> +			   "%s (ino=%llu): entry number %llu already freed",
>  			   __func__, inode->i_ino,
>  			   (unsigned long long)req->pr_entry_nr);
>  	else
> @@ -861,7 +861,7 @@ int nilfs_palloc_freev(struct inode *inode, __u64 *entry_nrs, size_t nitems)
>  			if (!nilfs_clear_bit_atomic(lock, group_offset,
>  						    bitmap)) {
>  				nilfs_warn(inode->i_sb,
> -					   "%s (ino=%" PRIino "u): entry number %llu already freed",
> +					   "%s (ino=%llu): entry number %llu already freed",
>  					   __func__, inode->i_ino,
>  					   (unsigned long long)entry_nrs[j]);
>  			} else {
> @@ -906,7 +906,7 @@ int nilfs_palloc_freev(struct inode *inode, __u64 *entry_nrs, size_t nitems)
>  							      last_nrs[k]);
>  			if (ret && ret != -ENOENT)
>  				nilfs_warn(inode->i_sb,
> -					   "error %d deleting block that object (entry=%llu, ino=%" PRIino "u) belongs to",
> +					   "error %d deleting block that object (entry=%llu, ino=%llu) belongs to",
>  					   ret, (unsigned long long)last_nrs[k],
>  					   inode->i_ino);
>  		}
> @@ -923,7 +923,7 @@ int nilfs_palloc_freev(struct inode *inode, __u64 *entry_nrs, size_t nitems)
>  			ret = nilfs_palloc_delete_bitmap_block(inode, group);
>  			if (ret && ret != -ENOENT)
>  				nilfs_warn(inode->i_sb,
> -					   "error %d deleting bitmap block of group=%lu, ino=%" PRIino "u",
> +					   "error %d deleting bitmap block of group=%lu, ino=%llu",
>  					   ret, group, inode->i_ino);
>  		}
>  	}
> diff --git a/fs/nilfs2/bmap.c b/fs/nilfs2/bmap.c
> index e12979bac3c3ee5eb7fcc2bf156fe6e48fc65a7d..824f2bd91c167965ec3a660202b6e6c5f1fe007e 100644
> --- a/fs/nilfs2/bmap.c
> +++ b/fs/nilfs2/bmap.c
> @@ -33,7 +33,7 @@ static int nilfs_bmap_convert_error(struct nilfs_bmap *bmap,
>  
>  	if (err == -EINVAL) {
>  		__nilfs_error(inode->i_sb, fname,
> -			      "broken bmap (inode number=%" PRIino "u)", inode->i_ino);
> +			      "broken bmap (inode number=%llu)", inode->i_ino);
>  		err = -EIO;
>  	}
>  	return err;
> diff --git a/fs/nilfs2/btnode.c b/fs/nilfs2/btnode.c
> index 3d64f3a9223e5601dc2332ae6e1007edd5b4827b..2e553d698d0f3980de98fced415dfd819ddbca0a 100644
> --- a/fs/nilfs2/btnode.c
> +++ b/fs/nilfs2/btnode.c
> @@ -64,7 +64,7 @@ nilfs_btnode_create_block(struct address_space *btnc, __u64 blocknr)
>  		 * clearing of an abandoned b-tree node is missing somewhere).
>  		 */
>  		nilfs_error(inode->i_sb,
> -			    "state inconsistency probably due to duplicate use of b-tree node block address %llu (ino=%" PRIino "u)",
> +			    "state inconsistency probably due to duplicate use of b-tree node block address %llu (ino=%llu)",
>  			    (unsigned long long)blocknr, inode->i_ino);
>  		goto failed;
>  	}
> diff --git a/fs/nilfs2/btree.c b/fs/nilfs2/btree.c
> index 57163e991fbc49e2bfba2fa543f1b8dbd77718f4..3c03f5a741d144d22d1ffb5acf43a035e88c00dc 100644
> --- a/fs/nilfs2/btree.c
> +++ b/fs/nilfs2/btree.c
> @@ -353,7 +353,7 @@ static int nilfs_btree_node_broken(const struct nilfs_btree_node *node,
>  		     nchildren <= 0 ||
>  		     nchildren > NILFS_BTREE_NODE_NCHILDREN_MAX(size))) {
>  		nilfs_crit(inode->i_sb,
> -			   "bad btree node (ino=%" PRIino "u, blocknr=%llu): level = %d, flags = 0x%x, nchildren = %d",
> +			   "bad btree node (ino=%llu, blocknr=%llu): level = %d, flags = 0x%x, nchildren = %d",
>  			   inode->i_ino, (unsigned long long)blocknr, level,
>  			   flags, nchildren);
>  		ret = 1;
> @@ -384,7 +384,7 @@ static int nilfs_btree_root_broken(const struct nilfs_btree_node *node,
>  		     nchildren > NILFS_BTREE_ROOT_NCHILDREN_MAX ||
>  		     (nchildren == 0 && level > NILFS_BTREE_LEVEL_NODE_MIN))) {
>  		nilfs_crit(inode->i_sb,
> -			   "bad btree root (ino=%" PRIino "u): level = %d, flags = 0x%x, nchildren = %d",
> +			   "bad btree root (ino=%llu): level = %d, flags = 0x%x, nchildren = %d",
>  			   inode->i_ino, level, flags, nchildren);
>  		ret = 1;
>  	}
> @@ -453,7 +453,7 @@ static int nilfs_btree_bad_node(const struct nilfs_bmap *btree,
>  	if (unlikely(nilfs_btree_node_get_level(node) != level)) {
>  		dump_stack();
>  		nilfs_crit(btree->b_inode->i_sb,
> -			   "btree level mismatch (ino=%" PRIino "u): %d != %d",
> +			   "btree level mismatch (ino=%llu): %d != %d",
>  			   btree->b_inode->i_ino,
>  			   nilfs_btree_node_get_level(node), level);
>  		return 1;
> @@ -521,7 +521,7 @@ static int __nilfs_btree_get_block(const struct nilfs_bmap *btree, __u64 ptr,
>   out_no_wait:
>  	if (!buffer_uptodate(bh)) {
>  		nilfs_err(btree->b_inode->i_sb,
> -			  "I/O error reading b-tree node block (ino=%" PRIino "u, blocknr=%llu)",
> +			  "I/O error reading b-tree node block (ino=%llu, blocknr=%llu)",
>  			  btree->b_inode->i_ino, (unsigned long long)ptr);
>  		brelse(bh);
>  		return -EIO;
> @@ -2104,7 +2104,7 @@ static int nilfs_btree_propagate(struct nilfs_bmap *btree,
>  	if (ret < 0) {
>  		if (unlikely(ret == -ENOENT)) {
>  			nilfs_crit(btree->b_inode->i_sb,
> -				   "writing node/leaf block does not appear in b-tree (ino=%" PRIino "u) at key=%llu, level=%d",
> +				   "writing node/leaf block does not appear in b-tree (ino=%llu) at key=%llu, level=%d",
>  				   btree->b_inode->i_ino,
>  				   (unsigned long long)key, level);
>  			ret = -EINVAL;
> @@ -2146,7 +2146,7 @@ static void nilfs_btree_add_dirty_buffer(struct nilfs_bmap *btree,
>  	    level >= NILFS_BTREE_LEVEL_MAX) {
>  		dump_stack();
>  		nilfs_warn(btree->b_inode->i_sb,
> -			   "invalid btree level: %d (key=%llu, ino=%" PRIino "u, blocknr=%llu)",
> +			   "invalid btree level: %d (key=%llu, ino=%llu, blocknr=%llu)",
>  			   level, (unsigned long long)key,
>  			   btree->b_inode->i_ino,
>  			   (unsigned long long)bh->b_blocknr);
> diff --git a/fs/nilfs2/dir.c b/fs/nilfs2/dir.c
> index b182da076c58c4813145bc3e501a1e9a188bce85..3653db5cdb65137d1e660bb509c14ec4cbc8840b 100644
> --- a/fs/nilfs2/dir.c
> +++ b/fs/nilfs2/dir.c
> @@ -150,7 +150,7 @@ static bool nilfs_check_folio(struct folio *folio, char *kaddr)
>  
>  Ebadsize:
>  	nilfs_error(sb,
> -		    "size of directory #%" PRIino "u is not a multiple of chunk size",
> +		    "size of directory #%llu is not a multiple of chunk size",
>  		    dir->i_ino);
>  	goto fail;
>  Eshort:
> @@ -169,7 +169,7 @@ static bool nilfs_check_folio(struct folio *folio, char *kaddr)
>  	error = "disallowed inode number";
>  bad_entry:
>  	nilfs_error(sb,
> -		    "bad entry in directory #%" PRIino "u: %s - offset=%lu, inode=%lu, rec_len=%zd, name_len=%d",
> +		    "bad entry in directory #%llu: %s - offset=%lu, inode=%lu, rec_len=%zd, name_len=%d",
>  		    dir->i_ino, error, (folio->index << PAGE_SHIFT) + offs,
>  		    (unsigned long)le64_to_cpu(p->inode),
>  		    rec_len, p->name_len);
> @@ -177,7 +177,7 @@ static bool nilfs_check_folio(struct folio *folio, char *kaddr)
>  Eend:
>  	p = (struct nilfs_dir_entry *)(kaddr + offs);
>  	nilfs_error(sb,
> -		    "entry in directory #%" PRIino "u spans the page boundary offset=%lu, inode=%lu",
> +		    "entry in directory #%llu spans the page boundary offset=%lu, inode=%lu",
>  		    dir->i_ino, (folio->index << PAGE_SHIFT) + offs,
>  		    (unsigned long)le64_to_cpu(p->inode));
>  fail:
> @@ -251,7 +251,7 @@ static int nilfs_readdir(struct file *file, struct dir_context *ctx)
>  
>  		kaddr = nilfs_get_folio(inode, n, &folio);
>  		if (IS_ERR(kaddr)) {
> -			nilfs_error(sb, "bad page in #%" PRIino "u", inode->i_ino);
> +			nilfs_error(sb, "bad page in #%llu", inode->i_ino);
>  			ctx->pos += PAGE_SIZE - offset;
>  			return -EIO;
>  		}
> @@ -336,7 +336,7 @@ struct nilfs_dir_entry *nilfs_find_entry(struct inode *dir,
>  		/* next folio is past the blocks we've got */
>  		if (unlikely(n > (dir->i_blocks >> (PAGE_SHIFT - 9)))) {
>  			nilfs_error(dir->i_sb,
> -			       "dir %" PRIino "u size %lld exceeds block count %llu",
> +			       "dir %llu size %lld exceeds block count %llu",
>  			       dir->i_ino, dir->i_size,
>  			       (unsigned long long)dir->i_blocks);
>  			goto out;
> @@ -382,7 +382,7 @@ struct nilfs_dir_entry *nilfs_dotdot(struct inode *dir, struct folio **foliop)
>  	return next_de;
>  
>  fail:
> -	nilfs_error(dir->i_sb, "directory #%" PRIino "u %s", dir->i_ino, msg);
> +	nilfs_error(dir->i_sb, "directory #%llu %s", dir->i_ino, msg);
>  	folio_release_kmap(folio, de);
>  	return NULL;
>  }
> diff --git a/fs/nilfs2/direct.c b/fs/nilfs2/direct.c
> index 1084d4d586e078ab6825167976dd2a71d52bc8aa..8bd0b1374e25f8ff510f3b36dbde2acc01aafc1e 100644
> --- a/fs/nilfs2/direct.c
> +++ b/fs/nilfs2/direct.c
> @@ -338,7 +338,7 @@ static int nilfs_direct_assign(struct nilfs_bmap *bmap,
>  	key = nilfs_bmap_data_get_key(bmap, *bh);
>  	if (unlikely(key > NILFS_DIRECT_KEY_MAX)) {
>  		nilfs_crit(bmap->b_inode->i_sb,
> -			   "%s (ino=%" PRIino "u): invalid key: %llu",
> +			   "%s (ino=%llu): invalid key: %llu",
>  			   __func__,
>  			   bmap->b_inode->i_ino, (unsigned long long)key);
>  		return -EINVAL;
> @@ -346,7 +346,7 @@ static int nilfs_direct_assign(struct nilfs_bmap *bmap,
>  	ptr = nilfs_direct_get_ptr(bmap, key);
>  	if (unlikely(ptr == NILFS_BMAP_INVALID_PTR)) {
>  		nilfs_crit(bmap->b_inode->i_sb,
> -			   "%s (ino=%" PRIino "u): invalid pointer: %llu",
> +			   "%s (ino=%llu): invalid pointer: %llu",
>  			   __func__,
>  			   bmap->b_inode->i_ino, (unsigned long long)ptr);
>  		return -EINVAL;
> diff --git a/fs/nilfs2/gcinode.c b/fs/nilfs2/gcinode.c
> index 714962d010da4a23e9b5f40de8aaaca8b95a74da..62d4c1b787e95c961a360a4214d621d564ad8b4c 100644
> --- a/fs/nilfs2/gcinode.c
> +++ b/fs/nilfs2/gcinode.c
> @@ -137,7 +137,7 @@ int nilfs_gccache_wait_and_mark_dirty(struct buffer_head *bh)
>  		struct inode *inode = bh->b_folio->mapping->host;
>  
>  		nilfs_err(inode->i_sb,
> -			  "I/O error reading %s block for GC (ino=%" PRIino "u, vblocknr=%llu)",
> +			  "I/O error reading %s block for GC (ino=%llu, vblocknr=%llu)",
>  			  buffer_nilfs_node(bh) ? "node" : "data",
>  			  inode->i_ino, (unsigned long long)bh->b_blocknr);
>  		return -EIO;
> diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
> index 0bc1c5141ec596b3c31e7d18e4ba3541bf618406..51f7e125a311b868860e3e111700d49d4cb98fa6 100644
> --- a/fs/nilfs2/inode.c
> +++ b/fs/nilfs2/inode.c
> @@ -108,7 +108,7 @@ int nilfs_get_block(struct inode *inode, sector_t blkoff,
>  				 * be locked in this case.
>  				 */
>  				nilfs_warn(inode->i_sb,
> -					   "%s (ino=%" PRIino "u): a race condition while inserting a data block at offset=%llu",
> +					   "%s (ino=%llu): a race condition while inserting a data block at offset=%llu",
>  					   __func__, inode->i_ino,
>  					   (unsigned long long)blkoff);
>  				err = -EAGAIN;
> @@ -789,7 +789,7 @@ static void nilfs_truncate_bmap(struct nilfs_inode_info *ii,
>  		goto repeat;
>  
>  failed:
> -	nilfs_warn(ii->vfs_inode.i_sb, "error %d truncating bmap (ino=%" PRIino "u)",
> +	nilfs_warn(ii->vfs_inode.i_sb, "error %d truncating bmap (ino=%llu)",
>  		   ret, ii->vfs_inode.i_ino);
>  }
>  
> @@ -1026,7 +1026,7 @@ int nilfs_set_file_dirty(struct inode *inode, unsigned int nr_dirty)
>  			 * this inode.
>  			 */
>  			nilfs_warn(inode->i_sb,
> -				   "cannot set file dirty (ino=%" PRIino "u): the file is being freed",
> +				   "cannot set file dirty (ino=%llu): the file is being freed",
>  				   inode->i_ino);
>  			spin_unlock(&nilfs->ns_inode_lock);
>  			return -EINVAL; /*
> @@ -1057,7 +1057,7 @@ int __nilfs_mark_inode_dirty(struct inode *inode, int flags)
>  	err = nilfs_load_inode_block(inode, &ibh);
>  	if (unlikely(err)) {
>  		nilfs_warn(inode->i_sb,
> -			   "cannot mark inode dirty (ino=%" PRIino "u): error %d loading inode block",
> +			   "cannot mark inode dirty (ino=%llu): error %d loading inode block",
>  			   inode->i_ino, err);
>  		return err;
>  	}
> diff --git a/fs/nilfs2/mdt.c b/fs/nilfs2/mdt.c
> index 8629c72b62db33217d4747124885b6f727f182be..09adb40c65e505d92012a3d2f5fe8a5696e10056 100644
> --- a/fs/nilfs2/mdt.c
> +++ b/fs/nilfs2/mdt.c
> @@ -203,7 +203,7 @@ static int nilfs_mdt_read_block(struct inode *inode, unsigned long block,
>  	err = -EIO;
>  	if (!buffer_uptodate(first_bh)) {
>  		nilfs_err(inode->i_sb,
> -			  "I/O error reading meta-data file (ino=%" PRIino "u, block-offset=%lu)",
> +			  "I/O error reading meta-data file (ino=%llu, block-offset=%lu)",
>  			  inode->i_ino, block);
>  		goto failed_bh;
>  	}
> diff --git a/fs/nilfs2/namei.c b/fs/nilfs2/namei.c
> index 29edb84a0663caa4b29fa488c0495fc53358ca00..40ac679ec56e400b1df98e9be6fe9ca338a9ba51 100644
> --- a/fs/nilfs2/namei.c
> +++ b/fs/nilfs2/namei.c
> @@ -292,7 +292,7 @@ static int nilfs_do_unlink(struct inode *dir, struct dentry *dentry)
>  
>  	if (!inode->i_nlink) {
>  		nilfs_warn(inode->i_sb,
> -			   "deleting nonexistent file (ino=%" PRIino "u), %d",
> +			   "deleting nonexistent file (ino=%llu), %d",
>  			   inode->i_ino, inode->i_nlink);
>  		set_nlink(inode, 1);
>  	}
> diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
> index 9a8bc3fa35ce9b447abbc2fb56cbd2b0cc5f76de..4b1bf559f3524b1cc3965dae9fd3e5745718569d 100644
> --- a/fs/nilfs2/segment.c
> +++ b/fs/nilfs2/segment.c
> @@ -2024,7 +2024,7 @@ static int nilfs_segctor_collect_dirty_files(struct nilfs_sc_info *sci,
>  				ifile, ii->vfs_inode.i_ino, &ibh);
>  			if (unlikely(err)) {
>  				nilfs_warn(sci->sc_super,
> -					   "log writer: error %d getting inode block (ino=%" PRIino "u)",
> +					   "log writer: error %d getting inode block (ino=%llu)",
>  					   err, ii->vfs_inode.i_ino);
>  				return err;
>  			}

Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>

Thanks,
Slava.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
