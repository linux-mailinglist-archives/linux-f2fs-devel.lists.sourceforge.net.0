Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHB+GgbiqGnzyAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 02:53:10 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8B320A055
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 02:53:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfSjGjkpHg1cDp6tPTT+17+B734+4szvLYBs90URM90=; b=ceMxE6zRl37Hg/5PFVgBkNBgSc
	+2wrRZaDbA41UG9W2DP0UsnoT1E0E9j2pXEcCLXxO3TEfZ0mo5I5kdkqHd1e6xeO3mbCmP63ltbAW
	m7cjHK0dgXKmVe+d+zGuhMifB4cfmDx/VwZN9QDLKwA2u0k7H2LGI3HOr3fSgWEjvPW0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxxtf-0004hh-DF;
	Thu, 05 Mar 2026 01:53:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=517a9caaa=shinichiro.kawasaki@wdc.com>)
 id 1vxxte-0004hb-P3 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 01:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gULLsm+JLhhfGPk47pqqyMi0eBKBs9cjVjRVG/V43Jo=; b=GFuAm+tUXNlHdN0Wvcg/p4JnvP
 w+5iGPnpKnEE+Q1wsABZTnwXixP/77U7plZEQAFKw5CBQLSo+5UoMsdHCJCx15w8ljXcknWsMjDw0
 eygy+GNlYDds7+QwtHvNAmdaVOte0SK/begKh+D3+DTjPzDUfx20qRBNDREwHgmDNg+4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gULLsm+JLhhfGPk47pqqyMi0eBKBs9cjVjRVG/V43Jo=; b=YjQ2gQNQ49M2mtRjRaShFEyqJC
 9pyi7OmYG4oBoAFvgPxJ/2gKSMyKfIsvh0Mj1gHIGOfmMF7WJSNPTE8S88fGEvFLzmrUMw8jiRrkw
 vlIcY57OLbWvNxxVuyelA7NY67809JpH3kuiUVz6MT6awYcloTZ3flnecpA3jD6D1IuQ=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxxtd-0004pw-NZ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 01:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1772675581; x=1804211581;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=o4Ns/TQXqMUNy7xuj0uo8/Jr/jzVstZ6BcfPhBTjiac=;
 b=KluSvpsSQcWGKrpUil/sJy6ROqcjs1WrLOrrtdQdpCEKIQkY7mflYfvk
 xmS+1jMKcGCqJB/NKhNkwuE8bTatndRx7t2jFeawtf/8iE6jFVoHKjjDa
 s0WwshXvS8EF6fawHj8FOxbDoHeODoLRphRx9ofvyX1seTUmmrnRS0S2a
 kzZdLv5qh4CzwoAZw7vASOyPENkRtGxqI7Uv0sr5oKVzc/3jUoE93Pl3z
 nljy6FfRYMN4monYgkzTuUaxAlUaFn5j0r2Xym7zENnquNnTgg+WJdvQx
 q42gqfH4kiWpQ6VVraZbH3PW/y1ceS1rHqHtJGeJOkZ7H/neJfYeBIUKe A==;
