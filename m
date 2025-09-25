Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D35BA21A4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Sep 2025 02:38:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MniYt5jwRlcfYCwfIj2qnPyV16YUf4JVovNoe77SJFQ=; b=briM3cQREUyIDagdkfBGm+FbyD
	6/XAfhMQA++fXu9cWKSLghdSzmilXUdW1J6I8pddK7LiVcr220W4lrgjrEMyxdtPnCLpQoXRG45zN
	omrCaho9XjCmazr2cj+ukjM6MggDjwS3s57mhnQvSoCQbu2W0gPQVSuN5/gsvSSZi1+s=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1wTy-0004fK-Sh;
	Fri, 26 Sep 2025 00:38:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jgg@nvidia.com>) id 1v1wTy-0004fD-7G
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Sep 2025 00:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Type:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PKao8HJwvpIeQoGVjUsM1jhX6PHn5tobkbs0HBICdCU=; b=CoZavT0va8DW1LkvC8c6xrkbry
 lpRAa2YGziuGWHCPcd+ixk6doT40nyvxKGmhMbNQvWqgCDoL1qJjl/5pU/C9M1NtSbUEgOMICR1VV
 MTAali/6vpezuxmohcEoYVwohgfJJV34XJnDHi030fbj6vo1m/1+6tk7skikKPn8l9xk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Type:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PKao8HJwvpIeQoGVjUsM1jhX6PHn5tobkbs0HBICdCU=; b=YyJOfmQynjsJOwUpo+AlYSMfKV
 uB7Ypze1UN3zmtucFZuhK7N9fEnffWgSoXKiCJPG2pdbkbfJT1iq/GVrQY2FpYsr5xXdjfyYk0Khg
 IQYm7MS5K8gYVc3czRi5BjAvFNN6LM7lZTM221gWuHLtkcFSivRUQLdg2x67+QnBTltM=;
