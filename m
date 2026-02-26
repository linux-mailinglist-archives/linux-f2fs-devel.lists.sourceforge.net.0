Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEOnAZV1oGmtjwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 17:32:21 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E0C1AA773
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 17:32:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6eXkzzckOm/8cizCVUHlqBE74ef5Aj2CcglA4nJxBpw=; b=CyNoA0dwaOpbumNSTF4fN4J29C
	2v7EnIXh+qDDQyqAPvXv0WNaUZTpDjFjE7VYEbDXUMPe0OuQzt4U5Rqi+woKtRF/GDB1WH7ooueLG
	qqixdNLakcAPfK75rQ1NumO824YytjEmBgssIlr7vbm7GjjvZ5e1g6GurahwYDZXvyPU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vveHe-0003UC-45;
	Thu, 26 Feb 2026 16:32:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dave.kleikamp@oracle.com>) id 1vveHV-0003Tw-E9;
 Thu, 26 Feb 2026 16:32:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j/HoNXy2/KdwEhbaiUHLNsdkhPRgNnGa9lgsHRNcBzM=; b=ME1BY93mfVPj7WqivhJ1bNtTSX
 wPi9oFQn0VBmSHL3DHBN/ILRMGDzWuTXZWYdK/nrHB1EHy6g3uv1WdFeShnW4vowC8gPFd6MjkC2N
 CxQtVDLBTm3CdCz5oN7DHcs/NNETvWZGXcRHmIsq++kSb17vXTHvdXuMT2w9v/FaNbEw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j/HoNXy2/KdwEhbaiUHLNsdkhPRgNnGa9lgsHRNcBzM=; b=Rn9QLou276crR7rgnX0bASWvI2
 z8VnwKfCyRtDimaMFCpUz7dCS80+e1it15Yf2QlcRw2ot+iZl1ELDvkFuhfNRCsO92owL0T2ly5VT
 J2LVXNY+RRlH/UVydYvAc+u7JdAVLaMdLkEfV3Dby0nB7ggBCTYUjzYR5cNFFhHuYhZg=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vveHT-00080Y-RL; Thu, 26 Feb 2026 16:32:04 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61QDND47193388; Thu, 26 Feb 2026 16:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=j/HoNXy2/KdwEhbaiUHLNsdkhPRgNnGa9lgsHRNcBzM=; b=
 BhbEGh7c/1YtYUQgMOQr/5G/95YT1cDKgkbSsh0OZTS36xPf89fd+KBkIGvpIO+S
 pCwESBUnHnYMqvxvZYk4NaMNvvKLUrrnHKjHDmXs+0Ldz/uJSK3sBeF0FPmaWQau
 2IdxZ12tJYmRNp8HT6JWK/O7W9SqqOph4WclvhZcF7gbEdIqQrLCZxGMkEA74XRq
 qnzr7DxaAZIi9zsN2Xz4ZbSCRrQl/vtLSWLkQSgi5cCCAh25UcqC34rfYoAg5L5I
 lsBTE1wkT4sVtlaH1ikgWcrz6rcrUUUDY0Q2knWXwsyfM0QUDe6z+sAB6oE+TQiu
 UvqCNQDx7q3uOG/oHp6GQw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cjgg3ryyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Feb 2026 16:30:36 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 61QExN9S006258; Thu, 26 Feb 2026 16:30:35 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11013017.outbound.protection.outlook.com
 [40.93.201.17])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4cf35cxn8s-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Feb 2026 16:30:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MlWodxLa97ZJNyZ3llD7+HTxGQIrzso8pHbR29KF0/xL+hoSoFR1FXKQUE/jqUKs1BeBbJAW6BovT4+bh3DL1Eo735/+7BvlJmQmcShVvAwkrUotnT2I9R7OSFpmms7IJ04p/X45Lok9lSoLsbnp5e0OFVTsb4cFcVHggW+iuiL0T/6GMB07El/SLrT4MCTh180tiWTaRvrl9wk2O3B0Q/wLREUxLJ7wsYKSrt06cdZW7BA35L74db5ryojT7Bi+ZHg9GxEtYfv9VSe79qB38BJRs/FGOwXjKueqOt4zbjKSOBShebmja4y4gcZ3gSu/5gY7yKc7eqCpFirevyiybA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/HoNXy2/KdwEhbaiUHLNsdkhPRgNnGa9lgsHRNcBzM=;
 b=UcSiC5wlOrjrXMeO9DK0E63iSrCAt7eITnHJw01f7NNyK4ao+WcdAW2wOPlJPggF85lvAB5NT4V+6g8STQFXPC4Z/1kJ87tQh8FimAK/mX2ilXnIqptimuOifn2uwxm3dX6As473CoqEXTF1PJJqHBYKCoAZeIdeorO0wDeFNdf5+rIp/ikj27V4v8AeS32g53ZnD908qdtnGeIDSeRCsd/fkcYSp32m4N680PbbQCkSdefA7lFRccOzke5tNOzVYfuHkwx9s6YrteCD0o/MEBGbDSmQHEvTfvY+ZIPlf9GJbZyk+7DitDW8CmV77TzrANzvLGG915an/qNYkpenJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/HoNXy2/KdwEhbaiUHLNsdkhPRgNnGa9lgsHRNcBzM=;
 b=F0nAmgvlMT7GNK+WMe0zkqn8e1w1eJMKD0R8kTxnp3AD2F2t4GlAFvQfZWad142tbtipAqHHszXHWQRMQxQUY8NGOOPGGHZwaGm8SSA3Mlkot8xLzXlWvbkcLF2BaZX4lL6xh3aKTL5xcz1ldNwur+aBzKNIvf1r0QeoiOMp0c0=
