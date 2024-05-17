Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5114E8C827D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 May 2024 10:15:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s7skV-0006A6-L5;
	Fri, 17 May 2024 08:15:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <oliver.sang@intel.com>) id 1s7skU-00069M-2X
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 May 2024 08:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Type:Message-ID:
 Subject:CC:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FXap0Cl4OeSrkK7u90B7aHgUnehfhT6vgDkUX/vnyoU=; b=Y2fT7Omb91Wteqhq2opAx6Brht
 GOggbNccDgJqyGU4PYQkOAxgQTYwBMwyTKBboU/MIbx5XjjAjcQOe1Iu7gdq+RiXeJzf2NgaSXqwA
 5lvkQCAm5tBSCR+oMhtBJAVbhnKsjw58KLtqJPEHPVWPq4F8ljVBbIhG2eqdmOPSHRU8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Type:Message-ID:Subject:CC:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FXap0Cl4OeSrkK7u90B7aHgUnehfhT6vgDkUX/vnyoU=; b=m
 yKSKT7OaFVf9Vvea8FZt6UX/zbnaKT8TGn1DtPh/wk0d6HFXQCmFEFnFLdmY5WoslgWtGA4dScYr2
 UTavxWeXrxUL4Hpko9VZ/0lyEgjy13Vh6ad6qvush1hdzreR4OKTDTSO9pH02GyjyUdsZ1ecPd2wj
 gYc6IWVp/aVnU5EQ=;
Received: from mgamail.intel.com ([198.175.65.9])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s7skU-0008LR-Py for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 May 2024 08:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715933730; x=1747469730;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=cihv7AeUJzWwirUpFYIHniOK2nedqdl6i7EX1vT3i7w=;
 b=GGdNkxyYGfbtfZ283dCaMzojPbF9WJU7amDFl5yA//w/XP5r1NmXNMbG
 L0bZtqnigGoMEzydnWoYItSFn+uyDycezG82RItE8VnIabn3SHdz/x8SN
 ZpEZYR0mOBWgYQ97Y93vsDZu4zw3+1MDMMimtihEpUJb4nn+5qHrc9NgF
 JLTpnHVyQAAMTon61FdrWRygBLhGyxbsPO8rj8hLSm0addvoxFD7+/TIo
 Hnzfd+k4OwWtSjzXnhbxQLM9v3kczNugxDsKZ9/pC3EN8DCSYctY49xeE
 1DxD+flbDl47sQmrZa3PpePcSbyWyoxTbUgSIqODBYwWBI94F64WUESad A==;
X-CSE-ConnectionGUID: Xq5mxB7DTB6SxH3sU7x+5Q==
X-CSE-MsgGUID: pt/9AMssSIWOZRni57Km/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="34609525"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="34609525"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 01:15:23 -0700
X-CSE-ConnectionGUID: groBVWPzSpWPWaNeNfXJ7A==
X-CSE-MsgGUID: rOL0JNE8SL6VRB/S5TsWEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="36512104"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 May 2024 01:15:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 01:15:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 01:15:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 17 May 2024 01:15:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 17 May 2024 01:15:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBWfLW9skT3kC+ofX8NauDrd86OiyeotyLzPLH1djT6CaPSC3mvKsmfjq4/l7IKWQU2cA2wvp49iNH6+SFjhAOCXRgP8wxeabbkWr1T9OGlyBvDUSWmdzt89P6Xj4XnXZ8QXeilXmwSS91ED9fHRGErwyRt7bbv/CMFi7r/LD5hwuMdlO2ppkadd3cNtC3AurRT4zuTQLWtTpYGptyhZHuNqgaXn8MgYA8d8xAkk98IZsCzgUsz9GSINilcDl5FfiHaA3WsR9o2A6sHlwZVERb/ZiImVuJzNKLWIc/nO3JBI7LlaZoxj9dWA0jFSZ468h2LnRX8CQ9kelHJ6dg54Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXap0Cl4OeSrkK7u90B7aHgUnehfhT6vgDkUX/vnyoU=;
 b=DlQ23gtOlrZWfY8NBifEfRt8XdZbiA6LfJ/VtHsynE/Wb6MiUmLwJta4enYUe2rhN3WhaVol2V05WIyHmCdUa/ZNi6zOJ0l2svMMtmD8/4WyPfV0iJxxngxBuumWBTqudY64TZRKorFNFrfhUFsRtmFAZoSRFl3joX69dYw1RaQ4rddjOFu00HiDRE0mMloie9+SJiTbQccCSHp2vJ8lAIzLUXV2duJOoE7dVvt+Zp1xgqWD0R9wkFaaZers/hcRab8SQsMPofWXZZy6pclT8fP4WBe8emFliW9pFVhujhOG856ejqdnVKiGA0F8e7iUUqnAuZBCXPszmN9r14r7KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 08:15:20 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7544.052; Fri, 17 May 2024
 08:15:20 +0000