Received: from mail-westus3azon11010047.outbound.protection.outlook.com
 ([52.101.201.47] helo=PH7PR06CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v1wTx-0003K0-PU for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Sep 2025 00:38:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATInZTBd69vEM0PXEjlLTNFa5SaIAt3eyjf1VeG7LxcvoiAVe2YWz/g6rwQe+KMnzdeGAmlk0BTOygj6O0D11G7DBkXF2QZFIEIxsK4fsZY+ly8CMIawatymXmAp37U2+0CDy62aEDsq6DAUT9BJoNsjX4vtzJHw7jCpcO4iAdQ1TCrXlYmAODPs+M9vkteGlxys3IyJYyi8gnFnAM96n9WXdPZiXZQqsv0DWoUopJjAAYTelKLwb/BCFej4YS1xDR6V083Uk/yVC+f5m8ZVRCuJjIwB5s/Xv55IB+8bRaGDvKYGvI3VfNQYUMkK4e9HWScENgrdO4hCLsQq54oRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKao8HJwvpIeQoGVjUsM1jhX6PHn5tobkbs0HBICdCU=;
 b=Z4ONMJGVuRUjxyzIXDXyUcMhEzsiYovGD8GUUJew9ByVzm/2ZHLsbOOr4SYrSlE54ngSpF1OXxL4zMCeSjcZPmO79XDbK9qRfgsWupdmomdnqmhxFe/kL9cuwvGxvhX6uR5DqB/b7gjbtOA/pnX0Wjxmk98pGEM68q/9+FHJro5ZzV75F4IAa4FK13MyiNo4Q3irllw8espJgdLRgvP3BtCN2oPsiuKAgz98grr5EJQmtvNXSVmQYtt0Qz6VgcX46rrtMW23QCVc9dMsBga0ZLFl1G/Rc5NDBkZj0URfmKcoEfi+3CTEMKVZx76AlANzM3OvjuRmqAfX/wQmd4eGPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKao8HJwvpIeQoGVjUsM1jhX6PHn5tobkbs0HBICdCU=;
 b=Ug+7LUIFVn4m5+KqBadgNsp0wel5rzQeiaLy1v5aNHe7r9DIVQHd+aNwZO1zxV/H5UDzmTTdauo0m+29synuURJSwTFGX0iu32n2kCm88PgG+lpwaYwKqwuvb3TgaoBHAhdQiu2Ct4w1iolR0yYHI3RpFERHZvgg7ueBynBfFGiqkycvvTpFSOyrZnAf9rzmxE2TzQqoblGtzA/3V9MOmnlqMSBMs19uwDSkpkZsebeyjBCbaAhI3HP9XPbaQmck8LTEa/9FDQASy8VrnXONXadDBbrw36K51KaT3NfZKRsV4yJh8ZViZgA9OaBif/5J9MQ7A5jr4wjVQw2X4D3fYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5769.namprd12.prod.outlook.com (2603:10b6:8:60::6) by
 DS0PR12MB8455.namprd12.prod.outlook.com (2603:10b6:8:158::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9; Thu, 25 Sep 2025 23:04:21 +0000
Received: from DM4PR12MB5769.namprd12.prod.outlook.com
 ([fe80::f5f:6beb:c64a:e1ff]) by DM4PR12MB5769.namprd12.prod.outlook.com
 ([fe80::f5f:6beb:c64a:e1ff%5]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 23:04:21 +0000
Date: Thu, 25 Sep 2025 20:04:20 -0300
To: Sean Christopherson <seanjc@google.com>
Message-ID: <20250925230420.GC2617119@nvidia.com>
References: <20250827175247.83322-2-shivankg@amd.com>
 <20250827175247.83322-10-shivankg@amd.com>
 <aNW1l-Wdk6wrigM8@google.com>
Content-Disposition: inline
In-Reply-To: <aNW1l-Wdk6wrigM8@google.com>
X-ClientProxiedBy: YT4PR01CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::13) To DM4PR12MB5769.namprd12.prod.outlook.com
 (2603:10b6:8:60::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5769:EE_|DS0PR12MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: 3836b33a-33fd-4724-390d-08ddfc87dd0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0uKy48xu78VOYFaHJVK16BBu3/XQ41txItbK5Vcx9cXM4GOG18djJBn/r8M5?=
 =?us-ascii?Q?EVB8YbxWbXoSw4d9gxht3/Dc158117KukqeeZIJgwyjQVISz7eHcZB0BpUyz?=
 =?us-ascii?Q?Bns0Wtf9leAk//k3/vmpdP3FxI7CSte/0gFxR4DjrH10siVJrFU6OacSmIPl?=
 =?us-ascii?Q?whxG2aKxZLchp+mP2tBLzao0xkSKvpTamYMfJPXzKFkh2StQ2ZQBDVF2mGmg?=
 =?us-ascii?Q?d9Y0ZDoLpu0E0LCEonwymX4PMlUWmSN/ARdn/cRbxWO4k6sJsBQ5RF9coL40?=
 =?us-ascii?Q?lzr3cX9k+IDD+xlZ/JinhmkAveQTulsHBhZ7EYlwRdOyJxoHrBPstNF7XA0Z?=
 =?us-ascii?Q?u3/7GMqqvUiacKxg2T/TftGvQHGPRAqkVH14tBrMvJnTtqcg1uNMq14CC8Ew?=
 =?us-ascii?Q?R3zDf8aTku/pk4G1a3sLhQzjf0+C3As3Wo569vG7bSy25Dwjthq/6YEuCpWu?=
 =?us-ascii?Q?jnxwdGWp+FqFyiqChhVrT5KQ3yKa4NuVr9P3yUYghEcBmp39AsXcXLCjRuhs?=
 =?us-ascii?Q?M/TVOj6+3DahXURcigAjbqRyqccB4VOL6oc/Ngt2pFSuW2z3LCMjZ4+VwCoh?=
 =?us-ascii?Q?hVK4U33aX6pQsSOaagB1s9ujQ6Ptd8tg13NJpTuVemYUBD8mHnefd5PXiWXt?=
 =?us-ascii?Q?zpmZipK+BM7zogc5oEPMqGG6O1ioCu+UIneUKiuDeE5b+60zEFuXrGdshIcT?=
 =?us-ascii?Q?pxphArmKNElLYL23ReIlR+v36Re/DCkuwsLayh3kJg8WTNmm8WVgzShUcS9g?=
 =?us-ascii?Q?uEpbi36IstAaXhnxqeMHJMFUx0I3EgqDvUNRpxV6r+EzAJw5f75ZQTXFlV+C?=
 =?us-ascii?Q?vwEyg6Mcvl64sgn0RIfvVRbDePH2Haw0w0PnnpCIuSWsdF4b+MxAaIrMeNrS?=
 =?us-ascii?Q?gp/gzTuHBHJHL+ZhwFB6hyh+T7q4rVP0SmxFGO2NM1pqjGrZDq3qYdeORfUX?=
 =?us-ascii?Q?b3O7JB3l4k4DJ2tG1V6NupI1UaclsLBPOujZk57ss2rkN3JXUzg4jyhqMfVW?=
 =?us-ascii?Q?xArmf+vRocogZdeGJbQabdk6fPgd0wdLWw+4SoOzB8PNVrqgjP9FxkOsnnRo?=
 =?us-ascii?Q?9ObEiQU8PDfDiib2CeaHI29/6RBctPYBbV4wRhPx3xv0+ikJuu6S9nda4Kb/?=
 =?us-ascii?Q?9GqRn22v4wNzsdSCGpeQIeC9zzveaKoniDRTxw9r/tiArIb6E2kKXKXIN22n?=
 =?us-ascii?Q?/CJ3ePVnaNXjEoe/T1RPFA9fjcYM+PMmmysP+1Guatq0PITCDNdrLGGNjtZu?=
 =?us-ascii?Q?S9RUJesvp9SDnWeFqjqqf2JnwJ7Juk7b9KCT0d6bKTd+8m4jex+l7nxe0EAH?=
 =?us-ascii?Q?nwulNazbDWWzP8zlPnvh3q5IgX5JSU5TWefHO1zB+JTufjsXoG5NsTjdyI1Y?=
 =?us-ascii?Q?i/RcoLjRdPHMqbEyPRmxa8koigoSNr5gPuyjhH8/wO34M/Sh8A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xMVJnQhszAwt8cquuiP8OFIq1jZNn7n5sFCFz9chGpkP41QUdQb26qsxioLy?=
 =?us-ascii?Q?1PeOa4yqslrcCxQ4Tar7ovA/gXHRin5qLMCCMD3mVTQyLKigs1RQ80C82cXP?=
 =?us-ascii?Q?yq16U/26huUFSoxh2EkOghN+ka7y1GsKWHLqx3p9V3CP7GJjJ1LX0B5zlLx7?=
 =?us-ascii?Q?VuZD4/th/VsaBoeX7GIoROZB4jXp4US2eL0wpUrbpvH7gJW27l0SNH6lZ3Q9?=
 =?us-ascii?Q?WdrYfJwD8JXcfsF0vHjS31TApGsFpTH76h96+1YPB+dDruV1dUwN8hIWXnSd?=
 =?us-ascii?Q?Tuqw7uZ7LaDkMyKITv2CkSxcssy/BAHrp/Qt4Fw5t8vRZYtNd/136ge+Sw0Z?=
 =?us-ascii?Q?qREZJzHTzneJqA0FuuTNSEkFVF22w0d4+Se1162nZvARoJBuGJsnIbZreF2l?=
 =?us-ascii?Q?GiRXsQxxSUSy15mOSnZWJXe7oIPRQv45Z5Fpygc04YbaudGhhThYddVdYX6t?=
 =?us-ascii?Q?Vsib8uGu+o4mQ4VYzNskhFu6CvJiQ2mPXInoOeDIbQRX6tgvrzyqHsKp6OH0?=
 =?us-ascii?Q?ub2qer0xxnNywbbxen3PvmLIaizU9aoubxN1vxozPhksRTljuR9JVEB/BYjJ?=
 =?us-ascii?Q?Jtups2/vSR+WtSv6jUcxT6gJ7JMEm8srd3KeLoFuFfSLjS6WSRnjQF2UIMSV?=
 =?us-ascii?Q?RQ+cUX+pX6/m+eayoQVILudCmR95Nsft77DNvV3uzcLC5pxgHImCTRmc7SzB?=
 =?us-ascii?Q?Xr2mbK6uJtNmMNtajCD3BRMTQtkwGfoS1qBPSDgsMyFPO+oDyyO7bpzJWIkM?=
 =?us-ascii?Q?A1tgK4CJVr8tsaJ6pOmtCDxzP/VNKQu6ZeGNFJidt3QKfGFLbun9FhDo5vo7?=
 =?us-ascii?Q?F/dpTFdR991QYe5CEM5KDdMTjrW9zI96tIzkg9Y2hOegKl1yRMkjGXhQ+N29?=
 =?us-ascii?Q?K0iTvEv39PO3q3+n+whtwkmAa+3nugASXjANsH2Vxrwf+1LNUFPNVclDCl5h?=
 =?us-ascii?Q?tgE39PPFrURWePg5hLS+pl4pK7Bxz/pQB7Rkt01ObnzxsdbaJBDJN5ErgVeL?=
 =?us-ascii?Q?jFymnggZ7nEoJ/zf+XE1slj0wDqSivNlZAU1XGPsfTw49+7UbfK5yyJCXrrk?=
 =?us-ascii?Q?BgljF7O9Xr5a5BkuClfEl+egmNO0rqtjeamwdCjzIzp2uLLqRmhUnviufWuu?=
 =?us-ascii?Q?Nodvx66rCQxEt+r02HQPF9RToLrvOvQqhAQpQHpRJpbHcz9Y23ZuRyhbvFod?=
 =?us-ascii?Q?xIhPkxmMSb1bO7OqZ5QvdlAaD/R2ZL+NGMvBwCFv9jQyv8ZvfQsJMshbx/mi?=
 =?us-ascii?Q?YoGeOV88lX+ugf7Ha7QiNTS2+/9vsFK7dng1hCYRaTHH7msb95+4Q/BGSpqM?=
 =?us-ascii?Q?vPu9eoThHL55oDkufxBuIm5haxKfDkuEGSyf55lAOZ5q0g0aSfl4LgPssq1G?=
 =?us-ascii?Q?Q8/Nks+C7pL9kL8+pULAeu7neWLDeruMvu19Nn5Rf0H8A6wx31XCTmytZ2XO?=
 =?us-ascii?Q?irXGogcrYCv8b82NM0W77iLuN+Ls/T8ORkTIG/3Uc0m79hy/o+1mBMwGfzAE?=
 =?us-ascii?Q?617FyNAiWqYLgCYgbaf4a5TpUOW93H5QkVwqXvuM5tfk53IWe/ka9O4ooA84?=
 =?us-ascii?Q?XIiOlD7eBoIuPrE792s=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3836b33a-33fd-4724-390d-08ddfc87dd0a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 23:04:21.7429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5Nm/mSx2bTvquCfWiG4n4GBb1Xe01KU5VQzh2zqinhauhupIgO+ZaWme4gfRIGX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8455
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Sep 25, 2025 at 02:35:19PM -0700, Sean Christopherson
 wrote: > > LDLIBS += -ldl > > +LDLIBS += -lnuma > > Hrm, this is going to
 be very annoying. I don't have libnuma-dev installed on > any of [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.201.47 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v1wTx-0003K0-PU
Subject: Re: [f2fs-dev] [PATCH kvm-next V11 7/7] KVM: guest_memfd:
 selftests: Add tests for mmap and NUMA policy support
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
From: Jason Gunthorpe via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jason Gunthorpe <jgg@nvidia.com>
Cc: jgowans@amazon.com, mhocko@suse.com, jack@suse.cz, kvm@vger.kernel.org,
 david@redhat.com, linux-btrfs@vger.kernel.org, aik@amd.com, papaluri@amd.com,
 kalyazin@amazon.com, peterx@redhat.com, linux-mm@kvack.org, clm@fb.com,
 ddutile@redhat.com, linux-kselftest@vger.kernel.org, shdhiman@amd.com,
 gshan@redhat.com, ying.huang@linux.alibaba.com, shuah@kernel.org,
 roypat@amazon.co.uk, matthew.brost@intel.com, zbestahu@gmail.com,
 lorenzo.stoakes@oracle.com, linux-bcachefs@vger.kernel.org,
 ira.weiny@intel.com, dhavale@google.com, jmorris@namei.org,
 willy@infradead.org, hch@infradead.org, chao.gao@intel.com, tabba@google.com,
 ziy@nvidia.com, rientjes@google.com, yuzhao@google.com, xiang@kernel.org,
 nikunj@amd.com, gourry@gourry.net, serge@hallyn.com,
 Shivank Garg <shivankg@amd.com>, thomas.lendacky@amd.com, ashish.kalra@amd.com,
 chao.p.peng@intel.com, yan.y.zhao@intel.com, byungchul@sk.com,
 michael.day@amd.com, Neeraj.Upadhyay@amd.com, michael.roth@amd.com,
 bfoster@redhat.com, bharata@amd.com, josef@toxicpanda.com,
 Liam.Howlett@oracle.com, ackerleytng@google.com, dsterba@suse.com,
 viro@zeniv.linux.org.uk, jefflexu@linux.alibaba.com, jaegeuk@kernel.org,
 dan.j.williams@intel.com, surenb@google.com, vbabka@suse.cz,
 paul@paul-moore.com, joshua.hahnjy@gmail.com, apopple@nvidia.com,
 brauner@kernel.org, quic_eberman@quicinc.com, rakie.kim@sk.com,
 cgzones@googlemail.com, pvorel@suse.cz, linux-erofs@lists.ozlabs.org,
 kent.overstreet@linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, pankaj.gupta@amd.com,
 linux-security-module@vger.kernel.org, lihongbo22@huawei.com,
 amit@infradead.org, linux-fsdevel@vger.kernel.org, pbonzini@redhat.com,
 akpm@linux-foundation.org, vannapurve@google.com, suzuki.poulose@arm.com,
 rppt@kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Sep 25, 2025 at 02:35:19PM -0700, Sean Christopherson wrote:
> >  LDLIBS += -ldl
> > +LDLIBS += -lnuma
> 
> Hrm, this is going to be very annoying.  I don't have libnuma-dev installed on
> any of my <too many> systems, and I doubt I'm alone.  Installing the package is
> trivial, but I'm a little wary of foisting that requirement on all KVM developers
> and build bots.

Wouldn't it be great if the kselftest build system used something like
meson and could work around these little issues without breaking the
whole build ? :(

Does anyone else think this?

Every time I try to build kselftsts I just ignore all the errors the
fly by because the one bit I wanted did build properly anyhow.

Jason


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
