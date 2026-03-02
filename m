Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qI0cCPIRpmnmJwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 23:40:50 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2750D1E5CD0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 23:40:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEtHBFQ3tR+x11RiYdloaU3mJOUm3c8FLqvEMfLbF3E=; b=RCWAcN0Sfqo4iX81V9vkZCRCRt
	4v2DHIn83pkTfhp59xFPsQHzooihkEWeOcmZRFtBapMHoeiMrrULHRRCujDqCpMYj0y7Xg1YAm4H6
	ou6dMEIMhcjYIcchb5nIkXPbPvO8XtJmQmFIUTxkdP6PmjOZjDy2emE5HoLpm76tl1js=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxBwT-0006Da-Od;
	Mon, 02 Mar 2026 22:40:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Slava.Dubeyko@ibm.com>) id 1vxBwR-0006DD-9T;
 Mon, 02 Mar 2026 22:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:CC:To:From:
 Sender:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wvyiFVxybg47Mcu1UPTRmCPhKXcTjGJmrLjQRBCXRDM=; b=kCd8c0qX3s7by03AH5rcND78ol
 rry714iXbsU0AnIkiOyS5FJmIVTEFhSQZKloZUYHmzC2ULHqubpB8C/uAKa6M26Zd1ra8hkKDjIPo
 Fni6M6EMbFOk7SIpBuYMbcalkWJKESdMV07z/XiZwQz9Fl+yBImXYcvT4YOCla77sFwA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wvyiFVxybg47Mcu1UPTRmCPhKXcTjGJmrLjQRBCXRDM=; b=EQSSMgWeBl3Is8qbe3LCv+/2id
 B0Y4hQeATSA6OX3VlCnVPl1HhrIqIndgmVzVGRDcP+Ax5FKM0zpidButGxMgV7EHCsn4X8Qg7SZQJ
 I1Ag0slZLeJ68VYmyncvehSqkvNsed91v9Sx+iNf/VEizt4utnxugsQyArasx8AjXabI=;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxBwQ-0004sj-NP; Mon, 02 Mar 2026 22:40:43 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 622Dn8AH2231878; Mon, 2 Mar 2026 22:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 pp1; bh=wvyiFVxybg47Mcu1UPTRmCPhKXcTjGJmrLjQRBCXRDM=; b=P2KmIsRc
 mQbjYia/l74V9B1j1fVnsCzvJnlfapgz+ehnGsRjbTQg84JFGSorNmfZhkf9Yaqr
 fOLb0FUYPYXgNt7eWeITt5RJkB8pebVR4S+1FfLs6YjMWSOZAavC/2nx/FlU+vxR
 oFgUkiq6GylhtsGNY9QCkKpBV4HvdvMGb4V/8zj6dx6oS67gqNDj7lXs81gelpIB
 +Fjqziu6wxS3B5r99iNTsYSVMDgvTlkqruAGk+NF4v06v3r2l1dbgjN7pdbHC2H1
 cPBuMI5h+Pm21TZxP//YvC7mkl2dLyKJMWXOqXGLvEQQ2FlyNQfVIumJTpO42ULB
 pL4hviPHzkh4eA==
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazon11011049.outbound.protection.outlook.com [52.101.62.49])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksrj0qha-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 02 Mar 2026 22:40:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIqpK9VS6BeUKongMAFnox/Jsg8c8I/wbJ8XqZoV6kUPMlYwX09B2ZYl8x3g8rBY/F1GZmlhplEnlerv3Bglo2Wi+O3Db06ujGQg11iDtJwkdw8C4BJx7NxcmXIyMR2Ow00u3esxQ9umKckFDgjVgNeD/uZ/qhMmGRAwYZLxIqiiOWcwJkRbF8YVokB2GaX/3CM1EgS4AkCXuAcj8nR4JGdhJqF6j+yoGC59ZlnrMzsWc+ulgoB4YojnSLqa8GBL6gwcUcZzoEN2Cfyc6WpS/NioZMbsAOZmvA/SLtjYBA9Tv+Gt2G2fzfb6XRwaD14gTNrNnEBo9NPsJaiNvtPC/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvyiFVxybg47Mcu1UPTRmCPhKXcTjGJmrLjQRBCXRDM=;
 b=k2AeJHwUPXDF8O48KT/Yu0JIyxG56lswnNNRBPY9/UOsVNopaDmDGnm9/KEZzLjIVSBXi45BK0AvA0kG/qq9jIDrhDMjKyOXGgNl+wsFxmXh54GRZef3VrHo3jlRVXqqwD9KoZkI9x0fT8CqaMiLNTk4ypswKWqzF6DptxAhnD+qiEYEdf6ta4/tsQOgAGRhCirT+cXS5jZDhmD2lAL6CMSCzpYUtazQoq9i2n96vnUcl0N5xTp2pyw/EVFDgxVBbs0MzBcKGaF5pgEd6PnvbfoYR48AAO+uj+5BkKujyIVx5NmlPvJ7OOz4ZKXSsHVu38iuG3CSB6u1/kubO8rcPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from SA1PR15MB5819.namprd15.prod.outlook.com (2603:10b6:806:338::8)
 by PH3PPFE061D9768.namprd15.prod.outlook.com (2603:10b6:518:1::4cd)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 22:40:05 +0000
