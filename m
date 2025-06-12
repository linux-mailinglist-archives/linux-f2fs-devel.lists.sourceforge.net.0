Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F06AD6B64
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jun 2025 10:50:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKzCZ6IS7dl0Hjk5HMJRhQVhPES6bqHy4g6w5/lHCbU=; b=IAJn+lQ3MKchla6uHXrI6BtPGO
	F7ZpoU2MmaPi9zGRST2qtp5H1s/kvhhTwcVl8mIRhayuRgfJjAVoPEJ/dQ6udwJEghS+5Pb24DIaq
	MmCUTxQRTB7RV3RAeYMDUtYNvm5SrhM0JU5OWPw5TMEAp7EZCEuWKfi39S6EmF2UH2wM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPde5-0007Yr-Tm;
	Thu, 12 Jun 2025 08:50:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <giovanni.cabiddu@intel.com>) id 1uPde4-0007Yk-CJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 08:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Type:References:
 Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8b+4Z8ybpWm3RWVQpnfmlVXbQqBifLb4Pk8dsQ+8ikk=; b=EqY+Qo7UYt5/WJfz78bNIb+Wrw
 hG3pWjqBRacsRG+zescTMUZie8UoVpGE7ZNCJQzbPss3EdFDiyozIRuwPJtlSTfyKJdpAg5CzXNq2
 ItYLN5RPVtCWaXYRBtNh3u8dtyj8EzcPWu2M5JBHZWWSXwfODLnIT/oj4wFmTYZmaJ+0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Type:References:Message-ID:Subject:CC:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8b+4Z8ybpWm3RWVQpnfmlVXbQqBifLb4Pk8dsQ+8ikk=; b=RJPBJBze9jXkLC3mwiPtyXtS43
 TEPG6bdzQsNDSndQGfAVcQQsS91YITkYw3ld/gpyOpJTijGUo9gHOTlosyGDAK+E2tnoFt3DMcNOA
 MBNrxZ8IgKQCyilpiTB2yDjswiI4nhsPMpv06h9vwAFJHUcKZsFIUo/Q69Eq3SUJHVEI=;
Received: from mgamail.intel.com ([192.198.163.19])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPde3-0005Wv-Op for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 08:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749718247; x=1781254247;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TRXcrKGib/1ggSnXpozeeqzIZsx2TaicwldzxFJfjZY=;
 b=dlvFgcmYUpBKh0KFlEc+pVXw54S4Z+Z62VLRturNyFI38Txp0IPuwRGy
 85dlxlxBrTY1Z6KMQmqqd2ia7kDfbgi3HPU9aTdRsI6fwL6cdLntgeboH
 84mguJtxbZBq3KBtfna+/CzUNaYvA5h23mD+OCv4Ny1WMOKN7ibKn0bgi
 PY+xJBAtaXmQqvQoE8f0+F8xNwdq6Q0REBuyKxGfvDVACNosuGqyREOR5
 6yTaPUqjuyciQSr/Uamz11y9kF++MScdlBnTcSHsPt9qwPx7fkGy7+Agb
 BAtwtUiaVKsCv/MGrPqVDiZkiABr/MFzKftWFItLpfOZMjC+NeqKcspEz w==;
