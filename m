Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKsWBv/soGlaoAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 02:01:51 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3EA1B15F1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 02:01:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Vp7wxmqr1Nn3YKwerjRoXiC/Ei6kI6jV+Zs5k9zE10=; b=fXlsq/eZuFOYGTTGsF8uThu1HW
	vtdFXZS+RmkuA9uwTvjLAM6rl5JwVhB5MG/7V3j3pr43YX2HYNzckKHY302zUYERX5O7YVtHPITUQ
	zb3cn9U0Htets5GXeWUIShbxxLihsEJ8+sbWdRti/h+nOa0uCJNxOYYCExWA+7gTIAiI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvmEd-0007X8-2m;
	Fri, 27 Feb 2026 01:01:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ziy@nvidia.com>) id 1vvmET-0007W7-Dr
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 01:01:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4uKjc43mI572fFeDKQ8+KrzP3Jqy/FD/YnbIzRJv0Cg=; b=aqr1RWG8M3woINciWxyy1Xnt4K
 Pi5ntt0fbrzZPL6LsCWtwjkRkkucmEEKD8YBfuQ7uvCWXpY6N2not8kXkLhmu31zEvIC5cMETvksh
 dKedf9UxTciClL6pOK5bpc9Y+9sR5yuRAc0Bsc6Nh19PYRaAjhg+uwUhrHNDSWdxZ7+A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4uKjc43mI572fFeDKQ8+KrzP3Jqy/FD/YnbIzRJv0Cg=; b=UAsaBFLCl8TUG4ix1HDZ9GvDZv
 UpBdfCcnccWJHYVwmFnVtTZd84BrqYxX2oMCNrB8q7ZvYTo7/ovzFhrdKk+RSKeR6UarF/sFED/J7
 BcesivHc2ZNWwoyR8+q3gsI1MlKuez6sIB5YisdWFyIADx/7uAv86cgGTVYOLyeHYb3w=;