Received: from SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539]) by SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539%7]) with mapi id 15.20.9632.017; Mon, 2 Mar 2026
 22:40:05 +0000
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
Thread-Topic: [EXTERNAL] [PATCH v2 084/110] hfs: replace PRIino with %llu/%llx
 format strings
Thread-Index: AQHcqpMx+NxLh9ejn0CNwAL8fSccTrWb1d8A
Date: Mon, 2 Mar 2026 22:40:05 +0000
Message-ID: <03db867ab541fd2304b9a5d88a2ecadbd2d6e5c1.camel@ibm.com>
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
 <20260302-iino-u64-v2-84-e5388800dae0@kernel.org>
In-Reply-To: <20260302-iino-u64-v2-84-e5388800dae0@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5819:EE_|PH3PPFE061D9768:EE_
x-ms-office365-filtering-correlation-id: 8d30e6d6-0fd5-4af1-8dfb-08de78aca656
x-ld-processed: fcf67057-50c9-4ad4-98f3-ffca64add9e9,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024|38070700021|921020; 
x-microsoft-antispam-message-info: ooZGz2Yu/dGE66ycztvj0hhDMBRTo+7aRjJbOMG1f6XYqSktKVCnOf3BDDs9ZcPqdXUKAPWevKDS86ofxJLkauAKHTAOeBJ3IW+DWMJg2WtAv0fQRtgTOie7Xs1SZKKvUEBBapHoZd6Ee7r53KwLxneCaA4xuIKMREtITESshhf/EMixAkwcDGLThWER81xYsR0z/81hjVFXeZciuvjnMBg0eomnPVyw/vWSCh+WYZPviIsoUbmdCryBlFibc8bylg61ye67aeAK9OkT1qrqqJOQ6WsbTzT/lnFCMfMQi8tcl8lNnLZcbuaJ2nOINM9cPoTsQEZz/70D6W45m6rGqB3ufdebxm7bsK601F5dewKGRuH2llUthfDABlDs7WcJ4Mejfjg4gcEYpstFnn8GfcXJxy6qzWHk+R8jkNJyr2o7A+elVmn07lLAPsrOLoOoA9mHjxgwOqm+AvkXHBawF9vQ0k624jI1zOGRApSHNfwtIz4PzCt9DJLUIxkTklheksPIdURz0L3V5b2+HD89qtyl74dnArC+i6GtFcM5Nc0hb7FV0/Pl7uJtaUDk4P5ulwcJhk3+WEK6ILtGPT5hfis23lmbx4F3spyiQZOiGv64uofosDle5EhqyOcXAYQARQywpff1s/6dZ2f/PQgnrDFBkh4uObVLxbzsCsnCRSl+zh/q2DzBD+5lvO/3W/ZOtbNvx12CytJnAtpBDYgJ3eNefkV2HRhY0K1M6HzFJihPCi0+2tbVWpawfs5vScVxBXZL0XaVRervdWw0T99dDO4wsCf0tK4f/bqjxDf8QKQIJ9mOSJILJzV8xsH2xY4I
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5819.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3BVeUQ2TkRyQmlFYXkwb1BsdVQwV3NaTFArMUNTUjhvRW40bXp4aVNTVkh5?=
 =?utf-8?B?ZiswbXRzOGk2VWJEOWdobzhKdTgzbXVtWld6TWhxVWlUTGJadkdWejMvbmRH?=
 =?utf-8?B?UFZPOFlCOGE0c25jTlg3N2RNYStJM1BBTFlWSHF0UXhTTjdJL3lHMzh0R2VG?=
 =?utf-8?B?S3NlTVVmTGVVWkVYTUllazI0SFZKS0M2akQrclY5bHhkelJJVUQ3elpvSy9L?=
 =?utf-8?B?Z2tzTlNiVW91VXZ5MHVTalJYMTNuT3ZESVBHYzNOblkvWjVpZkpkTys5a3Z2?=
 =?utf-8?B?c3BuWWpzQ3NtakVMVTBQRFJCYno2amJKSjJSWTFLVndOQ2kvRmxZU2V2aXRB?=
 =?utf-8?B?Wi9neXF1N25FNEdmNjVlTGpZNTlpbDV2WDhHZVIreDl1aGxaM0Y5ZWZoMkpi?=
 =?utf-8?B?QURIK1BDZ01tbzkrMDg2YTR1aTE1RmduQ0g5WXdQcm0wcllpdFh1TnIxclBB?=
 =?utf-8?B?MFZDZGpjTThwRURnMjJuTkttYmEwQWFERzZtVllCTEYvVExReGJhRmxQZWhp?=
 =?utf-8?B?N2JodUlDWWRrdzVPWnJGdWk5UlhDWmQyRngvNnNzdXZBTUVIaEJTMGlleXFk?=
 =?utf-8?B?TlFJaDZIOGFScGtobnNDZW5XMERaalBNNDVQT3lSZFA0ODllUTIrOGcxcFVX?=
 =?utf-8?B?SWR4a2dKWFMzY3hxMkNlNk1NL0MzMXJ6NGlSMldaMmxWY3ZMZnd1TUV3QzV4?=
 =?utf-8?B?Nms3akswUm1XZE9mVmplTXVlc3hqZmxLT25xSHFVTzE0V3Zmc2c5ODFCNFpL?=
 =?utf-8?B?Ym84Mjl4ZmZ5Z3ppVXh6bVRId2ZYdnFNOG9KQlp1RmdKbGFBU1NmK0lkWUpk?=
 =?utf-8?B?R3RCY1J4T1o3V1B0a2lJSWEyd3VBZmVtZXZUdGNqN0dwcUlyandpUm0vREtz?=
 =?utf-8?B?bmRoa0pBL2llM3JHT3dlYm92ZWNzWGxHYlJBc1hNb21WT3B4Z3N4L0Z6UlAw?=
 =?utf-8?B?WEZ0eVdBUjV4amg4OFIzQldtK0hjZGhRempzMXpzVWdWNVAxRC9nYk1pVXFP?=
 =?utf-8?B?MXRTMHJkRGhZTExqa1Bmd2RCb0RYMHRUU1BQbkIzOHFDM3FtZ1NCbTNhMWc2?=
 =?utf-8?B?K2VMaCtpN0FGL1RmTlppTXRwVFZzSEh3WlJWTFpYZVdYRGhrN202Z2J4cjNv?=
 =?utf-8?B?SUZZejVCZEgyUzlORUhkZVRBZ0h0cWZNV3Bzbmc2UFpKS1pzamFKSktiSndF?=
 =?utf-8?B?T3E5dkNETGRjOVVsa0JpUWc1U1RwRWYxdFY2RjRzS09VNk94aWhEOGZ1WnlW?=
 =?utf-8?B?MzRGdTA1aEZzb01GR0RlSEN0UytjdlJyRDV5K28xTVdBdXJCRGtYcXNmQVVp?=
 =?utf-8?B?ZnFWbDVodXZKR2laMlBLZkgzMHBRYkwyQmtTZHE4Q05RMGtkRXRrMUlGSVl4?=
 =?utf-8?B?UWJjMXQzL2tPNXdZdC90U2owRFpWMjFzbS9nV3JyeXV5MG5ycTBSL1BHZ1ZD?=
 =?utf-8?B?cFlIRVhBOXN4QzRoSVhJSUZXbzgwUytQSlhlVjhuWWQ4U2FNUDRkamJWK3Ri?=
 =?utf-8?B?NWFteXkyOG05S04rbENDOXl2ank3RlRsYjJQK09YWWlKY2ZPMmhvTDFkSmh6?=
 =?utf-8?B?ZmxqSWN2MmVVSWxXY05reE02MFU0UmgrcHpCczRBaGcwZDU2ekxqLzdPL3RT?=
 =?utf-8?B?QU4veTF5QlVHaUxxNzh2TjVBSjJvMmhXRXRnb1libXVUSDZIemFwcDluM3kw?=
 =?utf-8?B?MVkzTTFuQmdUcnZ6WGNwZStmNHJOY3NqQWxKQWI2OERUMUN4NHlDb2orUVZW?=
 =?utf-8?B?T0VqV0pvam9iWmVCMFdGS3hzODlNU0MwTnhmMnR1NnJpcnZUQlN6QWtoa3M4?=
 =?utf-8?B?YXZVVGlJc0owZ2dMSFlLS1dubXlhUUsrdm1rbE85VVg2OFNTLzJVZkJpRmg4?=
 =?utf-8?B?Zi9hTnFxbitBKzZVOWdlcUZOc0pnVjMvcFNkZG5CU295QThWcWVWRFRIL2Q3?=
 =?utf-8?B?cUFXZGQwNlgreU9pK1F2UGFGK0kvS3Vmc0pmc01vbjFqc2pRYis1RG9KalBM?=
 =?utf-8?B?V0NvcVcxYm4wMzd2QytnSVZRbnlCbGhPU25HMkxXV3J4SVpDNjZHRDIyd1BI?=
 =?utf-8?B?V0xnWFB2cVlid21Jd2kxNUpEQUtyMzU1Q3crMkRsaGdpUkd6cUJpeEQrUVd1?=
 =?utf-8?B?QzBsdHBlbTVBVDM3aTR5eDM1QWxTdEhjTGhQWHpUN0grZkpETFdmZi9SU1l3?=
 =?utf-8?B?KzFEVW9Pa1N2YzdmeFN6aEFpeVJNMXVPalREYVVLbWFTNXFmNkQ0WXZ3MFhO?=
 =?utf-8?B?UDFWODJWekp6NjZvTU9GRVkvTmRKeHhHNGwrUFZKVThjNjZJTzl0RUp2SWZJ?=
 =?utf-8?B?OXNmSGE0TEExaFNZNW1Qc01oVFFRVitIS0RSUWNoWW5YOXJHN0N0NDFZTGpO?=
 =?utf-8?Q?UXM+spwWtnbbC8TBgsCzcXLLYJ/qnAWLcVQPA?=