Date: Fri, 17 May 2024 16:15:11 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <202405171532.760e22d3-oliver.sang@intel.com>
Content-Disposition: inline
In-Reply-To: <20240510023906.281700-1-chao@kernel.org>
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM6PR11MB4738:EE_
X-MS-Office365-Filtering-Correlation-Id: cab95410-2d0a-4c18-e7e7-08dc76497de9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lSd2jFuj/Q4gTuTt5abZyVRSpF48FzbCEI2H8U1PoTvFNp+p6zGE/UrZsHI/?=
 =?us-ascii?Q?FxjLi+LG8YrqVNCkSmXZ+buAhlRQ7HwQ4P35/4Falu695Qdx+vD+qAH91gTi?=
 =?us-ascii?Q?zA/4XM3SFmZjv7PjUW6jH+zkLWRNfw2SsicttReYoDKZ6uyhaicuH/Ghcbaf?=
 =?us-ascii?Q?1wmsKJScRtHJjTE9IPUq9GakkxYDX6Tf+QnAhC7K23978DNEH6kRCVOwa/nM?=
 =?us-ascii?Q?MZ32JJNQSmodLSImlm6FPqP5uGL39pn2eATG/9Ok2yld2PX6ykY/J9F4LJT7?=
 =?us-ascii?Q?38fOEM9elT0fwco5akJkLsymVUkXGlcofuj5gzOVwZiqSy89tpf9pFazWnsq?=
 =?us-ascii?Q?08JzTgmeNxZ1IgSG4iEvEwp1JXnv2Ctr/IX7lNPQoeWc2pQnUDrS0b+TUGS5?=
 =?us-ascii?Q?Bj5TyRgLezvrosd7BxcH4ybnuHpJi4B2P8MmXfkV8jR3RWZ+WWMAeulBfypI?=
 =?us-ascii?Q?p35nJ4faE3lj3H5CyMmW/5sHjwqSrPYOTkR2UbWC0oXURi0lazFtEliHM54R?=
 =?us-ascii?Q?Xrm7IMprwWLpPavwUN2gb1o14mzGXDL9B9Zzn/xfMBkbixJcG+SHLF1eghYu?=
 =?us-ascii?Q?6aF9Rz/dYCfw7ss0FC2cPYplrUPOkvWbNMTL48raMIK7hJZpfd0ki+TSNiPu?=
 =?us-ascii?Q?SxdA7IWZQBUh2yqknL98C8/qPbf+qo9s4XQh9Ntb9gKr236Bwva+Wnt3P5Ad?=
 =?us-ascii?Q?CfVCNtE7q93/LYBqnQp7UTV6jGxgcaHPWY6YBjv0UIbt2Nw4tEedp8Um05Gi?=
 =?us-ascii?Q?JaGv+SqQH+zAI77oNJrQ4UgR7KX+W2R2lIPexStnILsL9SbSlOUKW6oVeBsW?=
 =?us-ascii?Q?XPFuuZ04eXkPhBh+HhdiBpnqVrdff6sq3gvLaNXTo51swbXXHRNBq0xeyJeQ?=
 =?us-ascii?Q?E/5uCN+uCPpuncOEryaZB/CRt2JSU5RrJsjx2TfX8FqjeagAIeJuSCprEDXT?=
 =?us-ascii?Q?DgZMCcIcSQfy7QHXhBe4dp2vrli7SBVh5ofN927RE6N5huZr1X7FEYUQWMSN?=
 =?us-ascii?Q?GiWWtFqpttCjm3LtnxN0ExeSrhQAypjA2UqymbTSkvIZejvk5GrL5lNR3QMl?=
 =?us-ascii?Q?sCMOI9Tm1Si156itjP77qccHl2W4wxGjXIHqyL9gpdlKtUxkX5uv0zTWDMGh?=
 =?us-ascii?Q?Li43fWbEQl/Cchb4s6sVLJitffgnFemb77Y6CvBRJgnTcHlNNFykptTFbyjq?=
 =?us-ascii?Q?fS2y1RGkFKv1WBQRFgJgnK0HD8bIMaPlWQt0pI0cqWkAlsJK37hxjrpmNro?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SVPOKylwf6qla6/bh8UJQNnQ6XOqkHEavwRV7vtBVkce+V5clGn8W0NAIA0c?=
 =?us-ascii?Q?LNY3LqBmz9jbBhHiMmBrwHkJEGIzkmB9IR3dIKX3qvtvOXPEINac5ZiOVU/i?=
 =?us-ascii?Q?v3gcEEz3a0JXACq53zPtpwhznmh+vCyDxCOIDxuNHQh38FWSQCkiBB+/VUjU?=
 =?us-ascii?Q?wcyouyWCWUwCdnHmibknDIG65fLXXZfg9ooFUZLREIA4r2kwAwGaAeitShlb?=
 =?us-ascii?Q?12s+Vk3VAbKEQt7VQIN8PF/PHlB2BkfYa9NTE0blHUa38xc1X6dn+SmpTjNO?=
 =?us-ascii?Q?zwbOs6jNZpYbzfUYKB9KcpixpakKNOHbXUizQqupafMmQ+4pKEYnGocIr2BO?=
 =?us-ascii?Q?f7mV5z3MJuZy7W7q39t83Kj7LMVzcbpS60Wv2pzHSj5Mlc/pLRoxgbZNw6g9?=
 =?us-ascii?Q?kG62j0cvZ5aFP0EifSLbZ7gOWqT18wFrW1FJfQilWIpGcFu0c7jxjjk73NzD?=
 =?us-ascii?Q?GgxnCw7kmvW8IcM89fcUtldBouUEL5SklWG0ulM2nNn8r8qYvJLvAfuSZQQW?=
 =?us-ascii?Q?yGF09UcV89eTa+bFRf06kOQqo7HHE1mmSbN6VI3XwfM15SunvtKXH25Tt+2/?=
 =?us-ascii?Q?GEPZN+Mti8psw0ddDQTXxFlld+UicDls7eL3bHAHuerl8sTbBEmPPZfz1jUW?=
 =?us-ascii?Q?MeHVfOkmHdl0418pPjdaGRp3xkIOq+EAtuAPR9bJPPpVh+mXYLQBoyAHSY2U?=
 =?us-ascii?Q?yiTxKt1DztntO5iF64p5fGt+CEQYCPq6AsVF4Xr0O7UmTC/b20n8nnIQ2CGG?=
 =?us-ascii?Q?szWtugc2t9ewgFmSH8AwMRwSsFPJpwkOK8lEMQ+9axhvG98H007V0MuupEHa?=
 =?us-ascii?Q?pvUCqZ5u6JVjDnxNLNraRbzBnCwdone9dv3ta5f6kwNRRcBjPn5nygKlip+k?=
 =?us-ascii?Q?RK5jsIwdRxWjGt5AWkIL0NXxmo/lhHKJ5OI87HqjrcBwUA53VqasQSekHWxP?=
 =?us-ascii?Q?Y81u/ZzL9Wa7Vy08iIo5TdfZdcgV1TG3zvAr3eTFJSTBM6fN5E880UnbOY0M?=
 =?us-ascii?Q?5eDdyJ9ETEG60b2iP1hjpUDkxY13X0bIX+aN+UDMWJp+IvaNtJJ9AQzEAsiN?=
 =?us-ascii?Q?6EqQO2ekfvhj5BXO7kXPkbEqKJPMpK7y5x6n00XK/ynDWXuuoE1Q2sP5ESin?=
 =?us-ascii?Q?crVbA8tjIUgWDFRi3U5TP5XtZjxvlNunMbqINKWF7vTbvkWOqQoKjfQDvtQj?=
 =?us-ascii?Q?LtWKQwla2UWnBpiCWCKZ0KEyCG1kDIyKFUg/LElY8kU9TBT8GnKR8YC/50jF?=
 =?us-ascii?Q?BnQadNTfXdzFPSfGlsMyjvAOTepVY+y+iTl6YKqQKB2PlLxxpjnYOwuPpO53?=
 =?us-ascii?Q?Tf41BHaVmJo+RdExLM+yjtux+XvmMH262fVVpZ3BUub775WBN3D3PGl5wlWO?=
 =?us-ascii?Q?Sf/HWtCY5jQc6HPQhhFqA9k6soIKT8GGK6qKMTewD3lq5eZTDi0lKpLTvPJf?=
 =?us-ascii?Q?SDjpxahOpmQ74wbo+//LJDBaKnb41HcMU8DwMKTOROZ6oNHtzLJOJ5ITh0Si?=
 =?us-ascii?Q?QERuoffnktIiV9jAeVWvsbdwuFjFZBddlp1EP0qC6bI72RRhXcajSg8JE6sx?=
 =?us-ascii?Q?KpUvQm51onX0+sljqkclVFS2u5UOvBovPBAc2xQjd0mnjj5oSHwyvccTEuCc?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cab95410-2d0a-4c18-e7e7-08dc76497de9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 08:15:20.0110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OpiyVawoMAyX+24JCl1U9TfGNOcqkhAkhhEj0JZ4SYmgHw0p+94I1+2j7jOIMSCcNGOSzoeqAfSEDRZQZUI0YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4738
