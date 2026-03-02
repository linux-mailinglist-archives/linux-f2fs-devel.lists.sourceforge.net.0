Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDYFOa8OpmmFJgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 23:26:55 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E27DD1E55EB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 23:26:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ylNlhxD40k/+Egf5Fo7aOWQtUtb9Fc5sXqchQcdDWA=; b=GajXxlpBOWDEJSNJ8LmVeTpeCk
	tCCNxwSqVgmSggnJKQpxb89hPWcNFSXBsVGWA5HKDo2xeY4FgAdDoZQx/hcp/4Y2HGy84LoGDW+fb
	723ZOtVuCU43KDtJjQk/pFEszqvM0A5qBoAdadGQmlVaSdTq+jW42bt+u0ngDuK3cAUk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxBiv-0006Iq-NG;
	Mon, 02 Mar 2026 22:26:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Slava.Dubeyko@ibm.com>) id 1vxBit-0006IW-QN;
 Mon, 02 Mar 2026 22:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:CC:To:From:
 Sender:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uZ60Yqc7eq8EcLOY3OXxCeDzWF/RRQAsWvDRVSzsWDo=; b=j+l8847r8h8ZtfCGpL1rXUpfC6
 MNirGxnS8WnQPc/+kdgu4aAjzNG1LljbxUVAZGTVS/GAK1Axm1rtk5/h9WOuN8uVdiLMFzy8yu0Ok
 nxraHUNempQR4MImzf7o3pN0yh5UgabqFNh8Cs6bXF6eyupDYFd7MUMvBqPEbmWxGp/8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uZ60Yqc7eq8EcLOY3OXxCeDzWF/RRQAsWvDRVSzsWDo=; b=Q0zC6ee5pXBWQKtKrmZykbTGKn
 IKSBOfdcSNV7zEHV1xjth34AqxfOQA6IQJm8qdZ7yOUwy6nkGpmJNdHnQbjp5p0/QoVcM62ZsswUI
 TgMhA+SgOT/cVNLLBa2x2VeEqZfN1UsBvGEbsUSh0dogV2H3RlK+/uR+DUyeG4y1hnk8=;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxBis-00049B-St; Mon, 02 Mar 2026 22:26:43 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 622C8YAW1479574; Mon, 2 Mar 2026 22:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 pp1; bh=uZ60Yqc7eq8EcLOY3OXxCeDzWF/RRQAsWvDRVSzsWDo=; b=fPi7yGIN
 tTQp00FXmhO6Cm8s0QVMHHnt1X01BKvYRnnCUIeo7JmcYkmK1kythJCVem26SIa7
 tCIaXxnNoAmgBE7AoPBLx+XymbLhT4CqcaZVzD8qmvXsrH1+9PYG3k+fduJZ44Uo
 BBRiM/66y6DXrZ7PjsY898mwyMVlofE/aV2MeCZs1K5PPf94S4fbFCgiJSKKF281
 Y/W95bAmLQeIuLVjLMhHBl2EPMS6aQMxag4S5CjS3xX96hvV0VpVQFF2gY+DQcFB
 NS/D3EXEAfS+3pgCfOR9X8XGrT0ttgfTyrw1vhQTnWLqxLgpRhMO9sqhSNqeOUwV
 SF4SSfMAomz/hw==