X-CSE-ConnectionGUID: 8CYDkjl2RR65IiBlm/88Ww==
X-CSE-MsgGUID: hGugNqbzROevD79QY7gJIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="50995383"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="50995383"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 01:50:41 -0700
X-CSE-ConnectionGUID: k/7iOw8HS8evKWshTCY1fg==
X-CSE-MsgGUID: dSgeJn9hQ1Wr3CxZfgTnqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="148006093"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 01:50:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 01:50:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 01:50:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.80)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 01:50:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLd7Wcsmg9Ej1/IuLa+CK5oUsn5oWYFo8ArQJJko7tjYLehjVf+7JNS98Svvs34PJombd8mCzxVKiKG79JnMeIsaVOxv76PM28L8se1AiBxNuOx0Vm4gp6kUS1/u0f1m32Yf7REwgOOdvnx//U10dB5WF98UCBuy3BJKVY4dea5gtkpsiMhYyxem0C5ultqh1sxUU8JZY1iq7SBvFt2n2ZDqv75C4v48F64u3uOpZl3pbLwI8KMIkqlYmKpwZt60pu3X1LcLV8ZukP4J1fwjOFHdtk/H429LtmPkbK7qmWFJYHfR9vddcPZWubo1UQ97qW7AmLXaczDQ+7hIzITnig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8b+4Z8ybpWm3RWVQpnfmlVXbQqBifLb4Pk8dsQ+8ikk=;
 b=Q7EAMBdV7X6ORiyXgjsqDOunhwPxir1wWr0aGM8YzVIsmKupGZmy4+Zc7UO7kr1zzI0sCLhACST1sao2IRGQD9gdCnoTUsPjU70MkhZcwC2iJ2zzf82FgRC8brlev8MU/lItfXoMEk9CX878rCXQ+NHfriYK0a2+WY282BHLW726hvH65b+Sx+0qq4I2Gr5KWptYNaPHbQ2lUSFNqSiwMyiL8v32JJPGwluTJRsbRuXAkyQd7I0u4D/FC7wTMBfFBbeI31WfFcCSsTQ3cuA284r4bqEWU7xroXAuCkI05UDUklj7+kB/4RQC7WmRZ673mYLtOoZqFw82fNqhFJ6V7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SA2PR11MB4954.namprd11.prod.outlook.com (2603:10b6:806:11b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 12 Jun
 2025 08:50:33 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 08:50:33 +0000
Date: Thu, 12 Jun 2025 09:50:26 +0100
From: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <aEqU0iU1tBrLEYUq@gcabiddu-mobl.ger.corp.intel.com>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
 <20250612005914.GA546455@google.com> <20250612062521.GA1838@sol>
Content-Disposition: inline
In-Reply-To: <20250612062521.GA1838@sol>
Organization: Intel Research and Development Ireland Ltd - Co. Reg. #308263 -
 Collinstown Industrial Park, Leixlip, County Kildare - Ireland
X-ClientProxiedBy: DU6P191CA0060.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::10) To CY5PR11MB6366.namprd11.prod.outlook.com
 (2603:10b6:930:3a::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6366:EE_|SA2PR11MB4954:EE_
X-MS-Office365-Filtering-Correlation-Id: c0148b7a-7e54-45bc-5f74-08dda98e3165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qq/FCe19+EHD0QUI8mIYtMZw7JsJuVG3BhxiXkoHhfo7tYGiGYGP4Slof38q?=
 =?us-ascii?Q?ZcZZELm/03uxQjMGrreWYvDbNOcvMAK1UAkLxcv91WoFJsLmjQO7j9MgCAU/?=
 =?us-ascii?Q?1t9U+G0cX5FMI03FwDou8NKJq4/nvgMx9jSzONJXLBE3fMicc/mKQeIjnenF?=
 =?us-ascii?Q?FCh75Rlj1relZIeAUUem/OPetBqJ0VGf+521QXJIZercjXy0ERXwzzoGrx1z?=
 =?us-ascii?Q?k1tQRnBYWUCiPxp98EtcMwgwrM6qyhohOKuOxvlWMujrygx6z5NrF/RRsGT0?=
 =?us-ascii?Q?qLc0XesUaDz5R4WatLRuFwh0R+35NfvG6foSEsX2L/mFcsxvJXZ3l9VqorOM?=
 =?us-ascii?Q?3nXaMG9A+6Q0+3LSszXNuYeOFupwN0yQacOFCFz31pAyAefF4bz2C1oYeRzM?=
 =?us-ascii?Q?eWIb8HTFfaoyFIS+o0HGDXXDcEfvcoxaIGWXH+w4FUAoFCxLYLN475N73eTZ?=
 =?us-ascii?Q?7eE1D7ZQ49tqRV85+wMfrAz/WsNSg2ZXzTM+GuX9ilQdJrbUlwS13GVmmMiP?=
 =?us-ascii?Q?AvwYt1Q3hA4VMW0j/cNqjejirEqWBBKY2UAa4A8Gz3lFZbcA0EuHItUSGN5e?=
 =?us-ascii?Q?uPcvf8wmQOBsLkC1lpboSIEXIjc4JL3uwnpdpivKNRC4+7+Iq65WX6wW5Wev?=
 =?us-ascii?Q?mcfSQLUMTrbSHLo1O45OcNGb5CaIM8d8RPPkd3xpVzk/HsUape4vZCIB4RUV?=
 =?us-ascii?Q?c5siF1jGBwQuUrbr9/iPo3hMTvE5orWQKqTQjoonBB3bsS1U6ZY/PajWS+XQ?=
 =?us-ascii?Q?ZhTJcB+XAA9XPLXV0ILT/uA/bebP1wrX9j5W7VyoXNCSaiWaJg9/sWGu85K5?=
 =?us-ascii?Q?1GNkqdnSVZIXNKc0Q0skLgnh7i3lYY1iGkaVyGLqW6NhGRjO5YfNl9yDe9Yy?=
 =?us-ascii?Q?O5iRmcrYqmRdHHaeGedvYK3UgIc1TK6QIulspONWlvgGbzq6yNt6s19oQ7rF?=
 =?us-ascii?Q?AAU7uc3ZfTcU/F9aIc5Su7Q6scRTBTu9G4XMW+3ny5eGud5UuZ24bDQ4GJFx?=
 =?us-ascii?Q?uJsGZx7cdD+R27jR67J/CulAIiMU53w1kskRmcGe5VDCjvNF4cBaBlHESyC3?=
 =?us-ascii?Q?5NZMmA0UOzs8SV5iW5DElz0oUwGxydIjNbtvb4UepFUicp82gcZ40BlWBQ+p?=
 =?us-ascii?Q?7eBPEk5ORdu87TvM4pZ+ectR3PYNUzIlAGQA5017MsqMCJdMN2S4ThoiFPRG?=
 =?us-ascii?Q?Gm3gIKXi7ONTwdNJ3xgFnTAEYjQ4hyw20JpBViQoUrVJiXD6HWpm0/QkYCku?=
 =?us-ascii?Q?IdVAkL7WjY4wpsdQM63l45MAIVZIyMo9Q96+km2xe6auxFZCEqhe+UYHWPvD?=
 =?us-ascii?Q?UwvoqjBMZuU20SDSAVEaUq0y98q+3JvwAdRQQPIfiwRZP+VYbYygDkdtQLA5?=
 =?us-ascii?Q?JoHMjH74r5ZJXhPaQC1hze7DSSuh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eTyBu/Lsc/Bms2Qgl2LPjPboywMBuAa7CoPQ1hQE7mAKIto644IyWQcfC2fg?=
 =?us-ascii?Q?RF1RFltSLqv8UfmBK29LvG3SO2FraJXLUErPABAy4UlANYXTw0wzuXygm0Cz?=
 =?us-ascii?Q?h4sW3c+3Vaz0f98EI5CWDYvXu8bHqg7wck+4LUIR4dC/YKhHfZpkzeuKa962?=
 =?us-ascii?Q?K3J1+6+4U67VyZguwDe/aZgzhYUNuMPnCmpxIqny21bhIB8Ln8aP4lttkoa4?=
 =?us-ascii?Q?nYasTQRBJ+AGFXCrVOlEsdHHBHdED2qvCPQBalQ2FpBqQjSwQs5O3sjOboQb?=
 =?us-ascii?Q?0l48XFKzXk6o9ALSQg9TbcPHzwkk807fQ+Fy3EWLlXDeKuY92ujBGLtYU1Jf?=
 =?us-ascii?Q?Iv6SnOJ19LtpyfZnx/QeCF9cOTp57ZzE5hUbPWGUuzh1iSi5j+AkU1bj515m?=
 =?us-ascii?Q?2z9RRr75cXaFbpA1XzQuEXRzZwlhZHfnvIDYVYpK5bXyfjHKIlDatzGkL3mP?=
 =?us-ascii?Q?vSnQHXRzc3kNcem+Xbm47xV28CaoZk87ldOF1ivBh9MpAs0vPw1FLG8iZXaY?=
 =?us-ascii?Q?ULEwCeJitYfu468HBLMaBUxUEHP7LzUcuFdzYcOIXGpm1Foyr/qx85QlAQLW?=
 =?us-ascii?Q?7Hza3KWLFvS7n+INNySyVWF26Oi2a3YjHHnJiT41m1YFPcVsl80tVlXozN4K?=
 =?us-ascii?Q?WEuH46akynHQEIJWQBs32J49OnTjNqOz0NbYcByi0JAibJn+duByyyTBsR4P?=
 =?us-ascii?Q?8Ie0G/Um9/+kwc087sUgdFPzn/h/sdxNPTl1nL7YUWxmPHjo+HxB7Ex0I78f?=
 =?us-ascii?Q?zN7FamB450it4YKWSQN7C44v/UPw2R3kr1FwtoFDGRSFY8h8V1x3KRgUp70G?=
 =?us-ascii?Q?W48omm8pts8x756EvJG3+k5BqI2vc7xlAlNqU6sB/2eU+nWOsjyPsYbBiN+d?=
 =?us-ascii?Q?HtgWjLmaQBm2waVOsbn+Ph0D1j2UfUGiIXpVXufi1hHtMi4tXZ0YTJVzrOOa?=
 =?us-ascii?Q?QflgI1xTitR53ImL+QIo/mUza58ltMJ9lXEMD4Onw2/kNN6JInDcd3DqqlIH?=
 =?us-ascii?Q?i8XLwDBtEaCq+VqVZfCP7bsnaf1hYYJYQJtrThWJn6d728SR1ldwyGHIsMhp?=
 =?us-ascii?Q?hn+qiE44zwkwnDjaAVK0KBS4csYA0zbS8VwiKv29l0iVuk6ToRJbARhhYHlB?=
 =?us-ascii?Q?5911S7AvMApH9wFZXXTa25QMo8J8ZhONk9Dz1fTOmlIj2jKHrsubb2oJqyjK?=
 =?us-ascii?Q?gSHoYHgGWyvdKIRlyQQsGuNXP1DyVNjF/rKSr6Y7a714B11DVH4Xwi9ozEY/?=
 =?us-ascii?Q?a7XxF4Stsu9kUH/x+nswnAcpv5ig/4gJgHx4eBgGvf6Lb1FgI8uyflNRJtnm?=
 =?us-ascii?Q?g9HeKtpXnC1MhjEEl0K8Kl0hrJpVgG7HGOG06Stg5pjMbJCv6+OJp/l36mMJ?=
 =?us-ascii?Q?d/yFVhTkP47VlcRfOwEdoerf0pr6e93hik38uXny7t3671ee1nEPflYlIggS?=
 =?us-ascii?Q?7hUkju9Eg9du6yCxkcQslKqVhTk3Y4mDRBKInH1OAh8WYuTILTIpByhy4TZp?=
 =?us-ascii?Q?xtJF91fPezUo9mQ7r+C9/UVxGs4y/gEQVXKrKKfqpfqSGQSQ5ERKmzUjLq7G?=
 =?us-ascii?Q?XZBZ9vW2wxLKsLykpbEBzeHWh1LQLopU4HBoDM+rF8pNYaKGr6SaXFz5O7YF?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0148b7a-7e54-45bc-5f74-08dda98e3165
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 08:50:33.6806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMtla1o3UIsK6vCoyR7fnqlkTCTGQQcg70IbTIB5192/k5ZBZ3ro/eGURT8kgwqqwwnLr+NUq2emWHQ+OOfrr5uoPT8wCbjuND8LLXbJ1xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4954
X-OriginatorOrg: intel.com
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 11, 2025 at 11:25:21PM -0700, Eric Biggers wrote:
 ... > FWIW, here's what happens if you try to use the Intel QAT driver with
 dm-crypt: >
 https://lore.kernel.org/r/CACsaVZ+mt3CfdXV0_yJh7d50tRcGcRZ12j3n6-hoX2cz3+njsg@mail.gmail.com/
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uPde3-0005Wv-Op
Subject: Re: [f2fs-dev] [PATCH] fscrypt: don't use hardware offload Crypto
 API drivers
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, Simon Richter <Simon.Richter@hogyros.de>,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 11, 2025 at 11:25:21PM -0700, Eric Biggers wrote:

...

> FWIW, here's what happens if you try to use the Intel QAT driver with dm-crypt:
> https://lore.kernel.org/r/CACsaVZ+mt3CfdXV0_yJh7d50tRcGcRZ12j3n6-hoX2cz3+njsg@mail.gmail.com/

/s/happens/happened/

... and it got fixed
https://lore.kernel.org/all/20220506082327.21605-1-giovanni.cabiddu@intel.com/

Regards,

-- 
Giovanni


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