Content-ID: <8CE70ABD87053446B519F6717D20B910@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5819.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d30e6d6-0fd5-4af1-8dfb-08de78aca656
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 22:40:05.3119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IlzlxQegRMRT0GzdIH1F7vVPhQpkKeKm/W5FxOmpZiLcSAoPKgB3aeA+4uTd+TWJ+VLWTEGQKabqr26HMv0Quw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE061D9768
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Rp/I7SmK c=1 sm=1 tr=0 ts=69a611ce cx=c_pps
 a=M+4CHf8fKMkYOwSYEMZyZQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8 a=wCmvBT1CAAAA:8
 a=yg8HEki30JHSbY7BnakA:9 a=QEXdDO2ut3YA:10 a=6z96SAwNL0f8klobD5od:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE2NyBTYWx0ZWRfX0IodLcGkW/B+
 YTCOob3gqMCs58OeqFMr/e+a6PzSmuunuBqfVvIik8CkW6v976N5y5v7UwU37sQ1ZI4rBCqfb/q
 esANCJC+cnHtPHkNVWa2MUFavkYQQSe4km5bZQw+Eo9vbP9GwCmNx3z1t84t+GOkHYUWI555rLX
 7yNHC4K+557PyUqeNkv3iurOk06L5Tsbm9x8A8jbV6I7qHX03cC79/oaWCmgLv2YvTe7D4yYqD5
 E1WEGHarzJgiJ69zc72r9lPTs9jEseTi6UV25nw9AiiTnh1KCGB1xFnSLNwUH6U4V7OlHcEd9ua
 y/zGYWcl4F4OF4tAeWwpkW0hbunI8QJBfNDlAoMCHrbmDvuzrsn4mMnAlXjn04x3Yikoj7VcdIz
 mc/xrEO8x9rFd34gf+M0jJnSQJHhlgf5/hiG6+q2FdUDe0mZdqysFGzDrsKMqYN5CYeTtECYx6q
 +fD6J2zf1ucgrupKsMA==