Received: from IA1PR10MB8212.namprd10.prod.outlook.com (2603:10b6:208:463::20)
 by SN7PR10MB6475.namprd10.prod.outlook.com (2603:10b6:806:2a2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 16:30:28 +0000
Received: from IA1PR10MB8212.namprd10.prod.outlook.com
 ([fe80::ee8a:bd21:f1cb:c79a]) by IA1PR10MB8212.namprd10.prod.outlook.com
 ([fe80::ee8a:bd21:f1cb:c79a%2]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 16:30:28 +0000
Message-ID: <68b8e5fc-f979-407d-896b-fb687fc9246a@oracle.com>
Date: Thu, 26 Feb 2026 10:30:19 -0600
User-Agent: Mozilla Thunderbird
To: Jeff Layton <jlayton@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox
 <willy@infradead.org>,
 Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>,
 Paulo Alcantara <pc@manguebit.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>,
 Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>,
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Tom Talpey <tom@talpey.com>, Steve French <sfrench@samba.org>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Bharath SM
 <bharathsm@microsoft.com>, Alexander Aring <alex.aring@gmail.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Viacheslav Dubeyko <slava@dubeyko.com>,
 Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov
 <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 David Sterba <dsterba@suse.com>,
 Marc Dionne <marc.dionne@auristor.com>, Ian Kent <raven@themaw.net>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Salah Triki <salah.triki@gmail.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
 Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu,
 Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>,
 Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Yangtao Li <frank.li@vivo.com>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Mike Marshall
 <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>,
 Zhihao Cheng <chengzhihao1@huawei.com>,
 Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>,
 Johannes Thumshirn <jth@kernel.org>,
 John Johansen <john.johansen@canonical.com>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>, "David S. Miller"
 <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark
 <james.clark@linaro.org>,
 "Darrick J. Wong" <djwong@kernel.org>, Martin Schiller <ms@dev.tdt.de>
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
 <20260226-iino-u64-v1-38-ccceff366db9@kernel.org>
Content-Language: en-US
In-Reply-To: <20260226-iino-u64-v1-38-ccceff366db9@kernel.org>
X-ClientProxiedBy: CH0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:610:b1::6) To IA1PR10MB8212.namprd10.prod.outlook.com
 (2603:10b6:208:463::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR10MB8212:EE_|SN7PR10MB6475:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ecc48f7-f0f3-45bc-28bb-08de755459d8
X-LD-Processed: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: kYbEPIifubRfBpTlOV1gwhN85gd/iSnznPArQ2VdE8CyDcLOfywjKv3UQDjKJWf3SC4N+n6bMxhti83RpFE7+wxe5qnSThVbxn/2vuImKCBVZRrN+c4yV4+jEdIMKfIRwRcLV7dslDJXrjIdWjNEmgQ7u9GEjHnKYBByCcSiOLrTYyBAsBzdJkOcP4RnWL3Kc4AUno2ZTcOZzVQ6rKgZoIlfgbYDTTsWDg87JsgGOesbudzT6R4ne9qQuWOS7W9izwkYfspq1d8lea5aVObVJdKaYOH9N+VYssaun4o1xY4QvMNJaqwU5GPwYvQHf3b0i1VJt/x/fdDx5ZY1Av46JZVAKenSr4vO+tm0BijdVuWWPMmYDtlF02NUqQcgD6FhWdNYq1dwBU/+EEVXLJwdA/weBZRsFavdDnZZoeXv16kVEmjYr1NBsBKcf6v2z7T/+GybmULZ67kWHLghpPmqBM0fOpM9T9FgQt6N+ysDEMMibqqrTt+LDkElzqT9pPtcOEqUQ0j7VYr19IbQToDa5WvJML5fmZfkBgFLdP8v/j87fa6FcQGs6MsUaGhJV/ssrnYwYoL/xQRgjnk8VY1lc+VT2lMIOPHQ3GjZU5gmt4l8jNU5ZrVUSOiqVWHO7FP7Y98xupFs5p0nKRWupnbYZcbAdtany0sPh78raFXy1the9Hyi8Uj5bsipHANBYiBykLghWhV0xQsaRS2H+97jczCOk2JBf3Xwl1zZC5n6kBpQXGXOGCDVw1R/rX8WP9/YsFvo6cCV149uv8R+4tdXAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR10MB8212.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkdMVnRMaVE0UTB5eCtiMjNLTnl4VVdiNmlkc0NRVXJDalNVYlJjSk9HTVRn?=
 =?utf-8?B?aW5JdnF2bEFsazlxVlZwd3gzcHB1d1dMZGlYMUlVUlJVaUJ5Rzk5NGNkK3Vn?=
 =?utf-8?B?dWMyaHljcHpoenFxcnhFM0tjZmNrU0pOYUsvR3RwUmR6WE0xSUx2bkNLZG9M?=
 =?utf-8?B?aCsxYTR3eDZYeUMyT0JMVnJQMkIvSkhHWWdnbGs0SDR4WlNPTkEwVlBMbnJN?=
 =?utf-8?B?Z2NMdDZITWROWTdPSGczeVA2NVlXTDU2eEFDZTFOV3piV2dvVjBoTXV0QmdR?=
 =?utf-8?B?S1p4akNKODQ5VUZ6Rno3R0xMS05zQjFzVERzdXR2bkFOcXA3THdVZ2U0L1ZV?=
 =?utf-8?B?eko3bUtZbDJhWitOaGlmUzV6T2piQllVc1puZHRqMVg1ejc5TTNHd0huMFNj?=
 =?utf-8?B?ZVZQU3pLRzlKL1Y3UDFwcC9HL09Ici9tcVNHQmdPY3owQ3Q0ZUIxeGRiQmxB?=
 =?utf-8?B?cjF4MzRTc3p0WDE0bVhXRmJ3SnJIMmFhU01BYzlHamU5Z081S3lYcTBvZlU5?=
 =?utf-8?B?b3BQSVRFb1VKc3Raek85OXlnM2dtdWk4SE9rSXJoVVRpb1ZZUjI5N2JMOU1K?=
 =?utf-8?B?UFNpWG5TK3IxZzcxc1R0WHdIUlF5a3JFZnQzd2VLZnJGNVBKSlZ1c2c5QVBM?=
 =?utf-8?B?Nk1VTkxiekNXcmN1ZHVGS3BUTjZCNUp0NjNnaGZWZnNzL0ZoeDg1MHgrQjlQ?=
 =?utf-8?B?R3RJRVNuQVFORmg2UlJ3SUY2d0M5Wk1IL1VGOXBBVWFtK2tHMndCMXFPWkRi?=
 =?utf-8?B?QkdWc2diQmVBZnlHbWpRd3hnRnMxRS9JOVROTXJIOE5yV3Z0UXJFMjZ3V1FO?=
 =?utf-8?B?TEh6Kzl2cWVBd2E4YSt4SElBRFcwa0lqK0NMNkQ5YWxhV04yRmhFK21tTWdj?=
 =?utf-8?B?bHFYeStHNUxVZXNFb3RZaS9UOFEwN2FKUWJSVlBpcENBUENJRUVJdnlPQVMy?=
 =?utf-8?B?QXAwRDZKa2ZrYXdzMFpqUGVwcWdtaXFBV3MrMXVodHFMd0NDRWlTOVFZL2Mr?=
 =?utf-8?B?L3NGcVVqSTgzMS95ZlRnYmVXem9NTGJrdDRmSFNMZnljN1hPTDc4dnRtQjJ4?=
 =?utf-8?B?WVJhRlQwZ0dPWDdGU0dyWGttaWdmTUwzNkNJZXNoMHRWUFBLZGZsdXVObDFR?=
 =?utf-8?B?cTdWUjF3Y3BmcmlRRDNHZkYrMk1TNEowREpoQ29HQkhEN2ZzVnRtUk1aQ3ZM?=
 =?utf-8?B?TFdVMmMyT2Y0ZDZQYjJQWGd1NDlLOG4zdVRrcFBmT2I5SzhaYTBTMmhEaWgy?=
 =?utf-8?B?ZWpweWh0YWRhTFVsK1UvNDlSZThwOVBTakZhWlRTdTBkTU9uMThnZjBoNkYy?=
 =?utf-8?B?Y29DNG9PREdzcjVDajE0YXRlQWduQ1c4a2pSclQvbmNBbUczeml4elhNL2wr?=
 =?utf-8?B?MU8wOS9yT3YvSW02NURoME9HU2RQRENpODhtMk93dGs4ZUFWajVnSDZyZ1lF?=
 =?utf-8?B?ZGRweUIyb21TTTJkaHRYLzFOb1ZMejZnQndITEZWNW4yOUpwdVA0SXNJelA3?=
 =?utf-8?B?dkZMcDBTNXhCZlVEK2dqZjZpWDRZSGs2UE9LVE5RQ3NVVUdXYXVHeGpsU25m?=
 =?utf-8?B?K1Q5bFExbzAvelc4c3ZMUG1uK1JJTXBVbDRIa0tldGpsL2IyQVFxb1g3aTBJ?=
 =?utf-8?B?Vlk1U2Y3eldhYVkwV2E2SXBQSGFxYitZQUtnVDIrRG4rNE9SbVdINkZ3QUpm?=
 =?utf-8?B?RkZVMjNkejgvbnA4UnA4VHBwU2U5ZmZTMnM1LzRCbWZDQ0tWdzVRQXc3dnFa?=
 =?utf-8?B?NFNxVFhLWnd4SkN3YW12SVg2RE04SE9yZ3U4UXBYUG9zVVd1ZFROZFEzNWZa?=
 =?utf-8?B?cnpuWTB4OUlPeXBkY3RZM0k2MDVud1UzbGYwUnhBckViSjBWOHdGNWw5WlJT?=
 =?utf-8?B?bjh6Vjg4UVl1NlQzVHBYNGJqREJKN3hId0pDdTZRQ2NvYWd2TFBqTjNGYW1T?=
 =?utf-8?B?cHRlZm9ZSGJ6ekFPUndzV1R4Y2FBbUJ6QUh2aXVGOGFIRzh4ZkplYlRlRDAr?=
 =?utf-8?B?Q1R0Nk1XZC9sUUFZQTBSOVdpRzFnREhYUmNRNk5DaWRETG1FZTFzaUxPNDF2?=
 =?utf-8?B?QzlpV1lxeHVqQWg4K0xhT0VnU1hEV2owN01aaENXUk5vWUxGSmpIZ1VIZDMw?=
 =?utf-8?B?UzRtVHRDKy9KZ3d4OEJyTUtPUHdFM0JaeEtMMzVCTkM3SUlUelJkcFZqd1M2?=
 =?utf-8?B?T2FFdzFubzZjYzZXTmNQQ0gremVZcnZuMXMzOHlqWEJXVngySERuOWhyNXNk?=
 =?utf-8?B?YUM0QU5sVWxEMWVqSTRBY29FcmlqdEJ0QjJGVEJOa0dXNEY3akx4Yzc5ek1Z?=
 =?utf-8?B?UU9NT1JyS2pqMjhCa012eDlFZWpUY0NSdUpCTk03UTJLRVEwZFlEQT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: AmW0KxLhRGQsj2yVbq/qRMcrRaS+VOqu2gGRWBkVnGkJkRH7KtL/KgvyT36rlXPYYgvs6B69pfkZexZzKt02HDqM69PuYZ9H6CJhXQuDt5pXkq7AYD3hLW+7ockQj35jK3//KElm8Ha3CpTpi937G+EE8Wu9/iGke3LssQ8cW5+nxktDLGNgW3XvryGfjXxRbZmZGNDczMJLTCHdGOwvBTunjUcVaApZAzZy33higDEOH/+lS2VZga/fBmJ8vIM6cgjXbSfCloc4qX5/SKdLB4x3RTsEkFCBt7P0ra/lU8stBzajrzWdx+vrWKfSCOxwnC0LV2ZfRuPp4kCTtq0gwDGMmvaOy7PFFyjpiREEsGkD84mU0ypI+p/5V9xUWN/PIQmHcA+q2lPvnOSgMqdI+VJILMvbjISyvcaIf4Sr8s27Wyd/aJARDWAu0jGb0ZshVi4S9hLXNRdz65K9HJTbMQ+SLbPKNFSKwagQ9G/LObEnJbvvBZIDluE3PxW/G4NLFCwvdwKWIMrfhEDvnf9feZmqYKgruPw9z5ikHL9y+5FJ+CPAK8FhzDBw2OSjnDZTZifDjq3MNcDKeqqf9mMT8tEow6P/ofsr8VxHOtH3q30=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ecc48f7-f0f3-45bc-28bb-08de755459d8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB8212.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:30:27.9676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9alYVhTcTkrzQu5ZWCa6xs4AADo2ug7+HQGXNX1HAOGSzoMJQ2s10Ogey48imfCBn6tuI1X9vO8awceQl/CPYLb1LBB0nUXwIq706ZH7yZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6475
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602260148
X-Authority-Analysis: v=2.4 cv=XZqEDY55 c=1 sm=1 tr=0 ts=69a0752c b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117
 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=yPCof4ZbAAAA:8 a=ppRx11uXk-LizC6mCIQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 3Q4Xxbe8KoXc5bIA5PLHVHg90zZiqoDp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE0OCBTYWx0ZWRfX1PYddpXxwlGz
 D0FNwlbPCjgIreFfi0pCJ1l0raCctQvhMCI5HZgGIurq4C33bI7dnO4TRXVUDyf9ANzzFw0ko/X
 g8I4mj5ptJKLFc10uINGg7D1NKrRVzQkT595ZwFuSLqOpEaFEySTJsh5GPET0zP7XS4sY2p+Alm
 Vdqpjpk+8M5Cwxf3NRygYyMgvy9umPss2rJGtdFqG7fgflV6UvtUp0rbeIGlxn56DyY9C/Jg1It
 lXt2sbEYiWkEI8qGbgZXVNix+ppkIdnnySk1bu4766hinnhCLPjkqjiD8ebR48k77B2HFiu1EAo
 1JnAPV7c+gTl2mKLUfNYM0C2qpLc2/xKT7YwZwzKzPISrpRxZUV1fG/C7zbnbHW8ECZKSyla5+5
 XOXMTFJIr1DorK2iyRre6/ZkbiCzQqsQnF0OeylHlYAwPpC4ec8Gu93PiquM1btXjO0SKNW/QlK
 4fOYub0yCZBsL6NzXqA==
X-Proofpoint-ORIG-GUID: 3Q4Xxbe8KoXc5bIA5PLHVHg90zZiqoDp
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/26/26 9:55AM, Jeff Layton wrote: > Update format strings
 and local variable types in jfs for the > i_ino type change from unsigned
 long to u64. > > Signed-off-by: Jeff Layton <jlayton@kernel.org> 
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
 [205.220.165.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vveHT-00080Y-RL
Subject: Re: [f2fs-dev] [PATCH 38/61] jfs: update format strings for u64
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
From: Dave Kleikamp via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dave Kleikamp <dave.kleikamp@oracle.com>
Cc: nvdimm@lists.linux.dev, jfs-discussion@lists.sourceforge.net,
 dri-devel@lists.freedesktop.org, linux-unionfs@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-x25@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, codalist@coda.cs.cmu.edu,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-trace-kernel@vger.kernel.org, ecryptfs@vger.kernel.org,
 selinux@vger.kernel.org, autofs@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 ocfs2-devel@lists.linux.dev, linux-fscrypt@vger.kernel.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-xfs@vger.kernel.org, fsverity@lists.linux.dev, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, v9fs@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 linux-integrity@vger.kernel.org, ntfs3@lists.linux.dev
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,zeniv.linux.org.uk,suse.cz,goodmis.org,efficios.com,intel.com,infradead.org,mit.edu,linux.dev,suse.de,redhat.com,manguebit.org,dilger.ca,suse.com,oracle.com,brown.name,talpey.com,samba.org,gmail.com,microsoft.com,dubeyko.com,ionkov.net,codewreck.org,crudebyte.com,auristor.com,themaw.net,cs.cmu.edu,fluxnic.net,tyhicks.com,physik.fu-berlin.de,vivo.com,artax.karlin.mff.cuni.cz,nod.at,paragon-software.com,fasheh.com,evilplan.org,linux.alibaba.com,omnibond.com,szeredi.hu,alarsen.net,huawei.com,wdc.com,canonical.com,paul-moore.com,namei.org,hallyn.com,linux.ibm.com,schaufler-ca.com,amd.com,ffwll.ch,linaro.org,google.com,davemloft.net,arm.com,linux.intel.com,dev.tdt.de];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,oracle.com:-,oracle.onmicrosoft.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:mid,oracle.com:email,oracle.com:replyto];
	RCPT_COUNT_GT_50(0.00)[145];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[dave.kleikamp@oracle.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: E2E0C1AA773
X-Rspamd-Action: no action

On 2/26/26 9:55AM, Jeff Layton wrote:
> Update format strings and local variable types in jfs for the
> i_ino type change from unsigned long to u64.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Acked-by: Dave Kleikamp <dave.kleikamp@oracle.com>

> ---
>   fs/jfs/inode.c        | 2 +-
>   fs/jfs/jfs_imap.c     | 2 +-
>   fs/jfs/jfs_metapage.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/jfs/inode.c b/fs/jfs/inode.c
> index 4709762713efc5f1c6199ccfd9ecefe933e13f67..c7914dbc91ed97e200edbd114e2d4c695b46fb7e 100644
> --- a/fs/jfs/inode.c
> +++ b/fs/jfs/inode.c
> @@ -64,7 +64,7 @@ struct inode *jfs_iget(struct super_block *sb, unsigned long ino)
>   		inode->i_op = &jfs_file_inode_operations;
>   		init_special_inode(inode, inode->i_mode, inode->i_rdev);
>   	} else {
> -		printk(KERN_DEBUG "JFS: Invalid file type 0%04o for inode %lu.\n",
> +		printk(KERN_DEBUG "JFS: Invalid file type 0%04o for inode %llu.\n",
>   		       inode->i_mode, inode->i_ino);
>   		iget_failed(inode);
>   		return ERR_PTR(-EIO);
> diff --git a/fs/jfs/jfs_imap.c b/fs/jfs/jfs_imap.c
> index 294a67327c735fb9cbe074078ed72e872862d710..3d714fff09992173dfe6c9c74980f034ba4e1a72 100644
> --- a/fs/jfs/jfs_imap.c
> +++ b/fs/jfs/jfs_imap.c
> @@ -302,7 +302,7 @@ int diRead(struct inode *ip)
>   	unsigned long pageno;
>   	int rel_inode;
>   
> -	jfs_info("diRead: ino = %ld", ip->i_ino);
> +	jfs_info("diRead: ino = %lld", ip->i_ino);
>   
>   	ipimap = sbi->ipimap;
>   	JFS_IP(ip)->ipimap = ipimap;
> diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
> index 64c6eaa7f3f264ac7c6c71ad8dd0d59b63f15414..714dbf34b7ac17f82ee9ebec2f9a5b4c5e6f7356 100644
> --- a/fs/jfs/jfs_metapage.c
> +++ b/fs/jfs/jfs_metapage.c
> @@ -692,7 +692,7 @@ struct metapage *__get_metapage(struct inode *inode, unsigned long lblock,
>   	unsigned long page_index;
>   	unsigned long page_offset;
>   
> -	jfs_info("__get_metapage: ino = %ld, lblock = 0x%lx, abs=%d",
> +	jfs_info("__get_metapage: ino = %lld, lblock = 0x%lx, abs=%d",
>   		 inode->i_ino, lblock, absolute);
>   
>   	l2bsize = inode->i_blkbits;
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