X-CSE-ConnectionGUID: Di2GY942TMyhPLgXHvfWGg==
X-CSE-MsgGUID: bv2AFi6KQnS8+9YI0yixXQ==
X-IronPort-AV: E=Sophos;i="6.21,325,1763395200"; d="scan'208";a="138315800"
Received: from mail-westus2azon11010057.outbound.protection.outlook.com (HELO
 CO1PR03CU002.outbound.protection.outlook.com) ([52.101.46.57])
 by ob1.hgst.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Mar 2026 09:52:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QV5apILcMzcN5REEAlbLPyB6bk3MixiyZOneUEdhnypVfr4AkOpcU0iIJcEone9K6YQzJpOfIqJzK1NHe/0PlCM6dkSRPbiWyS0/LriuvLhBk998Pw+cvgqLNkmhlvRywavEIFARIkizzYIP9GHpBuyYDFCH/uzlDVX3XUAF4dVIY6jatOp76xfHctOwwlIukbPxtEv/OsyJukOw8CfG1s7mBzdIMjwOopuvmuFQHg+NY8+z6gG2CAaW8X5eKZJh0w7m/hZdUYKZgCg6Jq9R6yoyzzZ/uioa7PjUaoivyBo8VqFo5pcD+FJFg5/YjM19v8ArxHKHhPDXVtnPqNf+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gULLsm+JLhhfGPk47pqqyMi0eBKBs9cjVjRVG/V43Jo=;
 b=aZuwk18um42b1UPHd1+PKt3/QPg1V/knKi+7tz49wPEz12nub9YLjSCa8+/jx3zJQgFIHeuQefqIY/9gBxowS3XUgYmrsBw9Gho0RnT78PTB6z7zHLqbl66JoFx7RqGcZm2CM9p3NczxRi1w+oyTG7IS8WL+H+Nv5n83UrH2aAMLc0w3YaCV+tWGgLub/Y+W74FOdwXNZYahx/VffLgv3m5brDhdfNFqCdkun4YODifFXSa2tPYDtLz9JVpmzkChbu4HDiLkP4K24jZakWoZr4LC9QN9Gf2xGBzxAGafm8n7lMfXv49tYfl/6GV1Xp6XZxjbPVd7cKKJDMTP2tOdRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gULLsm+JLhhfGPk47pqqyMi0eBKBs9cjVjRVG/V43Jo=;
 b=uCJwNo7auh170oLsGxCx14OQHH7TMVOjwhl6m9SOa37agKofWm6w6NALnsOGKeJb37GerFPNxaWraSHRcFsZ6P7HhxCO/fK/DIhP05MsD1cY9FeCXYJkkcFPYykw4d3nHyATqWaB/NsicQz4hohBN37Y+WPiERUuI15IjTwHnM8=
