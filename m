Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHADMeO3oGnClwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 22:15:15 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E606C1AF937
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 22:15:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkdec/tyyFsTAYCP2ArIHRJ4oXxaewj1wkAzlKPb2Qg=; b=ebSal4RNSOtw4zNAChXj9Q9PQ9
	ng0TEkYqIYU1+hHwqaR1gIyget1pMKMzAdX7QJat5C3yiN4S9aGv7jm93a7NQ6WRosKIb0CIM/XMD
	RFIINSB2QvVbOgBNMgliRaRxUS8vCwByas0FKrXy1Y+Q+6RjSK2DIKxy8JVM9XWshL0w=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvihP-0001MD-Az;
	Thu, 26 Feb 2026 21:15:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ziy@nvidia.com>) id 1vvihN-0001M3-6x
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 21:15:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b3Gmtf7Td04ChZy3/FFngKnJvaZXnMZrfEPVFmQZ2gk=; b=D+pcXe0XMt8nvAJ/fy18anGvgn
 gb0/3x85mhtgXjWTWN2gXW+DVdtCL4Ir6TwbXo2VTxaRxDpq7Mas0ISO5SUCuMYO9YpxQ3y4WLeLj
 p1GBz4DIFupvRBeG0vT5ZL1XXW3NE0bxFRp9z+S4ejOGL/ynI0hCukK8dFbjkFCFgxiU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b3Gmtf7Td04ChZy3/FFngKnJvaZXnMZrfEPVFmQZ2gk=; b=TyRQF0hqoWuFQ2mAWx6/FyqrDs
 CchI8+OGrAaEongGlhWGpczkJu1rR14ZBWCX43QgS/ZF7qbH9vLGH/tTBrMM4LxF6Tb0H8peXyFqV
 wDorikuqfKCH3f+lKn8oJnt5bm8U3KdxdWXfD9xMGxcqH/Ryqnnux0CMQlGmdhglU8hQ=;