Received: from ph8pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11012029.outbound.protection.outlook.com [40.107.209.29])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksk3reyh-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 02 Mar 2026 22:26:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FR+3JJiNj6/IHxwCuALIr82qg2QA1Vq5F++jcNOqXuO0VNsmKSnDSQxxfdj6Wt+H+ho+fYWkUNxdJWktqjPIBIdA+YWcKr2dJvaqqhthJHlPrjqPqq6bekFXwYH7DQ2fmCTFDGuLyZZkauNMjxz6C+llwcxQE4QflCiMUYgMJJuPgRh05JxFY3g3aAcwcMKaFvKb3irB4y3EComBVmFbJvbaGDNk3r45nXzBiNnSK+Mmy0ZfpAqojNd/WXJerjuBOFoGyet+sZQeVFxt/QCpKbW8bpHdl1EtBakaJ7mxaiHr6NRUNygePYTUNcqEhNzCwJsSkUfVHhrLdkA99fvQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZ60Yqc7eq8EcLOY3OXxCeDzWF/RRQAsWvDRVSzsWDo=;
 b=E/E+i0CEfs6kGas+dfFpEnfKR2DW9tH53wBNoK9ThM+iwra6cgwPklLERLQk1uWDVlpp0MdzlKAOysY8OWqsBeisTIEaZGD74ZZS6PWBOkX4lMQIT/PpVOUOyACJNb3osf679rddccfuLFPo7iwzLz5e4mwqOkzv7GafzWEGmWSRzOO4j4W0K7cOoIU5pA9/anLbfZ+OqCwKWeU+/i7t9vYV1naPwk7vvTCPrvkIqNHBzqO2QMF/uJF+z/buOgE9qC8Pqy0gc3Cz1vmLgUHxiJM1QDzwnlS+klR90cfNBxd5uupNAo3SDfQP17nG5yeE4GJTj1eILmZnWnohwjgYDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from SA1PR15MB5819.namprd15.prod.outlook.com (2603:10b6:806:338::8)
 by SJ0PR15MB4423.namprd15.prod.outlook.com (2603:10b6:a03:374::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 22:26:04 +0000
Received: from SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539]) by SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::920c:d2ba:5432:b539%7]) with mapi id 15.20.9632.017; Mon, 2 Mar 2026
 22:26:03 +0000
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
Thread-Topic: [EXTERNAL] [PATCH v2 031/110] hfs: use PRIino format for i_ino
Thread-Index: AQHcqoYSNHb+mCxJykasKzZgGEGO8bWb0g2A
Date: Mon, 2 Mar 2026 22:26:03 +0000
Message-ID: <4696c89e78ab7b1683a8a8661d49edfcc1d06f69.camel@ibm.com>
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
 <20260302-iino-u64-v2-31-e5388800dae0@kernel.org>