X-Proofpoint-GUID: ccL02fxDQi3_v42g1W7RMUI5KNjfU2As
X-Proofpoint-ORIG-GUID: h292VF2q0kmRUjKtfU-LM7iyE38jGXvw
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
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 2026-03-02 at 15:25 -0500, Jeff Layton wrote: > Now
 that i_ino is u64 and the PRIino format macro has been removed, > replace
 all uses in hfs with the concrete format strings. > > Signed-off-b [...] 
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
X-Headers-End: 1vxBwQ-0004sj-NP
Subject: Re: [f2fs-dev] [PATCH v2 084/110] hfs: replace PRIino with
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
X-Rspamd-Queue-Id: 2750D1E5CD0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,dubeyko.com:email];
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

On Mon, 2026-03-02 at 15:25 -0500, Jeff Layton wrote:
> Now that i_ino is u64 and the PRIino format macro has been removed,
> replace all uses in hfs with the concrete format strings.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/hfs/catalog.c | 2 +-
>  fs/hfs/extent.c  | 4 ++--
>  fs/hfs/inode.c   | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/hfs/catalog.c b/fs/hfs/catalog.c
> index b07c0a3ffc61584165e8cc9f646de6066a6ad2c9..7f5339ee57c15aae2d5d00474133a985be3af6ca 100644
> --- a/fs/hfs/catalog.c
> +++ b/fs/hfs/catalog.c
> @@ -417,7 +417,7 @@ int hfs_cat_move(u32 cnid, struct inode *src_dir, const struct qstr *src_name,
>  	int entry_size, type;
>  	int err;
>  
> -	hfs_dbg("cnid %u - (ino %" PRIino "u, name %s) - (ino %" PRIino "u, name %s)\n",
> +	hfs_dbg("cnid %u - (ino %llu, name %s) - (ino %llu, name %s)\n",
>  		cnid, src_dir->i_ino, src_name->name,
>  		dst_dir->i_ino, dst_name->name);
>  	sb = src_dir->i_sb;
> diff --git a/fs/hfs/extent.c b/fs/hfs/extent.c
> index 60875cc23880b758bbbb5e4b8281d9ee1f2dbcbb..f066a99a863bc739948aac921bc906874c6009b2 100644
> --- a/fs/hfs/extent.c
> +++ b/fs/hfs/extent.c
> @@ -411,7 +411,7 @@ int hfs_extend_file(struct inode *inode)
>  		goto out;
>  	}
>  
> -	hfs_dbg("ino %" PRIino "u, start %u, len %u\n", inode->i_ino, start, len);
> +	hfs_dbg("ino %llu, start %u, len %u\n", inode->i_ino, start, len);
>  	if (HFS_I(inode)->alloc_blocks == HFS_I(inode)->first_blocks) {
>  		if (!HFS_I(inode)->first_blocks) {
>  			hfs_dbg("first_extent: start %u, len %u\n",
> @@ -482,7 +482,7 @@ void hfs_file_truncate(struct inode *inode)
>  	u32 size;
>  	int res;
>  
> -	hfs_dbg("ino %" PRIino "u, phys_size %llu -> i_size %llu\n",
> +	hfs_dbg("ino %llu, phys_size %llu -> i_size %llu\n",
>  		inode->i_ino, (long long)HFS_I(inode)->phys_size,
>  		inode->i_size);
>  	if (inode->i_size > HFS_I(inode)->phys_size) {
> diff --git a/fs/hfs/inode.c b/fs/hfs/inode.c
> index b19866525c1e9c43decf3a943c709922ee8630f6..95f0333a608b0fb57239cf5eec7d9489a25efb3a 100644
> --- a/fs/hfs/inode.c
> +++ b/fs/hfs/inode.c
> @@ -270,7 +270,7 @@ void hfs_delete_inode(struct inode *inode)
>  {
>  	struct super_block *sb = inode->i_sb;
>  
> -	hfs_dbg("ino %" PRIino "u\n", inode->i_ino);
> +	hfs_dbg("ino %llu\n", inode->i_ino);
>  	if (S_ISDIR(inode->i_mode)) {
>  		atomic64_dec(&HFS_SB(sb)->folder_count);
>  		if (HFS_I(inode)->cat_key.ParID == cpu_to_be32(HFS_ROOT_CNID))
> @@ -455,7 +455,7 @@ int hfs_write_inode(struct inode *inode, struct writeback_control *wbc)
>  	hfs_cat_rec rec;
>  	int res;
>  
> -	hfs_dbg("ino %" PRIino "u\n", inode->i_ino);
> +	hfs_dbg("ino %llu\n", inode->i_ino);
>  	res = hfs_ext_write_extent(inode);
>  	if (res)
>  		return res;

Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>

Thanks,
Slava.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