Received: from SN7PR04MB8532.namprd04.prod.outlook.com (2603:10b6:806:350::6)
 by CH0PR04MB8052.namprd04.prod.outlook.com (2603:10b6:610:f0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 01:52:49 +0000
Received: from SN7PR04MB8532.namprd04.prod.outlook.com
 ([fe80::ce42:7775:2df8:8729]) by SN7PR04MB8532.namprd04.prod.outlook.com
 ([fe80::ce42:7775:2df8:8729%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 01:52:47 +0000
To: Chao Yu <chao@kernel.org>
Thread-Topic: [PATCH v2 1/1] f2fs: fix lockdep WARN of sbi->cp_global_sem and
 q->q_usage_counter
Thread-Index: AQHcoNWEWBcPYygC7EirE0kirNCd/LWROPsAgAAzDYCABaKtAIAG1l+AgABCeoCAARgzgIAABBoA
Date: Thu, 5 Mar 2026 01:52:47 +0000
Message-ID: <aajhnCU8KjUaoCl_@shinmob>
References: <20260218125237.3340441-1-shinichiro.kawasaki@wdc.com>
 <20260218125237.3340441-2-shinichiro.kawasaki@wdc.com>
 <aZ0aVDSWpRRqFwl9@google.com> <aZ1C-Cdrwoxp0VCJ@shinmob>
 <aaH_XCGbYOt6dpba@google.com> <aae5x_9gpi7utuf0@shinmob>
 <da969409-ce10-46fe-8620-b0dfb0cea201@kernel.org>
 <cb8b545f-0bbc-4747-a2ce-7432fa1e6ef2@kernel.org>
In-Reply-To: <cb8b545f-0bbc-4747-a2ce-7432fa1e6ef2@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR04MB8532:EE_|CH0PR04MB8052:EE_
x-ms-office365-filtering-correlation-id: ac361758-7f93-4f10-afec-08de7a59e6ac
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|366016|376014|38070700021; 
x-microsoft-antispam-message-info: 661S26Str1OjlG/SXbEDlsaV/LjDRlXiSVdHbaN3fEg5+ugs/wqyuDagEJ7MoVZhJAtIT8gT5X7aY5NjR9968RnQEeKUm8RxBN2ROeCXYE0R3TeiZVFnSGvGDW9GZTagXrJsSaijjyIfef9dZd6hTuyYFnRT0+7MqeR6bey7Gni/897AEQsyuKgMp+maaUo3Vd9C+Y35aPHL3pxESRCAFo/y1jFmB+QuV7EpKV5Jkr5YkBLv/5Lo5/H9OUhztUNQBDV3DAqIWRvpXVD7jHk8OuT6sjul8LW2Qkp1/Mj577xZHxNcPZ3mIN+zAYCpYuCXUyNmtTGkZ61aCO7c5ws2gDgxZ7HsgbjElTDVamFwLkcGUSXU9xGwlzRGUTi3zFFpEol3FpU6ebKiiTB8m/p6aFlIlkuP9wYeaPOgtcHBR9R1JO6W0ejmwdtOkMeBYCK15f1gsiUpwfR/EFEp3lzH/FPGA97Hb5g3KbFqwHtTt7Pkfk8Pfe/Q4vU8atOy0O0+de4M9bNV6aPDl2h2UVW/SYmEhljutVcCF8M80+eYBnmB1KSaObXT8R9ttVZqhW8nX0nY0uRYbyMtCQoQbCveKqO/DaoSs9bKKE6X2leM76gu5WmRFQzhuK7Lx5ocQij/SlmfHB3zXrVqFx0YpSwH4yqlRqm9FF3/Evu1fwFw9m2nxNZeVqTfyCiMKNNivbeJ+hzqY1j67wPPaFygMGRg5KQORth2uAirtUW215kzqgewf1GKkjB+EFPLcoKo2sx/bwpMjLpX8DD003BNYYHsejartiHUvheOhae2/8c0QhU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR04MB8532.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?1sxViDwq/A1RWVxjpMjhNmDlTQwbnxBTHZ8OETJ55uRlLCdCYqrhI+N4yC?=
 =?iso-8859-1?Q?RGr6vNznl4yG/ENsOIIYjbtkcWN9JrvDbjcXm4sfYvem0CC1GkaQL8W8ZU?=
 =?iso-8859-1?Q?63BODsq02USvXROVTSDDLxG2XLOJJ0TEiNSuc79ScYt0rU6rX//+PTtjGa?=
 =?iso-8859-1?Q?y1D2WhaJ/IDjrF35lCyrEU26RvtiP7R1xbP/q4cyJFCUbHA8joJs16TuJw?=
 =?iso-8859-1?Q?M8qP+h229brCMamSAxy9YTcXpx8DF45KBGSk/VdYYFVx8foGvYVI6HijUI?=
 =?iso-8859-1?Q?BdVpW0+VB2qdp5dgsC+YCVHjG1l2KROj7Ab67VgIfpW3FRY/V0sUgMHJPu?=
 =?iso-8859-1?Q?OA+29y9FpIYz64DHB1COQ19FqcxpI0ac/d6Ra1CUP/X7dB2o5ddfTjdLAd?=
 =?iso-8859-1?Q?ILiwZoRNfWS6EUWtEbMnETKoohpYxy+LcPGhh62h4BrQ5OV4iTWcdTbvCq?=
 =?iso-8859-1?Q?gjPRAJRf94oG2reRkyvJUmQ6ro+hXAd31ZLi9Gi19BlT7+lCylSyWsbk+4?=
 =?iso-8859-1?Q?V08/2OzL8HI5KtbTceScCqVaO91nSC8ePsUHyfA0VQVrx6/yx4VLrWsMgz?=
 =?iso-8859-1?Q?Hx6tGTSInJFbh8d8RqCPZfOwGHkTijrWPyuX+gtr8KtpAzz5KEA8gr8r2U?=
 =?iso-8859-1?Q?twT4pkrCRJyXxIOWK8uqN4nUCEK6KvI86f/F6jCgCLA9ymHUwqzmQsT6Cn?=
 =?iso-8859-1?Q?tvQ3J6+WREEJVedSbd5AhD/c4IOUPbngJ2mRXoS/HrOJbwgH0a9F1Q5R9h?=
 =?iso-8859-1?Q?+e1u/cq4jiwXEK+LuH6sDGQ44q0bAclFXRyPaC4i077iHiOlhQgVIELCui?=
 =?iso-8859-1?Q?lZQGiwYy1GOGRYWGX/hKtbn3vJYHDM4/pfKWJv8acMBe2V1IvkeOiZ/5LC?=
 =?iso-8859-1?Q?zwOvCc9NJ9z9NYjEv3WTWT16QxIiftXZeOGMJ2Wx3u3Yy8Q2pobA9ajtp+?=
 =?iso-8859-1?Q?itE7wQDIkx+6PMS/jnjUDpLXmB5TMhFOEa15miPAeJSiuym4r+fZZhTrE+?=
 =?iso-8859-1?Q?etPc8Vrw1Jt2SgGD409u3UtVpcPtX7UYmK9lNl+QW4xheO7aDvsW7nSHpJ?=
 =?iso-8859-1?Q?AI8pjeP25Gil28yzOEAorqgMrZ6FdV0zIcT72ALqICWwtxY5ykmezwNBUz?=
 =?iso-8859-1?Q?MaTaEJOUXUtfxKoQdhW8X9dAwEH2RQaLvw4SGJRWnIlO1QZk2nwffUGgUE?=
 =?iso-8859-1?Q?2nsYB/npYZfBy9Zyze6YW/IJY91cSJbvHo7xa8VyJijmEWx91/dLI5qNn4?=
 =?iso-8859-1?Q?tbhCbDSPIMaIZmqR1YAZmGbJV1fs4/z+bJBYdNfqIDunzESKy5OftHyQ/3?=
 =?iso-8859-1?Q?ze4Nhpqt494+/9RQSJRTTzNvhjpX2WQZxwrOoYQF+jlQ4Cf7nK0q+hubxd?=
 =?iso-8859-1?Q?IpN+Tu66gfOweXKbsjirYK762JokiujS1XKPylmnGoeCD+Npp9XHdsvwyT?=
 =?iso-8859-1?Q?rXSOhjpP9tocXg5SndaTaLwavKNLqlT/1XwiPshZwkztx/qz3mbqwf629f?=
 =?iso-8859-1?Q?VBrmYG2i4nA+a9Waiw9sj9c/Obaqv+CsrKT1oowDKm8D9eKweAGpPOXdCQ?=
 =?iso-8859-1?Q?WB9xknROqiOryLdtRt3JG1eXz31bLi7a/1DgsBPpXhIeKFjR3JnXWlCmee?=
 =?iso-8859-1?Q?iYS8Yiy9oBH9X5BXC2Mh+MGEcNVQx8Czbz2f/wyyigS63DGDMqf4Mlr74k?=
 =?iso-8859-1?Q?2QXYvHKb9SeKuKEHe3hGAxs0DIEs0pdJbHOH2DWlDw8CmxBMQgWyl5VeTg?=
 =?iso-8859-1?Q?gDEF2mTJXAMfay69rsjJDH/nQ9ZhgqmkiZ7Sxxj/GtVhesAn8B5xseH3cj?=
 =?iso-8859-1?Q?nCN4gTsiyEUl7X2faEdIhcSs3hp/s38=3D?=
Content-ID: <98D0F8B2155EB143BCDA32AD3C02D388@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 9EhXwai3xNRgHzhOYnM0v8MdQ+TMS7udpOfiHSknixcqRybitCXf3M3r5KbV1lwRiLCOyQoKLW6+lmr6RZpEgylTyu34aPPH4/K1eSnDKCJ6pXK4Jq84JyRTbdkjbGO3d8EHEU4wBurHMTjc/rrAVnZKtYuB6yLlMdEYpnvTeHiTNARTQXTBQOAp+s7Lmg8XkqEdQiLTCzwBE6u8UWR/U4E+/MofcYISJwnlAxsZraBcJJAMHwTEdHmiL68rxI7D3gnU/UUYHQPNZM6EMc/4y0t6CtFU41CO57tPv+6BdENN4LiS6+J+dPtNZdUcMzOlqkUgAA2qd+u0nqFuTSpugMtLYb5GCtNi9Ly1uuE+ZgcSyuXqGHrYtgppYANwqexljQuD+Z8zlh3vtCSijpCu0kaW3PHgnuEgrZWS3hXjWyqUhgETU9jcHRhEr7HB60MpPyNTRD57UoBumrROjHHU1GXPNrHV6Hea+Z8IFte3pqgpzOjt9R7/m01SS2MH0C3svw5Wk1w98F/4PzTvUcDgtINmKJHzKaYi9xi7aJKuqBNmA95tTeSz2eYe6IH4im92rwHP8qKuvO5xJVrlpu7pIfpbohHxQsqFO189TDvzADZHd2dfuuUkXioND9iwA3Zc
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR04MB8532.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac361758-7f93-4f10-afec-08de7a59e6ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 01:52:47.3516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jmw4yhlAsUqFKOuEdvUV10y4JFtibpu+XEfpw5aJU8MvogtJBIDHdIotejGX1QXyqIYTWh+gGn6SaC2tTQK71Pe3OwhcQL9nHeisL2kqVIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR04MB8052
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mar 05, 2026 / 09:38, Chao Yu wrote: > On 2026/3/4 16:55, 
 Chao Yu wrote: > > On 2026/3/4 12:57, Shinichiro Kawasaki wrote: [...] >
 > > I will seek out other ways to avoid the lockdep. I have no ide [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [216.71.154.42 listed in list.dnswl.org]
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1vxxtd-0004pw-NZ
Subject: Re: [f2fs-dev] [PATCH v2 1/1] f2fs: fix lockdep WARN of
 sbi->cp_global_sem and q->q_usage_counter
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
From: Shinichiro Kawasaki via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 8F8B320A055
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:dlemoal@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,wdc.com:s=dkim.wdc.com,sharedspace.onmicrosoft.com:s=selector2-sharedspace-onmicrosoft-com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[shinichiro.kawasaki@wdc.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,wdc.com:-,sharedspace.onmicrosoft.com:-];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

On Mar 05, 2026 / 09:38, Chao Yu wrote:
> On 2026/3/4 16:55, Chao Yu wrote:
> > On 2026/3/4 12:57, Shinichiro Kawasaki wrote:
[...]
> > > I will seek out other ways to avoid the lockdep. I have no idea how t=
o do that
> > > at this moment, though.
> > =

> > Shinichiro,
> > =

> > IMO, this looks like a false alarm of lockdep, what do you think of thi=
s fix?
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?=
h=3Dbugfix/syzbot&id=3D3b19564b95e9ba9803ef30e90eace0977b9d140d
> > =

> > ---
> >  =A0fs/f2fs/f2fs.h=A0 | 3 +++
> >  =A0fs/f2fs/super.c | 3 +++
> >  =A02 files changed, 6 insertions(+)
> > =

> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index bb34e864d0ef..5b400e99f332 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -2042,6 +2042,9 @@ struct f2fs_sb_info {
> >  =A0=A0=A0=A0=A0=A0=A0 spinlock_t iostat_lat_lock;
> >  =A0=A0=A0=A0=A0=A0=A0 struct iostat_lat_info *iostat_io_lat;
> >  =A0#endif
> > +#ifdef CONFIG_DEBUG_LOCK_ALLOC
> > +=A0=A0=A0=A0=A0=A0 struct lock_class_key cp_global_sem_key;
> > +#endif
> >  =A0};
> > =

> >  =A0/* Definitions to access f2fs_sb_info */
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index 8774c60b4be4..9e85f31fa828 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -4948,6 +4948,9 @@ static int f2fs_fill_super(struct super_block *sb=
, struct fs_context *fc)
> >  =A0=A0=A0=A0=A0=A0=A0 init_f2fs_rwsem_trace(&sbi->gc_lock, sbi, LOCK_N=
AME_GC_LOCK);
> >  =A0=A0=A0=A0=A0=A0=A0 mutex_init(&sbi->writepages);
> >  =A0=A0=A0=A0=A0=A0=A0 init_f2fs_rwsem_trace(&sbi->cp_global_sem, sbi, =
LOCK_NAME_CP_GLOBAL);
> > +#ifdef CONFIG_DEBUG_LOCK_ALLOC
> > +=A0=A0=A0=A0=A0=A0 lockdep_set_class(&sbi->cp_global_sem, &sbi->cp_glo=
bal_sem_key);
> =

> Sorry, should be:
> =

> +	lockdep_set_class(&sbi->cp_global_sem.internal_rwsem,
> +					&sbi->cp_global_sem_key);
> =

> Thanks,

Chao, thank you very much for the idea and the trial patch! I will try it o=
ut.
Let me have a day or two.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