In-Reply-To: <20260302-iino-u64-v2-31-e5388800dae0@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5819:EE_|SJ0PR15MB4423:EE_
x-ms-office365-filtering-correlation-id: e26e3f9c-5036-4fad-e511-08de78aab05f
x-ld-processed: fcf67057-50c9-4ad4-98f3-ffca64add9e9,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|38070700021|921020; 
x-microsoft-antispam-message-info: pWh4nIjXhs2zCY21ob3XvzulbeZX2z1vMLO/ll/ru+f7LgCo5ol7YGP/gLwH69P1dh0amAmn7UOf8e0GkJpQhXC7qpFEZFbE6gnLqdqfiONae7ZgbdAg8N0UmV2uHoDlLB7byd/TP8B3ziF3oFm+IuVtDQc+SVGYrFpo3wO62Og+0pRGcMIMRW17OHd2iIMOko8j87eZEl1vJ3+dPnRFNqGBosQQGq7nSy9+cvhIsQCyvl4vA4YM7IXwQ95iW4P/acQ8O9FkE3iyaM7A8DDB9eAgNIrspnfZ9szVbr+r60npmW5kbq7C5ZdUa7zIki6w2EK8EzYnOZ/n+2SfSTJ6lCtcoS8C7S6164+wxPW0t8IXN6DUh9JyGtLQOPeBtH8tlQeju1XK3b9BTBPHHi4nlIJvZZoLa8S9cy1qLXkQgpXj8nc0V3CRQFZMxrehbxhCt1akhNGzTvyDadPGDl54XOLYCarlshXAWQPQ/RiR1p0lSmjsMsijimk+FYogs/asHPgnGU0EPe/1u2ZVWirGejfiZ6pixsdRDDVWFjmRZGkPms9PfyYa4juUdfgdHZcIMmbCXnHGi3YfF0oupMMcBeQXIWGuA+oUyWOANbBf4D0vYW2otELt0cXSLd5OvRo+rAdO7lg37u/ZCq9yE2cblPC2kR2fIZChzjvvrNkQbiiZTYfQ9AMjjsJj5DWnBy/qLnJPc4iMICocMA0M3hPUJsV6hV4nNZPNXXH/+ETqE15WgE04B5sM/VS5n4UoBdf4s8mDxNRlInnvfioHxhREWVN7iRbwZtDGmxYwSHxW2kzHpsZ2uXvuuK8BCQARVyXK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5819.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STluOTVJcVViUGxHRUhLWGh2TWRSbVhOU0pJbmpvSEJFK0lJZTFlZ0FuSmJF?=
 =?utf-8?B?alBVOVB6aXBCcUJBc0FnZEN3UDhDdCtsZjIrRkd6Nm1mekNiV1QrOGRJTGZZ?=
 =?utf-8?B?UnE2UjRvU2czZ2phK2cyQ1ZSak5WdVdidGVZWllYdkFRNkNwUm9HVUE2UDNi?=
 =?utf-8?B?VXZOL01nZ3g2bCtOY0JyYzZPeDNFVms4aEppM0hpMlpIc1l0QlhJcGxONW8x?=
 =?utf-8?B?T1B2TlEwMytvenlsQUV5QU1zTkljbDBIVGFrYVQrK25BMC9PYUt1YXZ1amd2?=
 =?utf-8?B?TlFMaGpBZ01mNDRZY01HOXpiRGllcDZkTFBXSEl3ZFZDM0xIK0RpdW9WUmJI?=
 =?utf-8?B?WGdnQjJ2Ris2MTMzNjQwOXIwbXFGMldVNHUwakQ5Y2pOUHFzYXBPSmZrZ2Nz?=
 =?utf-8?B?cnJVajJ4MEdMMjdsaEVNZVY4b05qOGlHZ1dnTWF0TEx2L1N5enFJaU90bEZV?=
 =?utf-8?B?NnpXN05JenFsZytRamVOWlNlZ0F0SkZ6NndEQXZPSDN3NUN3bzZJdnFiNXo3?=
 =?utf-8?B?SmhlbnU3Z015Tyt6cU9lZXlhR2R3dVNhaWNYVXkxTXBuL1puOEtIQ1BDVFpR?=
 =?utf-8?B?UytHUjk4MUtuYUN6OEV4TXVCazQ1YU8zc01MQW5ISFVIS3Z3RU5iM3RJbzE5?=
 =?utf-8?B?aS9NN0xpZmJ6d3c1alFGMEswTEhRdDdMVlBselBVenVkWGd0ZnVidXM3bThY?=
 =?utf-8?B?WmdaMyt4eUxvYmhTemhlakpscTAxK3JlYjRYSkpucm54TE9LNmlpYXg3ZW90?=
 =?utf-8?B?WDk4bzZhWDNaQnhJTDlHeHdWei9IOVJyMm1mOVQ0b2N5ZG5iK1lDZzd4dEdP?=
 =?utf-8?B?d2JKUWVTNGFGOWIrcVdqdk1najNDZEMvNC8xbk5Od3BQNVFlY2RKU0JpOHVZ?=
 =?utf-8?B?TURsRGh5QkRyUFRvbzVIQ0UxZ2NNaEMwWUkxbkdRR0Q1T1F3TWhrcGhkVmd0?=
 =?utf-8?B?M0x3blNkbGsxZkVQVDlCTFF0K0FSMk1xWms0aEE4ZVJJdzIweXVxVTdvazNm?=
 =?utf-8?B?UjZLVXJxU1VRNnZnTzUzcXE2MEpIbDdTTHpPMUUrN3RwVlFSZGJyRHFtK1dY?=
 =?utf-8?B?M21OMCsyMlFrQnlVYkhmOTcxTVlYbnZaZlBrRVdkUVRKcTNSWnpHa1RQdUpu?=
 =?utf-8?B?eXZwaVkxdnloLzk0N0NubURnQmNUeFlCZWgrSitPVmxMU3liL01DNDhsRjBY?=
 =?utf-8?B?dTNoSUdHalJvdlI1QURaUVErZUhseHFmcE5ESk9rRmdoY0N4dUwxSEd0cEtp?=
 =?utf-8?B?L0VuOWs5TUtPTUc2VHNCSmE0dHE2c2ZJd2pPbnl3dXR2MVUwbWFtMGYvQTZT?=
 =?utf-8?B?M3ZRRmZNYTBHR0dna0E0b1J3ejhNK3Y0V21OdVBFb1QzT0hGT2lUNkxEYXNU?=
 =?utf-8?B?UGw0WTFwQzhtNDUyS2U4UWNPY1NQT2sxK0VCd1lhL1l3aVlkblMyd2tvM1l4?=
 =?utf-8?B?ajR3M1A3bTVTVWlMRkUrdURmclVJNnF2RW9ZMnlzdXNpMmV3QjArNTQ4YW5y?=
 =?utf-8?B?MnBSbDFqUUZHeURURTlNRFBmUTdGSE51TnMrbHBqb1ptWmg0S2s3SFZrUlBy?=
 =?utf-8?B?cWlBaitoaDZFRlM3VDlJMDlUSGJOSld6R3U1V2V5UFJqVmYwbFRvUEpUY21W?=
 =?utf-8?B?dnoxT2NDZ0VvaStHUHQ5QVRqaHRudkJJNlBITnI2Ukp0dUVSZ0dOdUpJdzJn?=
 =?utf-8?B?ckVId3FTQkhINW1WN0lKcDhzUGY4UDYzc3NtK2VjTnpPWTB0QUQ3V0J1RFdC?=
 =?utf-8?B?WnBJRzV3cXVqem9XVnJoWStmeHFaT0x5VU9Ha1UyQTZVMUM2eTRmQ2dybGdL?=
 =?utf-8?B?dmZJT2pUcUlVR0FSV2trRnVrQmdlMW5YeW16QUtGK2pHdmRzRklKbXFKRU1N?=
 =?utf-8?B?bGE1TzlKK3F3Y3drR2tVOWRMcks4SWN0S1JIbnFIeWlsWVhTQTZqZ3pzc3lE?=
 =?utf-8?B?NUpXR3k3QXhna3BXd3NZT2RlMTVLTm1kdVVtS1lHVFNGNWloSWpFdzV3SHVo?=
 =?utf-8?B?VXQ5cE5UbGtRTVRIU2ZhL1pIWUlGSmsyZmZ0aHhLY0k1SWNCalN5WVZxQnJm?=
 =?utf-8?B?dnA3MjhMV0tZb2FkVXVoSTI1MlBMLytTaXFQZTJ3ckpoZzAzKy9pZ1FrVlRU?=
 =?utf-8?B?Y1FZSHhmZVpXZ3ErbEFad2pta2dLbVR5NjA1cjVGejdKQnN4VHVlYnZ5QTNS?=
 =?utf-8?B?VWpXZ0plVFVWTWpOQVovRUk5TUdSdmtaNVBiSUlKZjlpN21LZVBDRmNiUU9m?=
 =?utf-8?B?YnRWdUZEYUQzUkhGMk5ieDdscVhybno4cEhLYWRWdC9zM0hlUkU5M2syZDJv?=
 =?utf-8?B?bzZLL1dFTTJhV1hjOW1sVGYzcU1FWmllRm9xZ0ZrUDM5TFY0RXNweStPLy95?=
 =?utf-8?Q?n32DhOKc09d8EvrEabCFZOeJoyrNWsh4R7/60?=