Received: from mail-northcentralusazon11013063.outbound.protection.outlook.com
 ([40.107.201.63] helo=CH4PR04CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvihM-0005lV-Q0 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 21:15:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SoXsuVhoDKcaHHtXDgyTDWBYBR7mNt0n3HDbYU7XBvmt/9rOaEEVIT7APVcO100x4LOb0Esh53/n/Gkng8uccgj4BAwEX5uYCqeeNa8D3csRrFoHbP1niDyJbCRPV1OSkAtBW2qFxemgHTrEOyecGQQKyGzK2Q87ezepb2kZvZ5MwO64Zz4QNGmoi8g+JkuA50oHRLtyTShoY19jF1wafRqzcK1cDQZzEMMxXB9L0q9KuOgr1bAJ7mgx0qY1wEjkvFyduBgT9udPvB2bHvBkm6yNaLUP+OXPyBPPGrJIj+RmA4SMZWzaWShj6nLSsiG0YCQRoLRXnYr6ozqoEa5d2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3Gmtf7Td04ChZy3/FFngKnJvaZXnMZrfEPVFmQZ2gk=;
 b=S5N2WzsAZQlJVGxpXShTS64ePwieLoTzWSApN7C43/Ewl4e3aXIhOwlqeAzv1v653jk6TTynEQaNEfqXG6mD0NwqVENs9m480M1i6Q4B7yO/CvYv++Rc6II6SRLSuyDGH/QvBHPPDPmY0awf85vYpOPOl0XKVgT86uhFbM0JLhNPW6SP7rF2wyxRUAzR7J6a7RbCS1blfh53Il02t4KwZj4ttbvPcRRnUWG5VIjKK+e+Y7ghGK7iF9au81hGmimIqxHlVsYbHbzXvZc6+ZXorPc+Ne28xAcUz2OeTmkzOll4VNLRznyWRba4IHonGZL3axhoKjkBCe8KJq70q9+n9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3Gmtf7Td04ChZy3/FFngKnJvaZXnMZrfEPVFmQZ2gk=;
 b=bVEhwNNIrCwp37J3ZqiEAKarc6Ow5M6ockdubJ6FrvucBettQwNr24hWejxpmabM5hFE/inEDw4mSvmEbDIsZWBO2eMrAPu0JU1SErcK0SE8Z7Y9+EW5Hp/ut97utzG8WiECcwrw6XoZ1sVgGJGj4Qq6vxbrdEInkyB5wq0Chq50TE7rFGXHtUMdf3prNgPGJleWDEFMzQme8+1fYOehBvL4LvOlSQgtR2DOSxgHMSGz0aCyONIfCcP0kf2Zz4B6ain4e9HNK8qMdCPuXTlikTNaS2MgiQHlupHSpN9wZPAuB6e4x6iLQKPpiyqZsAZl7CfWdcJppDUTte/sd35hBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MN2PR12MB4454.namprd12.prod.outlook.com (2603:10b6:208:26c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Thu, 26 Feb
 2026 21:14:53 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 21:14:53 +0000
To: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 26 Feb 2026 16:14:39 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <75A87D9B-5A04-4679-AF82-56332A786A63@nvidia.com>
In-Reply-To: <20260225-pagevec_cleanup-v2-1-716868cc2d11@columbia.edu>
References: <20260225-pagevec_cleanup-v2-0-716868cc2d11@columbia.edu>
 <20260225-pagevec_cleanup-v2-1-716868cc2d11@columbia.edu>
X-ClientProxiedBy: BYAPR05CA0087.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::28) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MN2PR12MB4454:EE_
X-MS-Office365-Filtering-Correlation-Id: 778fb806-5f7a-4743-6000-08de757c157f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: oIrjYQCjzHwV66EA/F/RvgiiCGK2SjRSsvoYLeWWsoMYaYN1K6RfFBio3SzGatwPMqyoaF7raYf1lqr6IIN/lp1/0B32swRRcPHJo0PW5aIuWZyzl085KeAu8PyU9RlQygn2Xz3ou1KM/q6M8rlnyjxH0MKVmAeBcEym4ZswzDb1jsTShcKiQdpNRWVI3ge/x6qODNbLOlZHkLY9v8uwcnNcgudpcrr2tOe5gqeyxan+TN8utD86RUCdsLB4YHVrpHzF2uW0SUPEaDUUjafqr48Co1wWmI6Lvzyxht4R7kxnUmdoiVbztgO/UtTI9kWr+OjfQ4Fh8rnExTcNSaCl+w5x2wdWF4w+e3BYfnBfPkbSREbLPlPGa6FOqNJNgltjap0Rr4YvZXHDm9xcGGWN/hP2nfNS39Q6C7LnC1vP4dc/1BBlb+OJY+12XgnF9VGWxJZPpL/VcLqOkCEDBaePzMOHenMMhfOxdrq4ZUKf1JocHY1Y3Dyv5P+y3VMuHd5ctracwU9elS4R5y/HyL4joniVK6eAoDtniJZQ2EQ3SkU0tYMGEdvNsNO4Tx5ofGiJYRhq0Utt/5/ls5T8tqxHeSZVufptD7nU4HpAxNOyE/Em/c2SuwnKzE0nZ74qbUMAhmuQ72t/nZh/6vJqKVqDNzeuwiFXBzVJLpty6wZHK0XZObdU00/c1TYd8v3OUdk6gTno69YSnOWzY3I2otuvY8fOk3TvVz2FV0tT4z3QtSE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+Ks3JtFwKq97fATos9G60W0NtQYFj7BfxB+vcrdvP/c9OM2nh0Z+sVWSA/Vp?=
 =?us-ascii?Q?03eVycCnXnDZ4oreSgHW2zI6PbJR4yEue/hULEy/og9dTWseTDXlWdxmQRFZ?=
 =?us-ascii?Q?AWTJHzzqGdJ9nQQqUbWdkVmTeqqKE+ZYun7ren9+6UU5Fk+/e04J2ATx1gPA?=
 =?us-ascii?Q?2pg6Y4cty3PQ9YugMH77ODTRfJE7nas+r776Bun04Z29AAvAnMVdwYFnAP9F?=
 =?us-ascii?Q?H1K+xu7SCsRvLZZ+++szV+vmcaAD9yf2lmzLn7soVtbjt7vHYSHoW+rCbXa4?=
 =?us-ascii?Q?uHJv/jEuasPJ7dRLFsTu69sb6eisuijQxnsEBvpR/1LGnN4UMPX96fgwBT28?=
 =?us-ascii?Q?uSZ4Mzzuz2v2QQFLtSaL+F4b3Pn49IYStFUPQKey8lNGAE3GmNhLxRKhEtTP?=
 =?us-ascii?Q?9JtlK9Nd7V3pdHe73ryzEM6A0o06bfgfDdGgePyLphlDCIKXBbqHl6uw6d88?=
 =?us-ascii?Q?86+AfYx2MD0kkPoB7gGS4jt9fqHUAip4r0KGDFsdpm8e4sw+fvcr7SEwOvyS?=
 =?us-ascii?Q?qHpCiCFuZ0mVGA03eG5J+UL30gBqe49eaBHOOgR4+8wEijJ/QCOFf7cRHwmE?=
 =?us-ascii?Q?6zc/F5Uju2vPVtraRZK0RcH/IcK4dOO4+BYncRNQmkI0rfnh5yI+vwtTqm1s?=
 =?us-ascii?Q?qyacSJXVlR5+p4/Ba39lZSFgJwhdJDkUzOEkow7R68H+V/dg5vV9fVifo1Ox?=
 =?us-ascii?Q?0L/CZchRHg8ROnLTiAm+9hMqStIY9eewOJ7IRPKQmfvYAffVpjsCtHBXtTI3?=
 =?us-ascii?Q?hk5WXwXUQZMhF4bPxavzskVvnRsNbD2YqSPSleXFj+viloMNloVEAfpFagCM?=
 =?us-ascii?Q?8dpGQw5kU+EjokmBR0qgi0ahcL0ydbNFxpcg6qTPe9zmCoUADAIIocASoBjj?=
 =?us-ascii?Q?1dlf90cNmzxanZ9LXK7aWNNCT4K3WREfdoNsMDcr+/gj116eZgqcF5yjpDFJ?=
 =?us-ascii?Q?G2c35WaP1t2z4nbGJzmyerqHFMFHCv9jk8yVVyuZuZfiyM7JoBtZCvsNi1le?=
 =?us-ascii?Q?aq3krk3HpVIOwO9OOMYASlCLGghJoxyrv3u4sOWrMjRFCmpqQXhSUvMOo0mI?=
 =?us-ascii?Q?Mgg3HC80H9fSfdL6c4dPNZ1/bFXsfkyRnJJOauCKM1FrovmUilDPccCfNEK2?=
 =?us-ascii?Q?wIiYqLrhAv5b+XW2yYnmcEfGn+q5EdSkK5fFFXDOOlRJEoo4rg3mXzuUviw5?=
 =?us-ascii?Q?RqACNu5BFhOA9yMkQ/ESCw1JYPu6JZ2VZB8mB2xA03yuki8XSz97Qc7vF9MB?=
 =?us-ascii?Q?Z7W6zQSyti9CzaNto+PAOuE5cyMUjF5ZgK4d6aY55qzVMxTEvlAdDntTPeX0?=
 =?us-ascii?Q?0qXHIn06MCM0fBgfF3EkcJ/zMYDlq1IqzGu5QsKBZOT1wID6mrDyXNdbvVT4?=
 =?us-ascii?Q?lIlnJYPZGw4tF4krqsq1Lq4wKD6kxH+MEXP4aqWsSzTG7/M/9PU4XJ9Z9VA5?=
 =?us-ascii?Q?zmfXH0fi8fgmpSeKDCU5O1Ewjb4jxxwyCLyZZ3yuMV00IOz0aLspOhCJnT1X?=
 =?us-ascii?Q?EbqM/6uQ3lvdI5rO63AjRFW95Ul8J58x1Fg2hCVZZI+NXYHAPVepUevSlUxH?=
 =?us-ascii?Q?dsnTJ6CP68+UsNFKxi4+aDwV2rCSabNjHAhcKrvGqy6jhnSNzIM2+YqOefZi?=
 =?us-ascii?Q?IbgdSjyGA7JlYQ4iOk5isyPOVP5MVP1X7x/G0TORFHhxb8eTBdG7tJMz4N94?=
 =?us-ascii?Q?obs/99pZ6tsotOkm3Hx4ZgUrrM6JIOpInYV+s00t+mw2+9WKD3/s2DgYH6WF?=
 =?us-ascii?Q?4BCtE5mHcg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 778fb806-5f7a-4743-6000-08de757c157f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 21:14:53.1535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CVAdwAlPYswiAFQdCqMXX+tLaqoZy5w/VFXl8Qw9Ruo3df9eUUvUFk8Hg/25zE3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4454
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 25 Feb 2026, at 18:44, Tal Zussman wrote: > struct pagevec
 was removed in commit 1e0877d58b1e ("mm: remove struct > pagevec"). Remove
 remaining forward declarations and change > __folio_batch_release()'s
 declaration to match its definition. > [...] 
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
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.201.63 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vvihM-0005lV-Q0
Subject: Re: [f2fs-dev] [PATCH v2 1/4] mm: Remove stray references to struct
 pagevec
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tz2294@columbia.edu,m:nvdimm@lists.linux.dev,m:pc@manguebit.org,m:djwong@kernel.org,m:dri-devel@lists.freedesktop.org,m:ceph-devel@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:lorenzo.stoakes@oracle.com,m:jackmanb@google.com,m:tursulin@ursulin.net,m:sprasad@microsoft.com,m:chrisl@kernel.org,m:jhubbard@nvidia.com,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:david@kernel.org,m:surenb@google.com,m:brauner@kernel.org,m:linux-kernel@vger.kernel.org,m:chuck.lever@oracle.com,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:trondmy@kernel.org,m:samba-technical@lists.samba.org,m:simona@ffwll.ch,m:linux-cifs@vger.kernel.org,m:linux-nilfs@vger.kernel.org,m:vbabka@kernel.org,m:hughd@google.com,m:okorniev@redhat.com,m:mripard@kernel.org,m:ocfs2-devel@lists.linux.dev,m:jani.nikula@linux.intel.com,m:jaegeuk@kernel.org,m:baohua@kernel.org,m:kasong@tencent.com,m:tytso@mit.edu,m:muchun.song@linux.dev,m:linux-f2fs-devel@lists.sourceforge.net,m:anna@ker
 nel.org,m:amarkuze@redhat.com,m:shikemeng@huaweicloud.com,m:joonas.lahtinen@linux.intel.com,m:peterx@redhat.com,m:clm@fb.com,m:pfalcato@suse.de,m:marc.dionne@auristor.com,m:linux-afs@lists.infradead.org,m:bhe@redhat.com,m:willy@infradead.org,m:slava@dubeyko.com,m:neil@brown.name,m:idryomov@gmail.com,m:linux-ext4@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:baolin.wang@linux.alibaba.com,m:rodrigo.vivi@intel.com,m:cgroups@vger.kernel.org,m:shakeel.butt@linux.dev,m:dan.j.williams@intel.com,m:osalvador@suse.de,m:gfs2@lists.linux.dev,m:linux-nfs@vger.kernel.org,m:nphamcs@gmail.com,m:linux-mm@kvack.org,m:jlayton@kernel.org,m:sfrench@samba.org,m:netfs@lists.linux.dev,m:rppt@kernel.org,m:mhocko@suse.com,m:jack@suse.cz,m:roman.gushchin@linux.dev,m:zhengqi.arch@bytedance.com,m:yuanchu@google.com,m:dhowells@redhat.com,m:joseph.qi@linux.alibaba.com,m:adilger.kernel@dilger.ca,m:airlied@gmail.com,m:agruenba@redhat.com,m:mark@fasheh.com,m:Dai.Ngo@oracle.com,m:jgg@ziepe.ca,m:axelrasmussen@go
 ogle.com,m:jannh@google.com,m:maarten.lankhorst@linux.intel.com,m:Liam.Howlett@oracle.com,m:tom@talpey.com,m:bharathsm@microsoft.com,m:dsterba@suse.com,m:konishi.ryusuke@gmail.com,m:weixugc@google.com,m:tzimmermann@suse.de,m:hannes@cmpxchg.org,m:linux-btrfs@vger.kernel.org,m:jlbec@evilplan.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,manguebit.org,kernel.org,lists.freedesktop.org,vger.kernel.org,oracle.com,google.com,ursulin.net,microsoft.com,nvidia.com,zeniv.linux.org.uk,gmail.com,linux-foundation.org,lists.samba.org,ffwll.ch,redhat.com,linux.intel.com,tencent.com,mit.edu,linux.dev,lists.sourceforge.net,huaweicloud.com,fb.com,suse.de,auristor.com,lists.infradead.org,infradead.org,dubeyko.com,brown.name,linux.alibaba.com,intel.com,kvack.org,samba.org,suse.com,suse.cz,bytedance.com,dilger.ca,fasheh.com,ziepe.ca,talpey.com,cmpxchg.org,evilplan.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,Nvidia.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[95];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,Nvidia.com:s=selector2];
	NEURAL_HAM(-0.00)[-0.970];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[ziy@nvidia.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,nvidia.com:mid,nvidia.com:email,nvidia.com:replyto,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,columbia.edu:email]
X-Rspamd-Queue-Id: E606C1AF937
X-Rspamd-Action: no action

On 25 Feb 2026, at 18:44, Tal Zussman wrote:

> struct pagevec was removed in commit 1e0877d58b1e ("mm: remove struct
> pagevec"). Remove remaining forward declarations and change
> __folio_batch_release()'s declaration to match its definition.
>
> Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Acked-by: Chris Li <chrisl@kernel.org>
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>  fs/afs/internal.h       | 1 -
>  fs/f2fs/f2fs.h          | 2 --
>  include/linux/pagevec.h | 2 +-
>  include/linux/swap.h    | 2 --
>  4 files changed, 1 insertion(+), 6 deletions(-)
>
LGTM.

Acked-by: Zi Yan <ziy@nvidia.com>


Best Regards,
Yan, Zi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