Received: from mail-westusazon11012002.outbound.protection.outlook.com
 ([52.101.43.2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvmET-0005ht-NH for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 01:01:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtRehIRVNQMmo2VSTtMSECH03NUtSZF1QMksdKqsSyhrCf9JWkxuRUZT8PxWHES54V4CywafjCthi95dkmvloflvwhQZZ3CtTPeBMqNAXwYvFFWa1/BbITaFAlOZHv856rzb8i3dllN2SEE7eAJS+oRiadpB00S5YAymB8CKGQIqtTV7t+tOJH1Pt4KRf+1b/iZNA3Saa4JJtUgDVKF21DgV5RW2zC4Iai0X9vvtitkl76d8gnS0PuSydVL3F78qRUNU4ILfsN/faiJxUuWnAtBkf7yRggAaErvusAK8oJ0piGXAiSZ6cWD/f/uUYroGGOB234HmoJDmNdpWWfSBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uKjc43mI572fFeDKQ8+KrzP3Jqy/FD/YnbIzRJv0Cg=;
 b=e6WsXbsE1cPj8OtiHkxnXaSYMvBLuWysori40IQ8hQGKogRFwggPq90up/lTYpakKJvmpnBldXhZ1f1wkU+TFQPAklCJrC5JX7hbXmQOeeg3cHrUBNXhCkNuyKUNSkKARXiNqM34mKo7A2EtMtn9Rx8Kl1dw2Mfcfy8EortJXtE8YGDto2o52ZK7w1vJbLU2NEx7qORwAhhhHQY2yPAlXWTiwwgP/6Q/NT26xmP3iQ9tRzI5o8614FIoFaSKQh7MIGGrt1tZMco0zrplEg7XfJd+urN7tlDbF7SGLf3TFWbLzNlvvz0T4B9XN3pClfySrGLO68DJ3p1wSbk0wbogBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uKjc43mI572fFeDKQ8+KrzP3Jqy/FD/YnbIzRJv0Cg=;
 b=QjqFaphGLeaNX6Rq1NgArjRrYX76xO4iUF5+mumlvaSc9kuLw8JUYs4rtuc5WFNSQiHqqMCBa8jzqOEK7POzoTuQ51QfoEek5eHW/EYPa8kG5DIzobJduzI+DoLfpBmMPq1i5SC408MoRNUGJVlxCwtdILZ5yY3CsMtuKLvl8yaOaJYgtIav1HCph54SNK+TurvxvPpWSnp7HoW79cUJwa2JddNsuN/ZUuviOFKHXt0RppJ2ImKNxTb7S1Hwgqlc2cvZ1kOES9sd1Rvc4RR3WxsbYq2X9AWzQGOF4qlA1N1bdugQL30mwx/BGEv1bU3QeZAI4ej2AE1DM63ED9riKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB6860.namprd12.prod.outlook.com (2603:10b6:510:1b6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 21:27:21 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 21:27:21 +0000
To: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 26 Feb 2026 16:27:08 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <A890368F-2759-4D02-841F-CC758950B0D5@nvidia.com>
In-Reply-To: <20260225-pagevec_cleanup-v2-4-716868cc2d11@columbia.edu>
References: <20260225-pagevec_cleanup-v2-0-716868cc2d11@columbia.edu>
 <20260225-pagevec_cleanup-v2-4-716868cc2d11@columbia.edu>
X-ClientProxiedBy: SJ0PR05CA0163.namprd05.prod.outlook.com
 (2603:10b6:a03:339::18) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB6860:EE_
X-MS-Office365-Filtering-Correlation-Id: 95873c9e-8b3d-4029-5345-08de757dd352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: 3yjkJPTWlW+QmhMYV6Z2bbt8fbXjxoudaa3396emOIRmvTiF+Wm+yDFKpkYh/4ibzBJOSjTRsd0m7oLmlpjdvWr5j7UfMrUCGz/Ct+v1eC8Dmg7NYYAr+4joZOuwyDbdDljEd4CMaa6Ocn4VKcptWM7Ub7ImmQDEhMguWevlJ2yffun+KRczqARPx51VIFQynFBLMFJ6KB3mt9qOzdYsMURxvedeia1HwZLrJEf87j+dUyivIF8DuNCSCq0etOtr4RpbQO4qeo/Qi/o4NPbYPGtbdYAAp1HioibYgZm/pX2y7+0qUYOGMMhre64tBHFEOSrexBscR3x2C4SDrtcPZhqDd+24fbIJIiDG+jucNGE1IUDjneoOXH0jZIKKekm2TccCk1OUj7OCLK102LlWQPBln/4BJjtDYwu9UTSKGp7MuCOGzyRxH8/iGDbSkoHFw4On+iV/qCp5hIkoXXIhE25cWT2l65pUYMV6q/g0AuXgHhO/53Fc0rcSUhLvOCeS1qjVuQ+kbQ+Cc+TejahNKq22e1koVJiu0LvwYBJp5f5dKgZoRp72Ohi346Pai/CIYGq05EC8PQukMj1f1AvqkgkOphAHEAYtXZgpLmjAvTtOhKOYUgHjbTElwL4qDlayfZlbVzcII5T5CPZ5hUUkmzMKc/ddzDZVZMFMEUps69iND5dNeK/UehwJdVB0xbc475LOxNsS9BeO2gQvo6X0iKSTUluYLj8PZsb6EgEHkoE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?48Y5TV7dc2GZx0b1wplzMo/LoWtmFaZENzl6jygOekoEUi5IMuDeahxLNZ03?=
 =?us-ascii?Q?RjLr4IXFL+Tss7DnNSb+Pz9ZXZpQjyg9lhzdTrx8rF7Xe13rzgNzZlCT5RXo?=
 =?us-ascii?Q?+uaNYvq28NPZvSZLqyLyy74kNvq0KgvOWFuSyjICwgjaWHA4Mv+ruSTpXG+2?=
 =?us-ascii?Q?PbVzdq9ntdeMB2C+A3MLKZdjxxvjhyINzj5H3l7V4UYPWi1rlTTnFspIlwRt?=
 =?us-ascii?Q?Zv/8P6a+SrnC4DzFC7Q3NkA3BuzA1bTYLA3WiJtQ2/Pnp3vqCqSugOavNKf6?=
 =?us-ascii?Q?8ZtUfdUgVB22+0wIk2twF+Uc+YWQKtQw27lNCP//D+aBJKCKgSsvp8QG2RSr?=
 =?us-ascii?Q?hZQVrXUFWzrM7Ovz61U1YqZbj7JMrE/6zecKlbNiePiFV5qzsQqN1jLKhOlg?=
 =?us-ascii?Q?Giq/UHUEk61UWtpPouz54VmOgc+omOGcO0BB5TWcEcUODz8m9wKJ23S01efq?=
 =?us-ascii?Q?VTOjkRqjtqQ+gp5YQaEnSmtdPN0hkP/B6fvp+by69m/WeeLplFAc2SJRjau/?=
 =?us-ascii?Q?Qod7NLRQ5xV7bRWMyVNsIwul35nopG+3O/JlZXmTx11+P0wdQavzsHcOqOdk?=
 =?us-ascii?Q?zJP3RuwsTwYFHWS7+H0WX4UaLahRdOdr334vQL4GRCdUWlFDs9yiLeDHis/c?=
 =?us-ascii?Q?67ZGjcZ1yQpEdY5VTCk2s2VnMGktiDm+XqWNaOUvamWw+EiPDCkpzzwIC2QZ?=
 =?us-ascii?Q?w0jx91vAjVOM+oeE1fAT0CLSxAOWXQTabDPSWsKNDxO9gZJXS1RQ3ecMLzEA?=
 =?us-ascii?Q?zvO69fXifJCc1AKHeplb8WhO1Rrg25jyWgjC24Kga/xr5rIoBej2EWbdSSR+?=
 =?us-ascii?Q?Z97YPen68zbvXfn925nGnT9kJpwyOPoNEYfoXKi9Dkn3Zb3Y8NzsN7cTdIWC?=
 =?us-ascii?Q?qNwwUF1Fa/nrmwz/eV6JSyD3b0t5FLwRE3SxAp2z4wzRB6ZZxTXt264oiIY7?=
 =?us-ascii?Q?IIZbF21RF0mpqqFFSwEEIMSNsNCylBi5gkxgrmBSNG/PyZWvOZMv/xs1xT9S?=
 =?us-ascii?Q?lVp3ICxmDJZSvSnICuTnS5tBKGxp1sYv1kpYfbRkO76AVOlo22ea+4JxHOR7?=
 =?us-ascii?Q?JFqlzHs0s63F/UaI6xpaC5xDYEtkeQ4uT2ELE8fRKYzWkfkBC+U1oNSQVbW1?=
 =?us-ascii?Q?jznuTzCOWVUhYa92WWP13oMCrkfGwQ0ppo8HyKzni4Y7WRXORvkzQRNLlNMK?=
 =?us-ascii?Q?FyPouts0Y17ZuTuefOqYAJs9BSpZVkdVDlqzCl3+NqpO8ybYIze3T4fGgEjc?=
 =?us-ascii?Q?HoY8Morbxi2B6GhD9qhKQwkFBqXhE8yg8BjXGia32C7jG6XJWE3WiJg6Xv9e?=
 =?us-ascii?Q?mhLpSj6M+7nErYKdNp+WD//ixLhQrrdbbgtA/f3smsWszOHvIGSXKT3EZu9I?=
 =?us-ascii?Q?FyofC6cvQjxgMXQxWwt5P34Fn4mDIybbnRYdvMQBKRAU0ZI1nC1bVNIlOPjx?=
 =?us-ascii?Q?/npGHwZIS/YDEkLt+yv0fbkovhbSpuIj7tSSo7pEMhtdGMDN+9KAQRHlnTSw?=
 =?us-ascii?Q?d/ow0Le5B9zPI/OpCuLWtJYqH1ot36vQCvxImiDef6SP6yItRNTePLl0BZw+?=
 =?us-ascii?Q?oFOCmmJFiyFh9QWRa0nLigvThlIJoPJ+8CvTd2FmK7WE6OWvFIoksdYvNW9J?=
 =?us-ascii?Q?pDzEU9Llih8BBuRTADViD1znDJ2zK2VBakwjbkJd0OcUR6ZNtnQxfMSyNoU5?=
 =?us-ascii?Q?8Z6wYe36F80pY83pbqipF9Av97VmhU5qhhlGUA0QZClanPbi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95873c9e-8b3d-4029-5345-08de757dd352
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 21:27:21.1358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aduMoDd5lxnqMcBQuDO+PXo6/4koqjDzn/hs/w3f5Ey21lau5RgRDWDzNO4s2GJM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6860
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 25 Feb 2026, at 18:44, Tal Zussman wrote: > struct pagevec
 no longer exists. Rename the macro appropriately. > > Signed-off-by: Tal
 Zussman <tz2294@columbia.edu> > --- > fs/btrfs/extent_io.c | 4 ++-- >
 include/linux/folio_batch.h | 6 +++--- > [...] 
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
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.43.2 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vvmET-0005ht-NH
Subject: Re: [f2fs-dev] [PATCH v2 4/4] folio_batch: Rename PAGEVEC_SIZE to
 FOLIO_BATCH_SIZE
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
From: Zi Yan via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zi Yan <ziy@nvidia.com>
Cc: nvdimm@lists.linux.dev, Paulo Alcantara <pc@manguebit.org>,
 "Darrick J. Wong" <djwong@kernel.org>, dri-devel@lists.freedesktop.org,
 ceph-devel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Brendan Jackman <jackmanb@google.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Shyam Prasad N <sprasad@microsoft.com>, Chris Li <chrisl@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 David Hildenbrand <david@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 Chuck Lever <chuck.lever@oracle.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>, samba-technical@lists.samba.org,
 Simona Vetter <simona@ffwll.ch>, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>,
 Hugh Dickins <hughd@google.com>, Olga Kornievskaia <okorniev@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, ocfs2-devel@lists.linux.dev,
 Jani Nikula <jani.nikula@linux.intel.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Barry Song <baohua@kernel.org>, Kairui Song <kasong@tencent.com>,
 Theodore Ts'o <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>,
 linux-f2fs-devel@lists.sourceforge.net, Anna Schumaker <anna@kernel.org>,
 Alex Markuze <amarkuze@redhat.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Peter Xu <peterx@redhat.com>, Chris Mason <clm@fb.com>,
 Pedro Falcato <pfalcato@suse.de>, Marc Dionne <marc.dionne@auristor.com>,
 linux-afs@lists.infradead.org, Baoquan He <bhe@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 NeilBrown <neil@brown.name>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, cgroups@vger.kernel.org,
 Shakeel Butt <shakeel.butt@linux.dev>, Dan Williams <dan.j.williams@intel.com>,
 Oscar Salvador <osalvador@suse.de>, gfs2@lists.linux.dev,
 linux-nfs@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>, linux-mm@kvack.org,
 Jeff Layton <jlayton@kernel.org>, Steve French <sfrench@samba.org>,
 netfs@lists.linux.dev, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Qi Zheng <zhengqi.arch@bytedance.com>, Yuanchu Xie <yuanchu@google.com>,
 David Howells <dhowells@redhat.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, David Airlie <airlied@gmail.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Mark Fasheh <mark@fasheh.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Axel Rasmussen <axelrasmussen@google.com>, Jann Horn <jannh@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Tom Talpey <tom@talpey.com>,
 Bharath SM <bharathsm@microsoft.com>, David Sterba <dsterba@suse.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Wei Xu <weixugc@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tz2294@columbia.edu,m:nvdimm@lists.linux.dev,m:pc@manguebit.org,m:djwong@kernel.org,m:dri-devel@lists.freedesktop.org,m:ceph-devel@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:lorenzo.stoakes@oracle.com,m:jackmanb@google.com,m:tursulin@ursulin.net,m:sprasad@microsoft.com,m:chrisl@kernel.org,m:jhubbard@nvidia.com,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:david@kernel.org,m:surenb@google.com,m:brauner@kernel.org,m:linux-kernel@vger.kernel.org,m:chuck.lever@oracle.com,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:trondmy@kernel.org,m:samba-technical@lists.samba.org,m:simona@ffwll.ch,m:linux-cifs@vger.kernel.org,m:linux-nilfs@vger.kernel.org,m:vbabka@kernel.org,m:hughd@google.com,m:okorniev@redhat.com,m:mripard@kernel.org,m:ocfs2-devel@lists.linux.dev,m:jani.nikula@linux.intel.com,m:jaegeuk@kernel.org,m:baohua@kernel.org,m:kasong@tencent.com,m:tytso@mit.edu,m:muchun.song@linux.dev,m:linux-f2fs-devel@lists.sourceforge.net,m:anna@ker
 nel.org,m:amarkuze@redhat.com,m:shikemeng@huaweicloud.com,m:joonas.lahtinen@linux.intel.com,m:peterx@redhat.com,m:clm@fb.com,m:pfalcato@suse.de,m:marc.dionne@auristor.com,m:linux-afs@lists.infradead.org,m:bhe@redhat.com,m:willy@infradead.org,m:slava@dubeyko.com,m:neil@brown.name,m:idryomov@gmail.com,m:linux-ext4@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:baolin.wang@linux.alibaba.com,m:rodrigo.vivi@intel.com,m:cgroups@vger.kernel.org,m:shakeel.butt@linux.dev,m:dan.j.williams@intel.com,m:osalvador@suse.de,m:gfs2@lists.linux.dev,m:linux-nfs@vger.kernel.org,m:nphamcs@gmail.com,m:linux-mm@kvack.org,m:jlayton@kernel.org,m:sfrench@samba.org,m:netfs@lists.linux.dev,m:rppt@kernel.org,m:mhocko@suse.com,m:jack@suse.cz,m:roman.gushchin@linux.dev,m:zhengqi.arch@bytedance.com,m:yuanchu@google.com,m:dhowells@redhat.com,m:joseph.qi@linux.alibaba.com,m:adilger.kernel@dilger.ca,m:airlied@gmail.com,m:agruenba@redhat.com,m:mark@fasheh.com,m:Dai.Ngo@oracle.com,m:jgg@ziepe.ca,m:axelrasmussen@go
 ogle.com,m:jannh@google.com,m:maarten.lankhorst@linux.intel.com,m:Liam.Howlett@oracle.com,m:tom@talpey.com,m:bharathsm@microsoft.com,m:dsterba@suse.com,m:konishi.ryusuke@gmail.com,m:weixugc@google.com,m:tzimmermann@suse.de,m:hannes@cmpxchg.org,m:linux-btrfs@vger.kernel.org,m:jlbec@evilplan.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,manguebit.org,kernel.org,lists.freedesktop.org,vger.kernel.org,oracle.com,google.com,ursulin.net,microsoft.com,nvidia.com,zeniv.linux.org.uk,gmail.com,linux-foundation.org,lists.samba.org,ffwll.ch,redhat.com,linux.intel.com,tencent.com,mit.edu,linux.dev,lists.sourceforge.net,huaweicloud.com,fb.com,suse.de,auristor.com,lists.infradead.org,infradead.org,dubeyko.com,brown.name,linux.alibaba.com,intel.com,kvack.org,samba.org,suse.com,suse.cz,bytedance.com,dilger.ca,fasheh.com,ziepe.ca,talpey.com,cmpxchg.org,evilplan.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[95];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,Nvidia.com:s=selector2];
	NEURAL_HAM(-0.00)[-0.962];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[ziy@nvidia.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,Nvidia.com:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[columbia.edu:email,nvidia.com:mid,nvidia.com:email,nvidia.com:replyto]
X-Rspamd-Queue-Id: 2E3EA1B15F1
X-Rspamd-Action: no action

On 25 Feb 2026, at 18:44, Tal Zussman wrote:

> struct pagevec no longer exists. Rename the macro appropriately.
>
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>  fs/btrfs/extent_io.c        | 4 ++--
>  include/linux/folio_batch.h | 6 +++---
>  include/linux/folio_queue.h | 6 +++---
>  mm/shmem.c                  | 4 ++--
>  mm/swap.c                   | 2 +-
>  mm/swap_state.c             | 2 +-
>  mm/truncate.c               | 6 +++---
>  7 files changed, 15 insertions(+), 15 deletions(-)
>
Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