Content-ID: <B224E435F15EE94DBAC391DD3038C61C@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5819.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e26e3f9c-5036-4fad-e511-08de78aab05f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 22:26:03.1503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L4wjfCLD+oU2GkL2qKq9WHmFU9oMNpkCYUTTEE4j2QBaLRHsKud/rKPSy+63Kz7HrsEneK44++631gh1R44+Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4423
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: T-7ZEgm9piPV-Jvbi7NCb7ZTNpKp2UNY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE2NCBTYWx0ZWRfXyQ/tuReNm6Fx
 deCPCWsDQCJVo+ixYQ6Xy1eTT/arKjv4MggriID9p0Q1CnbL05VC6z5/Nug88wAE7w21oMyYt2X
 2gCbJByMFkhpxpe0Eb3kuog8UJgN/IKsQUfHJWb+ApBYpkc4uQFpYQTvjY6QAue/ZKYi/KVKDpr
 Ypu/QnkOILSTP7Ps7WX3pYTQ5rGyBfj+gAiumibpt/OMIU4AtAoQ/M+I7nGN/7QVg9IsFZNXFqQ
 epjsXzu63ucczPWhR763UvcGi5fdjBNVc+nOaq8imOVzcjdNTRh7bRYKTl+h5wcJIlsW6jEtuIZ
 gEFI74P61FO8sDTbpXhpKpGBDirlj2ZBTvddt372YoAT+z3EcyDDijRO0KWlQvGXQ0AMpTPv8VS
 DfyHyhhGDXX+ZlvPydPq14nRsmG4q6/2JjNk/JUrqaHanipKaiZGraKoX+QpcADiRzkWO5qyR9t
 Bv3ttc2LaaMjNsutudA==
X-Authority-Analysis: v=2.4 cv=csCWUl4i c=1 sm=1 tr=0 ts=69a60e82 cx=c_pps
 a=WJg1qJ+8ll6SXBP1xA03Zg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8 a=wCmvBT1CAAAA:8
 a=yg8HEki30JHSbY7BnakA:9 a=QEXdDO2ut3YA:10 a=6z96SAwNL0f8klobD5od:22