X-OriginatorOrg: intel.com
X-Spam-Score: -3.5 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 kernel test robot noticed "WARNING:at_kernel/locking/rwsem.c:#down_read"
 on: commit: abf7df61e5c60fed520a09102d576fd41ed4d5ee ("[PATCH v2] f2fs: fix
 to avoid racing in between read and OPU dio write") url:
 https://github.com/intel-lab-lkp/linux/commits/Chao-Yu/f2fs-fix-to-avoi
 [...] Content analysis details:   (-3.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.175.65.9 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s7skU-0008LR-Py
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid racing in between read
 and OPU dio write
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
Cc: lkp@intel.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, oliver.sang@intel.com,
 oe-lkp@lists.linux.dev, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



Hello,

kernel test robot noticed "WARNING:at_kernel/locking/rwsem.c:#down_read" on:

commit: abf7df61e5c60fed520a09102d576fd41ed4d5ee ("[PATCH v2] f2fs: fix to avoid racing in between read and OPU dio write")
url: https://github.com/intel-lab-lkp/linux/commits/Chao-Yu/f2fs-fix-to-avoid-racing-in-between-read-and-OPU-dio-write/20240510-104020
base: https://git.kernel.org/cgit/linux/kernel/git/jaegeuk/f2fs.git dev
patch link: https://lore.kernel.org/all/20240510023906.281700-1-chao@kernel.org/
patch subject: [PATCH v2] f2fs: fix to avoid racing in between read and OPU dio write

in testcase: xfstests
version: xfstests-x86_64-0e5c12df-1_20240511
with following parameters:

	disk: 4HDD
	fs: f2fs
	test: generic-617



compiler: gcc-13
test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz (Skylake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202405171532.760e22d3-oliver.sang@intel.com


[  160.985543][ T2255] ------------[ cut here ]------------
[ 160.990864][ T2255] WARNING: CPU: 3 PID: 2255 at kernel/locking/rwsem.c:245 down_read (kernel/locking/rwsem.c:245 (discriminator 1) kernel/locking/rwsem.c:1249 (discriminator 1) kernel/locking/rwsem.c:1263 (discriminator 1) kernel/locking/rwsem.c:1528 (discriminator 1)) 
[  160.999715][ T2255] Modules linked in: f2fs crc32_generic intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal btrfs intel_powerclamp blake2b_generic coretemp xor zstd_compress kvm_intel raid6_pq libcrc32c i915 kvm sd_mod t10_pi crc64_rocksoft_generic crct10dif_pclmul crc32_pclmul crc64_rocksoft crc64 crc32c_intel ghash_clmulni_intel sha512_ssse3 sg drm_buddy rapl ipmi_devintf intel_cstate intel_gtt ipmi_msghandler mei_wdt wmi_bmof intel_uncore i2c_i801 drm_display_helper i2c_smbus ahci ttm drm_kms_helper libahci video libata mei_me mei acpi_pad intel_pch_thermal wmi binfmt_misc loop fuse drm dm_mod ip_tables
[  161.053654][ T2255] CPU: 3 PID: 2255 Comm: fsx Tainted: G          I        6.9.0-rc1-00036-gabf7df61e5c6 #1
[  161.063438][ T2255] Hardware name: Dell Inc. OptiPlex 7040/0Y7WYT, BIOS 1.1.1 10/07/2015
[ 161.071504][ T2255] RIP: 0010:down_read (kernel/locking/rwsem.c:245 (discriminator 1) kernel/locking/rwsem.c:1249 (discriminator 1) kernel/locking/rwsem.c:1263 (discriminator 1) kernel/locking/rwsem.c:1528 (discriminator 1)) 
[ 161.076376][ T2255] Code: b8 00 00 00 00 00 fc ff df 83 e3 02 48 c1 ea 03 4c 09 fb 48 83 cb 01 80 3c 02 00 0f 85 9a 00 00 00 48 89 5d 08 e9 50 ff ff ff <0f> 0b 4c 8d 7d 08 be 08 00 00 00 4c 89 ff e8 c1 59 e9 fd 4c 89 f8
All code
========
   0:	b8 00 00 00 00       	mov    $0x0,%eax
   5:	00 fc                	add    %bh,%ah
   7:	ff                   	(bad)  
   8:	df 83 e3 02 48 c1    	filds  -0x3eb7fd1d(%rbx)
   e:	ea                   	(bad)  
   f:	03 4c 09 fb          	add    -0x5(%rcx,%rcx,1),%ecx
  13:	48 83 cb 01          	or     $0x1,%rbx
  17:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
  1b:	0f 85 9a 00 00 00    	jne    0xbb
  21:	48 89 5d 08          	mov    %rbx,0x8(%rbp)
  25:	e9 50 ff ff ff       	jmpq   0xffffffffffffff7a
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	4c 8d 7d 08          	lea    0x8(%rbp),%r15
  30:	be 08 00 00 00       	mov    $0x8,%esi
  35:	4c 89 ff             	mov    %r15,%rdi
  38:	e8 c1 59 e9 fd       	callq  0xfffffffffde959fe
  3d:	4c 89 f8             	mov    %r15,%rax

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	4c 8d 7d 08          	lea    0x8(%rbp),%r15
   6:	be 08 00 00 00       	mov    $0x8,%esi
   b:	4c 89 ff             	mov    %r15,%rdi
   e:	e8 c1 59 e9 fd       	callq  0xfffffffffde959d4
  13:	4c 89 f8             	mov    %r15,%rax
[  161.095753][ T2255] RSP: 0018:ffffc90002c0f8b8 EFLAGS: 00010286
[  161.101662][ T2255] RAX: fffffffffffffe00 RBX: fffffffffffffe00 RCX: ffffffff83bdf543
[  161.109469][ T2255] RDX: ffffed10236632f0 RSI: 0000000000000008 RDI: ffff88811b319778
[  161.117276][ T2255] RBP: ffff88811b319778 R08: 0000000000000001 R09: ffffed10236632ef
[  161.125080][ T2255] R10: ffff88811b31977f R11: ffffffff85fe96a2 R12: 1ffff92000581f18
[  161.132885][ T2255] R13: dffffc0000000000 R14: ffffc90002c0fa70 R15: 0000000000000000
[  161.140691][ T2255] FS:  00007f623f19d740(0000) GS:ffff8887e9380000(0000) knlGS:0000000000000000
[  161.149446][ T2255] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  161.155871][ T2255] CR2: 00007f623f05b000 CR3: 00000001b2026006 CR4: 00000000003706f0
[  161.163705][ T2255] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  161.171512][ T2255] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  161.179316][ T2255] Call Trace:
[  161.182456][ T2255]  <TASK>
[ 161.185254][ T2255] ? __warn (kernel/panic.c:694) 
[ 161.189181][ T2255] ? down_read (kernel/locking/rwsem.c:245 (discriminator 1) kernel/locking/rwsem.c:1249 (discriminator 1) kernel/locking/rwsem.c:1263 (discriminator 1) kernel/locking/rwsem.c:1528 (discriminator 1)) 
[ 161.193456][ T2255] ? report_bug (lib/bug.c:180 lib/bug.c:219) 
[ 161.197814][ T2255] ? handle_bug (arch/x86/kernel/traps.c:239 (discriminator 1)) 
[ 161.202003][ T2255] ? exc_invalid_op (arch/x86/kernel/traps.c:260 (discriminator 1)) 
[ 161.206532][ T2255] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
[ 161.211414][ T2255] ? down_read (arch/x86/include/asm/atomic64_64.h:79 (discriminator 5) include/linux/atomic/atomic-arch-fallback.h:2723 (discriminator 5) include/linux/atomic/atomic-long.h:163 (discriminator 5) include/linux/atomic/atomic-instrumented.h:3298 (discriminator 5) kernel/locking/rwsem.c:243 (discriminator 5) kernel/locking/rwsem.c:1249 (discriminator 5) kernel/locking/rwsem.c:1263 (discriminator 5) kernel/locking/rwsem.c:1528 (discriminator 5)) 
[ 161.215600][ T2255] ? down_read (kernel/locking/rwsem.c:245 (discriminator 1) kernel/locking/rwsem.c:1249 (discriminator 1) kernel/locking/rwsem.c:1263 (discriminator 1) kernel/locking/rwsem.c:1528 (discriminator 1)) 
[ 161.219854][ T2255] ? down_read (arch/x86/include/asm/atomic64_64.h:79 (discriminator 5) include/linux/atomic/atomic-arch-fallback.h:2723 (discriminator 5) include/linux/atomic/atomic-long.h:163 (discriminator 5) include/linux/atomic/atomic-instrumented.h:3298 (discriminator 5) kernel/locking/rwsem.c:243 (discriminator 5) kernel/locking/rwsem.c:1249 (discriminator 5) kernel/locking/rwsem.c:1263 (discriminator 5) kernel/locking/rwsem.c:1528 (discriminator 5)) 
[ 161.224034][ T2255] ? __rmqueue_pcplist (include/linux/list.h:215 (discriminator 1) include/linux/list.h:229 (discriminator 1) mm/page_alloc.c:2836 (discriminator 1)) 
[ 161.228904][ T2255] ? __pfx_down_read (kernel/locking/rwsem.c:1524) 
[ 161.233566][ T2255] ? __pfx___might_resched (kernel/sched/core.c:10152) 
[ 161.238707][ T2255] f2fs_dio_read_iter (fs/f2fs/f2fs.h:2468 (discriminator 1) fs/f2fs/file.c:4477 (discriminator 1)) f2fs
[ 161.244288][ T2255] f2fs_file_read_iter (fs/f2fs/file.c:4533) f2fs
[ 161.249949][ T2255] copy_splice_read (include/linux/fs.h:2102 fs/splice.c:365) 
[ 161.254636][ T2255] ? __pfx_copy_splice_read (fs/splice.c:324) 
[ 161.259843][ T2255] splice_direct_to_actor (fs/splice.c:1136) 
[ 161.265045][ T2255] ? __pfx_direct_splice_actor (fs/splice.c:1159) 
[ 161.270507][ T2255] ? __pfx_splice_direct_to_actor (fs/splice.c:1032) 
[ 161.276229][ T2255] ? __pfx___might_resched (kernel/sched/core.c:10152) 
[ 161.281359][ T2255] ? from_kgid_munged (kernel/user_namespace.c:527) 
[ 161.286131][ T2255] do_splice_direct (fs/splice.c:1208 fs/splice.c:1233) 
[ 161.290829][ T2255] ? __pfx_do_splice_direct (fs/splice.c:1232) 
[ 161.296047][ T2255] ? __pfx_direct_file_splice_eof (fs/splice.c:1178) 
[ 161.301779][ T2255] ? __pfx___might_resched (kernel/sched/core.c:10152) 
[ 161.306894][ T2255] ? rw_verify_area (fs/read_write.c:377) 
[ 161.311507][ T2255] vfs_copy_file_range (fs/read_write.c:1558) 
[ 161.316552][ T2255] ? f2fs_getattr (arch/x86/include/asm/bitops.h:206 (discriminator 1) arch/x86/include/asm/bitops.h:238 (discriminator 1) include/asm-generic/bitops/instrumented-non-atomic.h:142 (discriminator 1) fs/f2fs/f2fs.h:3056 (discriminator 1) fs/f2fs/f2fs.h:3311 (discriminator 1) fs/f2fs/file.c:904 (discriminator 1)) f2fs
[ 161.321759][ T2255] ? __pfx_vfs_copy_file_range (fs/read_write.c:1486) 
[ 161.327234][ T2255] ? __pfx___might_resched (kernel/sched/core.c:10152) 
[ 161.332362][ T2255] __do_sys_copy_file_range (fs/read_write.c:1612) 
[ 161.337755][ T2255] ? __pfx___do_sys_copy_file_range (fs/read_write.c:1578) 
[ 161.343661][ T2255] ? f2fs_llseek (arch/x86/include/asm/bitops.h:206 (discriminator 1) arch/x86/include/asm/bitops.h:238 (discriminator 1) include/asm-generic/bitops/instrumented-non-atomic.h:142 (discriminator 1) fs/f2fs/f2fs.h:3056 (discriminator 1) fs/f2fs/f2fs.h:3210 (discriminator 1) fs/f2fs/file.c:518 (discriminator 1)) f2fs
[ 161.348813][ T2255] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) 
[ 161.353151][ T2255] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:129) 
[  161.358886][ T2255] RIP: 0033:0x7f623f2a1719
[ 161.363137][ T2255] Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b7 06 0d 00 f7 d8 64 89 01 48
All code
========
   0:	08 89 e8 5b 5d c3    	or     %cl,-0x3ca2a418(%rcx)
   6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
   d:	00 00 00 
  10:	90                   	nop
  11:	48 89 f8             	mov    %rdi,%rax
  14:	48 89 f7             	mov    %rsi,%rdi
  17:	48 89 d6             	mov    %rdx,%rsi
  1a:	48 89 ca             	mov    %rcx,%rdx
  1d:	4d 89 c2             	mov    %r8,%r10
  20:	4d 89 c8             	mov    %r9,%r8
  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
  28:	0f 05                	syscall 
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	retq   
  33:	48 8b 0d b7 06 0d 00 	mov    0xd06b7(%rip),%rcx        # 0xd06f1
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	retq   
   9:	48 8b 0d b7 06 0d 00 	mov    0xd06b7(%rip),%rcx        # 0xd06c7
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240517/202405171532.760e22d3-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