X-Proofpoint-GUID: FvSQ4Yl7iwFutauLjP0nTTtplDCe7DuM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
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
 hfs i_ino format strings to use the PRIino format > macro in preparation
 for the widening of i_ino via kino_t. > > Signed-off-by: Jeff L [...] 
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
 [148.163.158.5 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vxBis-00049B-St
Subject: Re: [f2fs-dev] [PATCH v2 031/110] hfs: use PRIino format for i_ino
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
X-Rspamd-Queue-Id: E27DD1E55EB
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
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
> Convert hfs i_ino format strings to use the PRIino format
> macro in preparation for the widening of i_ino via kino_t.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/hfs/catalog.c | 2 +-
>  fs/hfs/extent.c  | 4 ++--
>  fs/hfs/inode.c   | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/hfs/catalog.c b/fs/hfs/catalog.c
> index b80ba40e38776123759df4b85c7f65daa19c6436..b07c0a3ffc61584165e8cc9f646de6066a6ad2c9 100644
> --- a/fs/hfs/catalog.c
> +++ b/fs/hfs/catalog.c
> @@ -417,7 +417,7 @@ int hfs_cat_move(u32 cnid, struct inode *src_dir, const struct qstr *src_name,
>  	int entry_size, type;
>  	int err;
>  
> -	hfs_dbg("cnid %u - (ino %lu, name %s) - (ino %lu, name %s)\n",
> +	hfs_dbg("cnid %u - (ino %" PRIino "u, name %s) - (ino %" PRIino "u, name %s)\n",
>  		cnid, src_dir->i_ino, src_name->name,
>  		dst_dir->i_ino, dst_name->name);
>  	sb = src_dir->i_sb;
> diff --git a/fs/hfs/extent.c b/fs/hfs/extent.c
> index a097908b269d0ad1575847dd01d6d4a4538262bf..60875cc23880b758bbbb5e4b8281d9ee1f2dbcbb 100644
> --- a/fs/hfs/extent.c
> +++ b/fs/hfs/extent.c
> @@ -411,7 +411,7 @@ int hfs_extend_file(struct inode *inode)
>  		goto out;
>  	}
>  
> -	hfs_dbg("ino %lu, start %u, len %u\n", inode->i_ino, start, len);
> +	hfs_dbg("ino %" PRIino "u, start %u, len %u\n", inode->i_ino, start, len);
>  	if (HFS_I(inode)->alloc_blocks == HFS_I(inode)->first_blocks) {
>  		if (!HFS_I(inode)->first_blocks) {
>  			hfs_dbg("first_extent: start %u, len %u\n",
> @@ -482,7 +482,7 @@ void hfs_file_truncate(struct inode *inode)
>  	u32 size;
>  	int res;
>  
> -	hfs_dbg("ino %lu, phys_size %llu -> i_size %llu\n",
> +	hfs_dbg("ino %" PRIino "u, phys_size %llu -> i_size %llu\n",
>  		inode->i_ino, (long long)HFS_I(inode)->phys_size,
>  		inode->i_size);
>  	if (inode->i_size > HFS_I(inode)->phys_size) {
> diff --git a/fs/hfs/inode.c b/fs/hfs/inode.c
> index 878535db64d679995cd1f5c215f56c5258c3c720..b19866525c1e9c43decf3a943c709922ee8630f6 100644
> --- a/fs/hfs/inode.c
> +++ b/fs/hfs/inode.c
> @@ -270,7 +270,7 @@ void hfs_delete_inode(struct inode *inode)
>  {
>  	struct super_block *sb = inode->i_sb;
>  
> -	hfs_dbg("ino %lu\n", inode->i_ino);
> +	hfs_dbg("ino %" PRIino "u\n", inode->i_ino);
>  	if (S_ISDIR(inode->i_mode)) {
>  		atomic64_dec(&HFS_SB(sb)->folder_count);
>  		if (HFS_I(inode)->cat_key.ParID == cpu_to_be32(HFS_ROOT_CNID))
> @@ -455,7 +455,7 @@ int hfs_write_inode(struct inode *inode, struct writeback_control *wbc)
>  	hfs_cat_rec rec;
>  	int res;
>  
> -	hfs_dbg("ino %lu\n", inode->i_ino);
> +	hfs_dbg("ino %" PRIino "u\n", inode->i_ino);
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
